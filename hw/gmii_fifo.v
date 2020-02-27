module gmii_fifo (
  input              resetn,
  input       [7 :0] gmii_data_in,
  input              gmii_en_in,
  input              gmii_rx_clk,

  input              gmii_tx_clk,
  output wire [7 :0] gmii_data_out,
  output wire        gmii_en_out,
  output      [15:0] length,
  output             crc_error
);

parameter IN_IPG_MIN = 'd7;
parameter IN_PKT_MAX = 'd1600;
parameter IN_PKT_MIN = 'd64;
parameter FIFO_ALMOST_FULL = 11'h3ff;  /* 1023 */

//---- delay ------------------
reg          data_en1;
reg   [7 :0] data_i1;
reg   [15:0] len_cnt;
reg   [15:0] too_large_cnt;

wire data_en_pos;
wire data_en_neg;
assign data_en_pos =  gmii_en_in && ~data_en1;
assign data_en_neg = ~gmii_en_in &&  data_en1;


//---- pkt too large -----------
reg  pkt_too_large;
reg  pkt_too_large1;
reg  bw_too_large;

wire pkt_too_large_pos;
assign pkt_too_large_pos = pkt_too_large && (~pkt_too_large1);

always@(posedge gmii_rx_clk or negedge resetn) begin
  if(!resetn) begin
    data_en1   <= 1'b0;
    data_i1    <= 'd0;
    len_cnt    <= 'd0;
    pkt_too_large <= 1'b0;
    pkt_too_large1<= 1'b0;
    too_large_cnt <= 'd0;
  end
  else begin
    data_en1  <= gmii_en_in;
    data_i1   <= gmii_data_in;

    pkt_too_large1 <= pkt_too_large;

    if(gmii_en_in) begin
      if(too_large_cnt == IN_PKT_MAX-1) 
        pkt_too_large <= 1'b1;
      else begin
        too_large_cnt <= too_large_cnt + 1;
        pkt_too_large <= 1'b0;
      end
    end
    else begin 
       too_large_cnt <= 'd0;
       pkt_too_large <= 1'b0;
    end
   
    if(gmii_en_in) begin
      if(pkt_too_large) 
        len_cnt <= len_cnt;
      else 
        len_cnt <= len_cnt + 1;
    end
    else 
       len_cnt <= 'd0;;
  end
end

wire       crc_en_in;
wire [7:0] crc_data_in;
assign  crc_en_in   = gmii_en_in && (~pkt_too_large);
assign  crc_data_in = crc_en_in ? gmii_data_in : 'd0;


wire crc_flag;
//crc_check crc_wr (
//    .resetn       (resetn     ),
//    .gmii_rx_clk  (gmii_rx_clk),
//    .gmii_rx_dv   (crc_en_in  ),
//    .gmii_rx_data (crc_data_in),
//    .crc_err      (crc_flag   )
//  );

//---- eth data ---------------
wire [8 :0] dout;
wire [10:0] rd_data_cnt;
wire [10:0] wr_data_cnt;
wire        full;
wire        empty;
reg  [8 :0] din;
reg         wr_en;
reg         rd_en;

fifo_dport_9_9_2048 data_fifo (
    .wr_clk        (gmii_rx_clk),
    .rd_clk        (gmii_tx_clk),
    .rst           (!resetn    ),
    .din           (din        ),
    .wr_en         (wr_en      ),
    .rd_en         (rd_en      ),
    .dout          (dout       ),
    .full          (full       ),
    .empty         (empty      ),
    .rd_data_count (rd_data_cnt),
    .wr_data_count (wr_data_cnt)
  );


//---- eth length -------------
reg         wr_vaild;
reg  [15:0] len_din;
reg         crc_flag_r;
reg         pkt_crc_flag;
reg         len_wr_en;
reg         len_rd_en;
wire [15:0] len_dout;
wire        len_full;
wire        len_empty;
wire [8 :0] len_rd_data_cnt;
wire [8 :0] len_wr_data_cnt;

