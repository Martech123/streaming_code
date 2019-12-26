module CRC32_D4(
  input        clock,
  input        reset,
  input        io_En,
  input  [3:0] io_Data,
  input        io_Enable,
  input        io_Initialize,
  output       io_CrcError
);
  reg [31:0] Crc; // @[EthFcsPadding.scala 334:20]
  wire  _T_1; // @[EthFcsPadding.scala 340:32]
  wire  _T_2; // @[EthFcsPadding.scala 340:41]
  wire  _T_3; // @[EthFcsPadding.scala 340:36]
  wire  CrcNext_0; // @[EthFcsPadding.scala 340:25]
  wire  _T_5; // @[EthFcsPadding.scala 341:32]
  wire  _T_7; // @[EthFcsPadding.scala 341:36]
  wire  _T_9; // @[EthFcsPadding.scala 341:46]
  wire  _T_10; // @[EthFcsPadding.scala 341:61]
  wire  _T_11; // @[EthFcsPadding.scala 341:56]
  wire  CrcNext_1; // @[EthFcsPadding.scala 341:25]
  wire  _T_13; // @[EthFcsPadding.scala 342:32]
  wire  _T_15; // @[EthFcsPadding.scala 342:36]
  wire  _T_17; // @[EthFcsPadding.scala 342:46]
  wire  _T_19; // @[EthFcsPadding.scala 342:56]
  wire  _T_21; // @[EthFcsPadding.scala 342:66]
  wire  _T_22; // @[EthFcsPadding.scala 342:81]
  wire  _T_23; // @[EthFcsPadding.scala 342:76]
  wire  CrcNext_2; // @[EthFcsPadding.scala 342:25]
  wire  _T_25; // @[EthFcsPadding.scala 343:32]
  wire  _T_27; // @[EthFcsPadding.scala 343:36]
  wire  _T_29; // @[EthFcsPadding.scala 343:46]
  wire  _T_31; // @[EthFcsPadding.scala 343:56]
  wire  _T_33; // @[EthFcsPadding.scala 343:66]
  wire  _T_34; // @[EthFcsPadding.scala 343:81]
  wire  _T_35; // @[EthFcsPadding.scala 343:76]
  wire  CrcNext_3; // @[EthFcsPadding.scala 343:25]
  wire  _T_41; // @[EthFcsPadding.scala 344:47]
  wire  _T_43; // @[EthFcsPadding.scala 344:57]
  wire  _T_45; // @[EthFcsPadding.scala 344:67]
  wire  _T_47; // @[EthFcsPadding.scala 344:77]
  wire  _T_48; // @[EthFcsPadding.scala 344:26]
  wire  _T_49; // @[EthFcsPadding.scala 344:94]
  wire  CrcNext_4; // @[EthFcsPadding.scala 344:89]
  wire  _T_53; // @[EthFcsPadding.scala 345:37]
  wire  _T_55; // @[EthFcsPadding.scala 345:47]
  wire  _T_57; // @[EthFcsPadding.scala 345:57]
  wire  _T_59; // @[EthFcsPadding.scala 345:67]
  wire  _T_61; // @[EthFcsPadding.scala 345:77]
  wire  _T_62; // @[EthFcsPadding.scala 345:26]
  wire  _T_63; // @[EthFcsPadding.scala 345:94]
  wire  CrcNext_5; // @[EthFcsPadding.scala 345:89]
  wire  _T_69; // @[EthFcsPadding.scala 346:47]
  wire  _T_71; // @[EthFcsPadding.scala 346:57]
  wire  _T_72; // @[EthFcsPadding.scala 346:26]
  wire  _T_73; // @[EthFcsPadding.scala 346:74]
  wire  CrcNext_6; // @[EthFcsPadding.scala 346:69]
  wire  _T_87; // @[EthFcsPadding.scala 347:94]
  wire  CrcNext_7; // @[EthFcsPadding.scala 347:89]
  wire  _T_101; // @[EthFcsPadding.scala 348:94]
  wire  CrcNext_8; // @[EthFcsPadding.scala 348:89]
  wire  _T_111; // @[EthFcsPadding.scala 349:74]
  wire  CrcNext_9; // @[EthFcsPadding.scala 349:69]
  wire  _T_125; // @[EthFcsPadding.scala 350:94]
  wire  CrcNext_10; // @[EthFcsPadding.scala 350:89]
  wire  _T_139; // @[EthFcsPadding.scala 351:94]
  wire  CrcNext_11; // @[EthFcsPadding.scala 351:89]
  wire  _T_153; // @[EthFcsPadding.scala 352:94]
  wire  CrcNext_12; // @[EthFcsPadding.scala 352:89]
  wire  _T_167; // @[EthFcsPadding.scala 353:94]
  wire  CrcNext_13; // @[EthFcsPadding.scala 353:89]
  wire  _T_173; // @[EthFcsPadding.scala 354:47]
  wire  _T_175; // @[EthFcsPadding.scala 354:57]
  wire  _T_176; // @[EthFcsPadding.scala 354:26]
  wire  _T_177; // @[EthFcsPadding.scala 354:74]
  wire  CrcNext_14; // @[EthFcsPadding.scala 354:69]
  wire  _T_181; // @[EthFcsPadding.scala 355:37]
  wire  _T_182; // @[EthFcsPadding.scala 355:26]
  wire  _T_183; // @[EthFcsPadding.scala 355:54]
  wire  CrcNext_15; // @[EthFcsPadding.scala 355:49]
  wire  _T_189; // @[EthFcsPadding.scala 356:54]
  wire  CrcNext_16; // @[EthFcsPadding.scala 356:49]
  wire  _T_193; // @[EthFcsPadding.scala 357:37]
  wire  _T_194; // @[EthFcsPadding.scala 357:26]
  wire  _T_195; // @[EthFcsPadding.scala 357:54]
  wire  CrcNext_17; // @[EthFcsPadding.scala 357:49]
  wire  _T_199; // @[EthFcsPadding.scala 358:37]
  wire  _T_200; // @[EthFcsPadding.scala 358:26]
  wire  _T_201; // @[EthFcsPadding.scala 358:54]
  wire  CrcNext_18; // @[EthFcsPadding.scala 358:49]
  wire  _T_207; // @[EthFcsPadding.scala 359:54]
  wire  CrcNext_19; // @[EthFcsPadding.scala 359:49]
  wire  CrcNext_20; // @[EthFcsPadding.scala 360:21]
  wire  CrcNext_21; // @[EthFcsPadding.scala 361:21]
  wire  _T_215; // @[EthFcsPadding.scala 362:54]
  wire  CrcNext_22; // @[EthFcsPadding.scala 362:49]
  wire  _T_221; // @[EthFcsPadding.scala 363:47]
  wire  _T_223; // @[EthFcsPadding.scala 363:57]
  wire  _T_224; // @[EthFcsPadding.scala 363:26]
  wire  _T_225; // @[EthFcsPadding.scala 363:74]
  wire  CrcNext_23; // @[EthFcsPadding.scala 363:69]
  wire  _T_231; // @[EthFcsPadding.scala 364:47]
  wire  _T_233; // @[EthFcsPadding.scala 364:57]
  wire  _T_234; // @[EthFcsPadding.scala 364:26]
  wire  _T_235; // @[EthFcsPadding.scala 364:74]
  wire  CrcNext_24; // @[EthFcsPadding.scala 364:69]
  wire  _T_241; // @[EthFcsPadding.scala 365:47]
  wire  _T_243; // @[EthFcsPadding.scala 365:57]
  wire  _T_244; // @[EthFcsPadding.scala 365:26]
  wire  _T_245; // @[EthFcsPadding.scala 365:74]
  wire  CrcNext_25; // @[EthFcsPadding.scala 365:69]
  wire  _T_249; // @[EthFcsPadding.scala 366:37]
  wire  _T_251; // @[EthFcsPadding.scala 366:47]
  wire  _T_253; // @[EthFcsPadding.scala 366:57]
  wire  _T_254; // @[EthFcsPadding.scala 366:26]
  wire  _T_255; // @[EthFcsPadding.scala 366:74]
  wire  CrcNext_26; // @[EthFcsPadding.scala 366:69]
  wire  _T_261; // @[EthFcsPadding.scala 367:54]
  wire  CrcNext_27; // @[EthFcsPadding.scala 367:49]
  wire  _T_267; // @[EthFcsPadding.scala 368:54]
  wire  CrcNext_28; // @[EthFcsPadding.scala 368:49]
  wire  _T_273; // @[EthFcsPadding.scala 369:54]
  wire  CrcNext_29; // @[EthFcsPadding.scala 369:49]
  wire  CrcNext_30; // @[EthFcsPadding.scala 370:21]
  wire  CrcNext_31; // @[EthFcsPadding.scala 371:21]
  wire [7:0] _T_284; // @[EthFcsPadding.scala 376:28]
  wire [15:0] _T_292; // @[EthFcsPadding.scala 376:28]
  wire [7:0] _T_299; // @[EthFcsPadding.scala 376:28]
  wire [31:0] _T_308; // @[EthFcsPadding.scala 376:28]
  assign _T_1 = io_Data[0]; // @[EthFcsPadding.scala 340:32]
  assign _T_2 = Crc[28]; // @[EthFcsPadding.scala 340:41]
  assign _T_3 = _T_1 ^ _T_2; // @[EthFcsPadding.scala 340:36]
  assign CrcNext_0 = io_Enable & _T_3; // @[EthFcsPadding.scala 340:25]
  assign _T_5 = io_Data[1]; // @[EthFcsPadding.scala 341:32]
  assign _T_7 = _T_5 ^ _T_1; // @[EthFcsPadding.scala 341:36]
  assign _T_9 = _T_7 ^ _T_2; // @[EthFcsPadding.scala 341:46]
  assign _T_10 = Crc[29]; // @[EthFcsPadding.scala 341:61]
  assign _T_11 = _T_9 ^ _T_10; // @[EthFcsPadding.scala 341:56]
  assign CrcNext_1 = io_Enable & _T_11; // @[EthFcsPadding.scala 341:25]
  assign _T_13 = io_Data[2]; // @[EthFcsPadding.scala 342:32]
  assign _T_15 = _T_13 ^ _T_5; // @[EthFcsPadding.scala 342:36]
  assign _T_17 = _T_15 ^ _T_1; // @[EthFcsPadding.scala 342:46]
  assign _T_19 = _T_17 ^ _T_2; // @[EthFcsPadding.scala 342:56]
  assign _T_21 = _T_19 ^ _T_10; // @[EthFcsPadding.scala 342:66]
  assign _T_22 = Crc[30]; // @[EthFcsPadding.scala 342:81]
  assign _T_23 = _T_21 ^ _T_22; // @[EthFcsPadding.scala 342:76]
  assign CrcNext_2 = io_Enable & _T_23; // @[EthFcsPadding.scala 342:25]
  assign _T_25 = io_Data[3]; // @[EthFcsPadding.scala 343:32]
  assign _T_27 = _T_25 ^ _T_13; // @[EthFcsPadding.scala 343:36]
  assign _T_29 = _T_27 ^ _T_5; // @[EthFcsPadding.scala 343:46]
  assign _T_31 = _T_29 ^ _T_10; // @[EthFcsPadding.scala 343:56]
  assign _T_33 = _T_31 ^ _T_22; // @[EthFcsPadding.scala 343:66]
  assign _T_34 = Crc[31]; // @[EthFcsPadding.scala 343:81]
  assign _T_35 = _T_33 ^ _T_34; // @[EthFcsPadding.scala 343:76]
  assign CrcNext_3 = io_Enable & _T_35; // @[EthFcsPadding.scala 343:25]
  assign _T_41 = _T_27 ^ _T_1; // @[EthFcsPadding.scala 344:47]
  assign _T_43 = _T_41 ^ _T_2; // @[EthFcsPadding.scala 344:57]
  assign _T_45 = _T_43 ^ _T_22; // @[EthFcsPadding.scala 344:67]
  assign _T_47 = _T_45 ^ _T_34; // @[EthFcsPadding.scala 344:77]
  assign _T_48 = io_Enable & _T_47; // @[EthFcsPadding.scala 344:26]
  assign _T_49 = Crc[0]; // @[EthFcsPadding.scala 344:94]
  assign CrcNext_4 = _T_48 ^ _T_49; // @[EthFcsPadding.scala 344:89]
  assign _T_53 = _T_25 ^ _T_5; // @[EthFcsPadding.scala 345:37]
  assign _T_55 = _T_53 ^ _T_1; // @[EthFcsPadding.scala 345:47]
  assign _T_57 = _T_55 ^ _T_2; // @[EthFcsPadding.scala 345:57]
  assign _T_59 = _T_57 ^ _T_10; // @[EthFcsPadding.scala 345:67]
  assign _T_61 = _T_59 ^ _T_34; // @[EthFcsPadding.scala 345:77]
  assign _T_62 = io_Enable & _T_61; // @[EthFcsPadding.scala 345:26]
  assign _T_63 = Crc[1]; // @[EthFcsPadding.scala 345:94]
  assign CrcNext_5 = _T_62 ^ _T_63; // @[EthFcsPadding.scala 345:89]
  assign _T_69 = _T_15 ^ _T_10; // @[EthFcsPadding.scala 346:47]
  assign _T_71 = _T_69 ^ _T_22; // @[EthFcsPadding.scala 346:57]
  assign _T_72 = io_Enable & _T_71; // @[EthFcsPadding.scala 346:26]
  assign _T_73 = Crc[2]; // @[EthFcsPadding.scala 346:74]
  assign CrcNext_6 = _T_72 ^ _T_73; // @[EthFcsPadding.scala 346:69]
  assign _T_87 = Crc[3]; // @[EthFcsPadding.scala 347:94]
  assign CrcNext_7 = _T_48 ^ _T_87; // @[EthFcsPadding.scala 347:89]
  assign _T_101 = Crc[4]; // @[EthFcsPadding.scala 348:94]
  assign CrcNext_8 = _T_62 ^ _T_101; // @[EthFcsPadding.scala 348:89]
  assign _T_111 = Crc[5]; // @[EthFcsPadding.scala 349:74]
  assign CrcNext_9 = _T_72 ^ _T_111; // @[EthFcsPadding.scala 349:69]
  assign _T_125 = Crc[6]; // @[EthFcsPadding.scala 350:94]
  assign CrcNext_10 = _T_48 ^ _T_125; // @[EthFcsPadding.scala 350:89]
  assign _T_139 = Crc[7]; // @[EthFcsPadding.scala 351:94]
  assign CrcNext_11 = _T_62 ^ _T_139; // @[EthFcsPadding.scala 351:89]
  assign _T_153 = Crc[8]; // @[EthFcsPadding.scala 352:94]
  assign CrcNext_12 = CrcNext_2 ^ _T_153; // @[EthFcsPadding.scala 352:89]
  assign _T_167 = Crc[9]; // @[EthFcsPadding.scala 353:94]
  assign CrcNext_13 = CrcNext_3 ^ _T_167; // @[EthFcsPadding.scala 353:89]
  assign _T_173 = _T_27 ^ _T_22; // @[EthFcsPadding.scala 354:47]
  assign _T_175 = _T_173 ^ _T_34; // @[EthFcsPadding.scala 354:57]
  assign _T_176 = io_Enable & _T_175; // @[EthFcsPadding.scala 354:26]
  assign _T_177 = Crc[10]; // @[EthFcsPadding.scala 354:74]
  assign CrcNext_14 = _T_176 ^ _T_177; // @[EthFcsPadding.scala 354:69]
  assign _T_181 = _T_25 ^ _T_34; // @[EthFcsPadding.scala 355:37]
  assign _T_182 = io_Enable & _T_181; // @[EthFcsPadding.scala 355:26]
  assign _T_183 = Crc[11]; // @[EthFcsPadding.scala 355:54]
  assign CrcNext_15 = _T_182 ^ _T_183; // @[EthFcsPadding.scala 355:49]
  assign _T_189 = Crc[12]; // @[EthFcsPadding.scala 356:54]
  assign CrcNext_16 = CrcNext_0 ^ _T_189; // @[EthFcsPadding.scala 356:49]
  assign _T_193 = _T_5 ^ _T_10; // @[EthFcsPadding.scala 357:37]
  assign _T_194 = io_Enable & _T_193; // @[EthFcsPadding.scala 357:26]
  assign _T_195 = Crc[13]; // @[EthFcsPadding.scala 357:54]
  assign CrcNext_17 = _T_194 ^ _T_195; // @[EthFcsPadding.scala 357:49]
  assign _T_199 = _T_13 ^ _T_22; // @[EthFcsPadding.scala 358:37]
  assign _T_200 = io_Enable & _T_199; // @[EthFcsPadding.scala 358:26]
  assign _T_201 = Crc[14]; // @[EthFcsPadding.scala 358:54]
  assign CrcNext_18 = _T_200 ^ _T_201; // @[EthFcsPadding.scala 358:49]
  assign _T_207 = Crc[15]; // @[EthFcsPadding.scala 359:54]
  assign CrcNext_19 = _T_182 ^ _T_207; // @[EthFcsPadding.scala 359:49]
  assign CrcNext_20 = Crc[16]; // @[EthFcsPadding.scala 360:21]
  assign CrcNext_21 = Crc[17]; // @[EthFcsPadding.scala 361:21]
  assign _T_215 = Crc[18]; // @[EthFcsPadding.scala 362:54]
  assign CrcNext_22 = CrcNext_0 ^ _T_215; // @[EthFcsPadding.scala 362:49]
  assign _T_221 = _T_7 ^ _T_10; // @[EthFcsPadding.scala 363:47]
  assign _T_223 = _T_221 ^ _T_2; // @[EthFcsPadding.scala 363:57]
  assign _T_224 = io_Enable & _T_223; // @[EthFcsPadding.scala 363:26]
  assign _T_225 = Crc[19]; // @[EthFcsPadding.scala 363:74]
  assign CrcNext_23 = _T_224 ^ _T_225; // @[EthFcsPadding.scala 363:69]
  assign _T_231 = _T_15 ^ _T_22; // @[EthFcsPadding.scala 364:47]
  assign _T_233 = _T_231 ^ _T_10; // @[EthFcsPadding.scala 364:57]
  assign _T_234 = io_Enable & _T_233; // @[EthFcsPadding.scala 364:26]
  assign _T_235 = Crc[20]; // @[EthFcsPadding.scala 364:74]
  assign CrcNext_24 = _T_234 ^ _T_235; // @[EthFcsPadding.scala 364:69]
  assign _T_241 = _T_27 ^ _T_34; // @[EthFcsPadding.scala 365:47]
  assign _T_243 = _T_241 ^ _T_22; // @[EthFcsPadding.scala 365:57]
  assign _T_244 = io_Enable & _T_243; // @[EthFcsPadding.scala 365:26]
  assign _T_245 = Crc[21]; // @[EthFcsPadding.scala 365:74]
  assign CrcNext_25 = _T_244 ^ _T_245; // @[EthFcsPadding.scala 365:69]
  assign _T_249 = _T_25 ^ _T_1; // @[EthFcsPadding.scala 366:37]
  assign _T_251 = _T_249 ^ _T_34; // @[EthFcsPadding.scala 366:47]
  assign _T_253 = _T_251 ^ _T_2; // @[EthFcsPadding.scala 366:57]
  assign _T_254 = io_Enable & _T_253; // @[EthFcsPadding.scala 366:26]
  assign _T_255 = Crc[22]; // @[EthFcsPadding.scala 366:74]
  assign CrcNext_26 = _T_254 ^ _T_255; // @[EthFcsPadding.scala 366:69]
  assign _T_261 = Crc[23]; // @[EthFcsPadding.scala 367:54]
  assign CrcNext_27 = _T_194 ^ _T_261; // @[EthFcsPadding.scala 367:49]
  assign _T_267 = Crc[24]; // @[EthFcsPadding.scala 368:54]
  assign CrcNext_28 = _T_200 ^ _T_267; // @[EthFcsPadding.scala 368:49]
  assign _T_273 = Crc[25]; // @[EthFcsPadding.scala 369:54]
  assign CrcNext_29 = _T_182 ^ _T_273; // @[EthFcsPadding.scala 369:49]
  assign CrcNext_30 = Crc[26]; // @[EthFcsPadding.scala 370:21]
  assign CrcNext_31 = Crc[27]; // @[EthFcsPadding.scala 371:21]
  assign _T_284 = {CrcNext_7,CrcNext_6,CrcNext_5,CrcNext_4,CrcNext_3,CrcNext_2,CrcNext_1,CrcNext_0}; // @[EthFcsPadding.scala 376:28]
  assign _T_292 = {CrcNext_15,CrcNext_14,CrcNext_13,CrcNext_12,CrcNext_11,CrcNext_10,CrcNext_9,CrcNext_8,_T_284}; // @[EthFcsPadding.scala 376:28]
  assign _T_299 = {CrcNext_23,CrcNext_22,CrcNext_21,CrcNext_20,CrcNext_19,CrcNext_18,CrcNext_17,CrcNext_16}; // @[EthFcsPadding.scala 376:28]
  assign _T_308 = {CrcNext_31,CrcNext_30,CrcNext_29,CrcNext_28,CrcNext_27,CrcNext_26,CrcNext_25,CrcNext_24,_T_299,_T_292}; // @[EthFcsPadding.scala 376:28]
  assign io_CrcError = Crc != 32'hc704dd7b; // @[EthFcsPadding.scala 379:15]
  always @(posedge clock) begin
    if (reset) begin
      Crc <= 32'hffffffff;
    end else begin
      if (io_Initialize) begin
        Crc <= 32'hffffffff;
      end else begin
        if (io_En) begin
          Crc <= _T_308;
        end
      end
    end
  end
