moudule stm_mou_top (
  input         clock,
  input         reset,
  input  [1 :0] io_eth_mode,
  input         io_enable,
  input         io_suspend,
  input         io_send_mode,
  input  [31:0] io_send_count,
  output        io_send_done,
  input         io_pkt_len_mode,
  input  [15:0] io_pkt_len_init,
  input  [15:0] io_inter_frame_gap,
  input  [1:0]  io_payload_mode,
  input  [47:0] io_da,
  input  [47:0] io_sa,
  input  [15:0] io_etype,
  output        io_tx_en,
  output [3:0]  io_tx_data,
  input         io_total_send_count_clr,
  output [47:0] io_total_send_count
    );


eth_pkg_top eth_pkg_inst (
  .clock                     (io_clock),
  .reset                     (io_reset),
  .io_eth_mode               (io_eth_mode),
  .io_enable                 (io_enable),
  .io_suspend                (io_syspend),
  .io_send_mode              (io_send_mode),
  .io_send_count             (io_send_count),
  .io_send_done              (io_send_done),
  .io_pkt_len_mode           (io_pkt_len_mode),
  .io_pkt_len_init           (io_pkt_len_init),
  .io_inter_frame_gap        (io_inter_frame_gap),
  .io_payload_mode           (io_payload_mode),
  .io_da                     (io_da),
  .io_sa                     (io_sa),
  .io_etype                  (io_etype),
  .io_tx_en                  (io_tx_en),
  .io_tx_data                (io_tx_data),
  .io_total_send_count_clr   (io_total_send_count_clr),
  .io_total_send_count       (io_total_send_count)
);

wire [3:0] rgmii_tx_data;
wire rgmii_tx_en;
wire rgmii_tx_clk;
module rgmii (
.rgmii_125m       (inner_clock),
.rgmii_125m90     (), 
.reset            (inner_reset),


.RGMII_RX_CLK     (),
.RGMII_RX_DV      (),
.RGMII_RX_D       (),
.RGMII_TX_CLK     (rgmii_tx_clk),
.RGMII_TX_EN      (rgmii_tx_en),
.RGMII_TX_D       (rgmii_tx_data),


.gmii_txd         (),
.gmii_tx_en       (),
.gmii_tx_pktlen   (),
.gmii_rxd         (inner_tx_data),
.gmii_rx_dv       (inner_tx_en),

.crc_error        ()
);