fifo_dport_16_16_512 len_fifo (
  .wr_clk        (gmii_rx_clk    ), 
  .rd_clk        (gmii_tx_clk    ),
  .rst           (!resetn        ), 
  .din           ({pkt_crc_flag,len_din[14:0]}), 
  .wr_en         (len_wr_en      ),   
  .rd_en         (len_rd_en      ),  
  .dout          (len_dout       ), 
  .full          (len_full       ),
  .empty         (len_empty      ), 
  .rd_data_count (len_rd_data_cnt),
  .wr_data_count (len_wr_data_cnt)
);
//-------- wr fifo ---------
reg [3:0] in_ipg;

always@(posedge gmii_rx_clk or negedge resetn) begin
  if(!resetn) begin
    wr_en     <= 1'b0;
    din       <= 'd0;
    len_din   <= 'd0;
    len_wr_en <= 1'b0;
    wr_vaild  <= 1'b0;
    crc_flag_r<= 1'b0;
    pkt_crc_flag <= 1'b0;  
    in_ipg    <= IN_IPG_MIN;
  end
  else begin
    if(data_en_pos && (in_ipg == IN_IPG_MIN)) 
      wr_vaild <= 1'b1;

    if(pkt_too_large_pos || data_en_neg) begin
      wr_vaild <= 1'b0;
      in_ipg <= 0;
    end
    else begin
      if(in_ipg == IN_IPG_MIN)
        in_ipg <= IN_IPG_MIN;
      else
        in_ipg <= in_ipg + 1;
    end

    if(wr_vaild) begin
      wr_en <= 1'b1;
      din   <= {data_en1,data_i1};
    end 
    else begin
      wr_en <= 1'b0;
      din   <= 'd0;
    end

    if(data_en_neg && wr_vaild) begin
      pkt_crc_flag <= crc_flag_r || crc_flag;
      len_din   <= len_cnt;
      len_wr_en <= 1'b1;
    end
    else if(pkt_too_large_pos && wr_vaild) begin
      pkt_crc_flag <= crc_flag_r || crc_flag;
      len_din   <= len_cnt;
      len_wr_en <= 1'b1;
    end
    else begin
      pkt_crc_flag <= 'd0;
      len_din   <= 'd0;
      len_wr_en <= 1'b0;
    end


    if(pkt_too_large_pos || data_en_neg)
      crc_flag_r <= crc_flag;

    if(data_en_pos) 
      crc_flag_r <= 1'b0;

  end
end

//------ rd FSM -----------------------------
reg       pre_vaild;
reg       data_vaild;
reg       ipg_vaild;

parameter IDLE = 4'b0001;
parameter PRE  = 4'b0010;
parameter READ = 4'b0100;
parameter IPG  = 4'b1000;

reg [3:0] rd_state;
reg [3:0] rd_next_state;
always @(posedge gmii_tx_clk or negedge resetn) begin
  if(!resetn)
    rd_state <= IDLE;
  else
    rd_state <= rd_next_state;
end

//---- next state --------
always @* begin
  if(!resetn)
    rd_next_state <= IDLE;
  else
    case(rd_state)
      IDLE:begin
             if((!empty) && (!len_empty))
               rd_next_state <= PRE;
             else
               rd_next_state <= IDLE;      
           end
      PRE: begin
             if(pre_vaild)
               rd_next_state <= READ;                
             else
               rd_next_state <= PRE;   
           end
      READ:begin
             if(data_vaild)
               rd_next_state <= IPG;   
             else
               rd_next_state <= READ;   
           end
      IPG: begin
             if(ipg_vaild)
               rd_next_state <= IDLE;   
             else
               rd_next_state <= IPG;   
           end
  default: rd_next_state <= IDLE;
    endcase
end

//---- state output ------
reg [7 :0] reg_data_o;
reg        reg_dv_o;
reg [2 :0] pre_cnt;
reg [7 :0] ipg_cnt;
reg [15:0] data_len;
reg        crc_rd;
reg [15:0] pkt_len;
reg [15:0] fifo_len;

(* keep = "true" *)reg [3:0] min_ipg;
(* keep = "true" *)wire      almost_full;
assign almost_full = (rd_data_cnt > FIFO_ALMOST_FULL)? 1'b1: 1'b0;