endmodule
module CRCChecker(
  input        clock,
  input        reset,
  input        io_mii_clk,
  input        io_mii_en,
  input  [3:0] io_mii_dat,
  output       io_ok,
  output       io_err
);
  wire  crc32_d4_clock; // @[EthFcsPadding.scala 391:24]
  wire  crc32_d4_reset; // @[EthFcsPadding.scala 391:24]
  wire  crc32_d4_io_En; // @[EthFcsPadding.scala 391:24]
  wire [3:0] crc32_d4_io_Data; // @[EthFcsPadding.scala 391:24]
  wire  crc32_d4_io_Enable; // @[EthFcsPadding.scala 391:24]
  wire  crc32_d4_io_Initialize; // @[EthFcsPadding.scala 391:24]
  wire  crc32_d4_io_CrcError; // @[EthFcsPadding.scala 391:24]
  reg  _T; // @[util.scala 13:42]
  wire  _T_1; // @[util.scala 13:34]
  wire  mii_clk; // @[util.scala 13:31]
  reg [1:0] state; // @[EthFcsPadding.scala 407:22]
  wire  _T_2; // @[Conditional.scala 37:30]
  reg  _T_3; // @[util.scala 13:42]
  wire  _T_4; // @[util.scala 13:34]
  wire  _T_5; // @[util.scala 13:31]
  wire  _T_6; // @[Conditional.scala 37:30]
  wire  _T_7; // @[EthFcsPadding.scala 424:23]
  wire  _T_8; // @[Conditional.scala 37:30]
  wire  _T_9; // @[EthFcsPadding.scala 431:15]
  wire  _T_10; // @[EthFcsPadding.scala 434:21]
  wire  _GEN_4; // @[EthFcsPadding.scala 431:24]
  wire  _GEN_5; // @[EthFcsPadding.scala 431:24]
  wire  _GEN_7; // @[EthFcsPadding.scala 430:22]
  wire  _GEN_8; // @[EthFcsPadding.scala 430:22]
  wire  _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_14; // @[Conditional.scala 39:67]
  wire  _T_12; // @[EthFcsPadding.scala 441:41]
  wire  _T_13; // @[EthFcsPadding.scala 441:53]
  wire  _T_14; // @[EthFcsPadding.scala 441:65]
  wire  _T_15; // @[EthFcsPadding.scala 441:77]
  wire [1:0] _T_16; // @[Cat.scala 29:58]
  wire [1:0] _T_17; // @[Cat.scala 29:58]
  wire  _T_19; // @[EthFcsPadding.scala 442:46]
  CRC32_D4 crc32_d4 ( // @[EthFcsPadding.scala 391:24]
    .clock(crc32_d4_clock),
    .reset(crc32_d4_reset),
    .io_En(crc32_d4_io_En),
    .io_Data(crc32_d4_io_Data),
    .io_Enable(crc32_d4_io_Enable),
    .io_Initialize(crc32_d4_io_Initialize),
    .io_CrcError(crc32_d4_io_CrcError)
  );
  assign _T_1 = _T == 1'h0; // @[util.scala 13:34]
  assign mii_clk = io_mii_clk & _T_1; // @[util.scala 13:31]
  assign _T_2 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_4 = _T_3 == 1'h0; // @[util.scala 13:34]
  assign _T_5 = io_mii_en & _T_4; // @[util.scala 13:31]
  assign _T_6 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_7 = io_mii_dat == 4'hd; // @[EthFcsPadding.scala 424:23]
  assign _T_8 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _T_9 = ~ io_mii_en; // @[EthFcsPadding.scala 431:15]
  assign _T_10 = ~ crc32_d4_io_CrcError; // @[EthFcsPadding.scala 434:21]
  assign _GEN_4 = _T_9 & crc32_d4_io_CrcError; // @[EthFcsPadding.scala 431:24]
  assign _GEN_5 = _T_9 & _T_10; // @[EthFcsPadding.scala 431:24]
  assign _GEN_7 = mii_clk & _GEN_4; // @[EthFcsPadding.scala 430:22]
  assign _GEN_8 = mii_clk & _GEN_5; // @[EthFcsPadding.scala 430:22]
  assign _GEN_10 = _T_8 & _GEN_7; // @[Conditional.scala 39:67]
  assign _GEN_11 = _T_8 & _GEN_8; // @[Conditional.scala 39:67]
  assign _GEN_13 = _T_6 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  assign _GEN_14 = _T_6 ? 1'h0 : _GEN_11; // @[Conditional.scala 39:67]
  assign _T_12 = io_mii_dat[0]; // @[EthFcsPadding.scala 441:41]
  assign _T_13 = io_mii_dat[1]; // @[EthFcsPadding.scala 441:53]
  assign _T_14 = io_mii_dat[2]; // @[EthFcsPadding.scala 441:65]
  assign _T_15 = io_mii_dat[3]; // @[EthFcsPadding.scala 441:77]
  assign _T_16 = {_T_14,_T_15}; // @[Cat.scala 29:58]
  assign _T_17 = {_T_12,_T_13}; // @[Cat.scala 29:58]
  assign _T_19 = state == 2'h2; // @[EthFcsPadding.scala 442:46]
  assign io_ok = _T_2 ? 1'h0 : _GEN_14; // @[EthFcsPadding.scala 413:10 EthFcsPadding.scala 434:18]
  assign io_err = _T_2 ? 1'h0 : _GEN_13; // @[EthFcsPadding.scala 414:10 EthFcsPadding.scala 433:18]
  assign crc32_d4_clock = clock;
  assign crc32_d4_reset = reset;
  assign crc32_d4_io_En = io_mii_en & mii_clk; // @[EthFcsPadding.scala 440:27]
  assign crc32_d4_io_Data = {_T_17,_T_16}; // @[EthFcsPadding.scala 441:27]
  assign crc32_d4_io_Enable = io_mii_en & _T_19; // @[EthFcsPadding.scala 442:27]
  assign crc32_d4_io_Initialize = state == 2'h1; // @[EthFcsPadding.scala 443:27]
  always @(posedge clock) begin
    _T <= io_mii_clk;
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_2) begin
        if (_T_5) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_6) begin
          if (mii_clk) begin
            if (_T_7) begin
              state <= 2'h2;
            end
          end
        end else begin
          if (_T_8) begin
            if (mii_clk) begin
              if (_T_9) begin
                state <= 2'h0;
              end
            end
          end
        end
      end
    end
    _T_3 <= io_mii_en;
  end
endmodule