always @(posedge gmii_tx_clk or negedge resetn) begin
  if(!resetn) begin
    reg_data_o<= 'd0;
    reg_dv_o  <= 1'b0;
    pre_cnt   <= 'd0;
    pre_vaild <= 1'b0;
    rd_en     <= 1'b0;
    pre_cnt   <= 'd0;
    data_vaild<= 1'b0;
    ipg_cnt   <= 'd0;
    ipg_vaild <= 1'b0;
    data_len  <= 'd0;
    pkt_len   <= 'd0;    
    len_rd_en <= 1'b0;  
    fifo_len  <= 'd0;
    min_ipg   <= 'd0;
    crc_rd    <= 'd0;    
  end
  else begin
    case(rd_next_state)
    IDLE: begin
            reg_data_o<= 'd0;
            reg_dv_o  <= 1'b0;
            pre_cnt   <= 'd0;
            pre_vaild <= 1'b0;
            rd_en     <= 1'b0;
            pre_cnt   <= 'd0;
            data_vaild<= 1'b0;
            ipg_cnt   <= 'd0;
            ipg_vaild <= 1'b0;
            data_len  <= 'd0;
            pkt_len   <= 'd0;    
            len_rd_en <= 1'b0;    
            fifo_len  <= 'd0;
            crc_rd    <= 'd0;
     
            /* DYNAMIC_IPG */
            if(almost_full)
              min_ipg <= 'd5;
            else
              min_ipg <= 'd6;
          end
    PRE:  begin
            pre_cnt <= pre_cnt + 1;

            if(pre_cnt == 'd2)
              pre_vaild <= 1'b1;
            else 
              pre_vaild <= 1'b0;

            case(pre_cnt)
              0:begin reg_data_o <= 8'h00; reg_dv_o <= 1'b0; len_rd_en <= 1'b1; end 
              1:begin reg_data_o <= 8'h00; reg_dv_o <= 1'b0; len_rd_en <= 1'b0; rd_en <= 1'b1; end
              2:begin 
                  reg_data_o <= 8'h00; 
                  reg_dv_o <= 1'b0; 
                  pkt_len <= len_dout[14:0]; 
                  crc_rd <= len_dout[15]; 
                end
            endcase     
          end
    READ: begin 
            if(data_len == (pkt_len - 2)) begin    
              rd_en     <= 1'b0; 
              data_len  <= data_len + 1'b1;
              reg_data_o<= dout[7:0];
              reg_dv_o  <= dout[8];
              fifo_len  <= pkt_len;
              data_vaild<= 1'b0;     
            end
            else 
            if(data_len == (pkt_len)) begin
              data_len  <= 'd0;
              data_vaild<= 1'b1;
              reg_data_o<= 'd0;
              reg_dv_o  <= 1'b0;   
              fifo_len  <= 'd0;
              rd_en     <= 1'b0;        
            end
            else begin
              data_len  <= data_len + 1'b1;
              reg_data_o<= dout[7:0];
              reg_dv_o  <= dout[8];
              fifo_len  <= pkt_len;
              data_vaild<= 1'b0;
            end
          end
    IPG:  begin
            reg_data_o<= 'd0;
            reg_dv_o  <= 1'b0; 

            if(ipg_cnt == min_ipg) begin
              ipg_vaild <= 1'b1;   
              ipg_cnt   <= 'd0;
            end
            else begin
              ipg_vaild <= 1'b0;   
              ipg_cnt <= ipg_cnt + 1'b1;
            end
          end
  default:begin
            reg_data_o<= 'd0;
            reg_dv_o  <= 1'b0;
          end
    endcase
  end
end

//---- output ------------------
wire error_flag;
assign error_flag = crc_rd || ((pkt_len < IN_PKT_MIN)&&(pkt_len != 'd0)) || (pkt_len > IN_PKT_MAX);
assign crc_error = crc_rd;

assign gmii_data_out = error_flag ? 8'd0 : reg_data_o;
assign gmii_en_out   = error_flag ? 1'b0 : reg_dv_o;
assign length        = error_flag ? 'd0  : fifo_len;

endmodule
