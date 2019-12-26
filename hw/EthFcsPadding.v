module EthCRC32(
  input         clock,
  input         reset,
  input  [7:0]  io_data,
  input         io_enable,
  input         io_start,
  output [31:0] io_crc
);
  reg [31:0] c; // @[EthFcsPadding.scala 24:18]
  wire  _T_1; // @[EthFcsPadding.scala 28:19]
  wire  _T_2; // @[EthFcsPadding.scala 28:31]
  wire  _T_3; // @[EthFcsPadding.scala 28:43]
  wire  _T_4; // @[EthFcsPadding.scala 28:54]
  wire  _T_5; // @[EthFcsPadding.scala 28:65]
  wire  _T_6; // @[EthFcsPadding.scala 28:76]
  wire  _T_7; // @[EthFcsPadding.scala 28:87]
  wire  _T_8; // @[EthFcsPadding.scala 28:98]
  wire [7:0] d; // @[Cat.scala 29:58]
  wire  _T_16; // @[EthFcsPadding.scala 30:18]
  wire  _T_17; // @[EthFcsPadding.scala 30:25]
  wire  _T_18; // @[EthFcsPadding.scala 30:22]
  wire  _T_19; // @[EthFcsPadding.scala 30:32]
  wire  _T_20; // @[EthFcsPadding.scala 30:29]
  wire  _T_21; // @[EthFcsPadding.scala 30:40]
  wire  newcrc_0; // @[EthFcsPadding.scala 30:37]
  wire  _T_23; // @[EthFcsPadding.scala 31:18]
  wire  _T_25; // @[EthFcsPadding.scala 31:22]
  wire  _T_26; // @[EthFcsPadding.scala 31:32]
  wire  _T_27; // @[EthFcsPadding.scala 31:29]
  wire  _T_29; // @[EthFcsPadding.scala 31:36]
  wire  _T_31; // @[EthFcsPadding.scala 31:43]
  wire  _T_32; // @[EthFcsPadding.scala 31:54]
  wire  _T_33; // @[EthFcsPadding.scala 31:51]
  wire  _T_35; // @[EthFcsPadding.scala 31:59]
  wire  _T_36; // @[EthFcsPadding.scala 31:70]
  wire  newcrc_1; // @[EthFcsPadding.scala 31:67]
  wire  _T_41; // @[EthFcsPadding.scala 32:32]
  wire  _T_42; // @[EthFcsPadding.scala 32:29]
  wire  _T_44; // @[EthFcsPadding.scala 32:36]
  wire  _T_46; // @[EthFcsPadding.scala 32:43]
  wire  _T_48; // @[EthFcsPadding.scala 32:50]
  wire  _T_50; // @[EthFcsPadding.scala 32:58]
  wire  _T_51; // @[EthFcsPadding.scala 32:69]
  wire  _T_52; // @[EthFcsPadding.scala 32:66]
  wire  _T_54; // @[EthFcsPadding.scala 32:74]
  wire  newcrc_2; // @[EthFcsPadding.scala 32:82]
  wire  _T_58; // @[EthFcsPadding.scala 33:25]
  wire  _T_59; // @[EthFcsPadding.scala 33:22]
  wire  _T_61; // @[EthFcsPadding.scala 33:29]
  wire  _T_63; // @[EthFcsPadding.scala 33:36]
  wire  _T_65; // @[EthFcsPadding.scala 33:43]
  wire  _T_67; // @[EthFcsPadding.scala 33:51]
  wire  _T_68; // @[EthFcsPadding.scala 33:62]
  wire  _T_69; // @[EthFcsPadding.scala 33:59]
  wire  newcrc_3; // @[EthFcsPadding.scala 33:67]
  wire  _T_73; // @[EthFcsPadding.scala 34:25]
  wire  _T_74; // @[EthFcsPadding.scala 34:22]
  wire  _T_76; // @[EthFcsPadding.scala 34:29]
  wire  _T_78; // @[EthFcsPadding.scala 34:36]
  wire  _T_80; // @[EthFcsPadding.scala 34:43]
  wire  _T_82; // @[EthFcsPadding.scala 34:50]
  wire  _T_84; // @[EthFcsPadding.scala 34:58]
  wire  _T_86; // @[EthFcsPadding.scala 34:66]
  wire  _T_87; // @[EthFcsPadding.scala 34:77]
  wire  _T_88; // @[EthFcsPadding.scala 34:74]
  wire  newcrc_4; // @[EthFcsPadding.scala 34:82]
  wire  _T_94; // @[EthFcsPadding.scala 35:32]
  wire  _T_95; // @[EthFcsPadding.scala 35:29]
  wire  _T_97; // @[EthFcsPadding.scala 35:36]
  wire  _T_99; // @[EthFcsPadding.scala 35:43]
  wire  _T_101; // @[EthFcsPadding.scala 35:50]
  wire  _T_103; // @[EthFcsPadding.scala 35:57]
  wire  _T_105; // @[EthFcsPadding.scala 35:64]
  wire  _T_107; // @[EthFcsPadding.scala 35:72]
  wire  _T_109; // @[EthFcsPadding.scala 35:80]
  wire  _T_111; // @[EthFcsPadding.scala 35:88]
  wire  _T_112; // @[EthFcsPadding.scala 35:99]
  wire  _T_113; // @[EthFcsPadding.scala 35:96]
  wire  _T_115; // @[EthFcsPadding.scala 35:104]
  wire  newcrc_5; // @[EthFcsPadding.scala 35:112]
  wire  _T_126; // @[EthFcsPadding.scala 36:43]
  wire  _T_128; // @[EthFcsPadding.scala 36:50]
  wire  _T_130; // @[EthFcsPadding.scala 36:57]
  wire  _T_132; // @[EthFcsPadding.scala 36:65]
  wire  _T_134; // @[EthFcsPadding.scala 36:73]
  wire  _T_136; // @[EthFcsPadding.scala 36:81]
  wire  _T_138; // @[EthFcsPadding.scala 36:89]
  wire  newcrc_6; // @[EthFcsPadding.scala 36:97]
  wire  _T_143; // @[EthFcsPadding.scala 37:22]
  wire  _T_145; // @[EthFcsPadding.scala 37:29]
  wire  _T_147; // @[EthFcsPadding.scala 37:36]
  wire  _T_149; // @[EthFcsPadding.scala 37:43]
  wire  _T_151; // @[EthFcsPadding.scala 37:50]
  wire  _T_153; // @[EthFcsPadding.scala 37:58]
  wire  _T_155; // @[EthFcsPadding.scala 37:66]
  wire  _T_157; // @[EthFcsPadding.scala 37:74]
  wire  newcrc_7; // @[EthFcsPadding.scala 37:82]
  wire  _T_162; // @[EthFcsPadding.scala 38:22]
  wire  _T_164; // @[EthFcsPadding.scala 38:29]
  wire  _T_166; // @[EthFcsPadding.scala 38:36]
  wire  _T_167; // @[EthFcsPadding.scala 38:46]
  wire  _T_168; // @[EthFcsPadding.scala 38:43]
  wire  _T_170; // @[EthFcsPadding.scala 38:50]
  wire  _T_172; // @[EthFcsPadding.scala 38:58]
  wire  _T_174; // @[EthFcsPadding.scala 38:66]
  wire  newcrc_8; // @[EthFcsPadding.scala 38:74]
  wire  _T_179; // @[EthFcsPadding.scala 39:22]
  wire  _T_181; // @[EthFcsPadding.scala 39:29]
  wire  _T_183; // @[EthFcsPadding.scala 39:36]
  wire  _T_184; // @[EthFcsPadding.scala 39:46]
  wire  _T_185; // @[EthFcsPadding.scala 39:43]
  wire  _T_187; // @[EthFcsPadding.scala 39:50]
  wire  _T_189; // @[EthFcsPadding.scala 39:58]
  wire  _T_191; // @[EthFcsPadding.scala 39:66]
  wire  newcrc_9; // @[EthFcsPadding.scala 39:74]
  wire  _T_196; // @[EthFcsPadding.scala 40:22]
  wire  _T_198; // @[EthFcsPadding.scala 40:29]
  wire  _T_200; // @[EthFcsPadding.scala 40:36]
  wire  _T_201; // @[EthFcsPadding.scala 40:46]
  wire  _T_202; // @[EthFcsPadding.scala 40:43]
  wire  _T_204; // @[EthFcsPadding.scala 40:50]
  wire  _T_206; // @[EthFcsPadding.scala 40:58]
  wire  _T_208; // @[EthFcsPadding.scala 40:66]
  wire  newcrc_10; // @[EthFcsPadding.scala 40:74]
  wire  _T_218; // @[EthFcsPadding.scala 41:46]
  wire  _T_219; // @[EthFcsPadding.scala 41:43]
  wire  _T_221; // @[EthFcsPadding.scala 41:50]
  wire  _T_223; // @[EthFcsPadding.scala 41:58]
  wire  _T_225; // @[EthFcsPadding.scala 41:66]
  wire  newcrc_11; // @[EthFcsPadding.scala 41:74]
  wire  _T_230; // @[EthFcsPadding.scala 42:22]
  wire  _T_232; // @[EthFcsPadding.scala 42:29]
  wire  _T_234; // @[EthFcsPadding.scala 42:36]
  wire  _T_236; // @[EthFcsPadding.scala 42:43]
  wire  _T_238; // @[EthFcsPadding.scala 42:50]
  wire  _T_239; // @[EthFcsPadding.scala 42:60]
  wire  _T_240; // @[EthFcsPadding.scala 42:57]
  wire  _T_242; // @[EthFcsPadding.scala 42:64]
  wire  _T_244; // @[EthFcsPadding.scala 42:72]
  wire  _T_246; // @[EthFcsPadding.scala 42:80]
  wire  _T_248; // @[EthFcsPadding.scala 42:88]
  wire  _T_250; // @[EthFcsPadding.scala 42:96]
  wire  newcrc_12; // @[EthFcsPadding.scala 42:104]
  wire  _T_259; // @[EthFcsPadding.scala 43:36]
  wire  _T_261; // @[EthFcsPadding.scala 43:43]
  wire  _T_263; // @[EthFcsPadding.scala 43:50]
  wire  _T_264; // @[EthFcsPadding.scala 43:60]
  wire  _T_265; // @[EthFcsPadding.scala 43:57]
  wire  _T_267; // @[EthFcsPadding.scala 43:64]
  wire  _T_269; // @[EthFcsPadding.scala 43:72]
  wire  _T_271; // @[EthFcsPadding.scala 43:80]
  wire  _T_273; // @[EthFcsPadding.scala 43:88]
  wire  _T_275; // @[EthFcsPadding.scala 43:96]
  wire  newcrc_13; // @[EthFcsPadding.scala 43:104]
  wire  _T_282; // @[EthFcsPadding.scala 44:29]
  wire  _T_284; // @[EthFcsPadding.scala 44:36]
  wire  _T_286; // @[EthFcsPadding.scala 44:43]
  wire  _T_287; // @[EthFcsPadding.scala 44:53]
  wire  _T_288; // @[EthFcsPadding.scala 44:50]
  wire  _T_290; // @[EthFcsPadding.scala 44:57]
  wire  _T_292; // @[EthFcsPadding.scala 44:65]
  wire  _T_294; // @[EthFcsPadding.scala 44:73]
  wire  _T_296; // @[EthFcsPadding.scala 44:81]
  wire  newcrc_14; // @[EthFcsPadding.scala 44:89]
  wire  _T_303; // @[EthFcsPadding.scala 45:29]
  wire  _T_305; // @[EthFcsPadding.scala 45:36]
  wire  _T_306; // @[EthFcsPadding.scala 45:46]
  wire  _T_307; // @[EthFcsPadding.scala 45:43]
  wire  _T_309; // @[EthFcsPadding.scala 45:50]
  wire  _T_311; // @[EthFcsPadding.scala 45:58]
  wire  _T_313; // @[EthFcsPadding.scala 45:66]
  wire  newcrc_15; // @[EthFcsPadding.scala 45:74]
  wire  _T_320; // @[EthFcsPadding.scala 46:29]
  wire  _T_321; // @[EthFcsPadding.scala 46:39]
  wire  _T_322; // @[EthFcsPadding.scala 46:36]
  wire  _T_324; // @[EthFcsPadding.scala 46:43]
  wire  _T_326; // @[EthFcsPadding.scala 46:51]
  wire  newcrc_16; // @[EthFcsPadding.scala 46:59]
  wire  _T_333; // @[EthFcsPadding.scala 47:29]
  wire  _T_334; // @[EthFcsPadding.scala 47:39]
  wire  _T_335; // @[EthFcsPadding.scala 47:36]
  wire  _T_337; // @[EthFcsPadding.scala 47:43]
  wire  _T_339; // @[EthFcsPadding.scala 47:51]
  wire  newcrc_17; // @[EthFcsPadding.scala 47:59]
  wire  _T_347; // @[EthFcsPadding.scala 48:39]
  wire  _T_348; // @[EthFcsPadding.scala 48:36]
  wire  _T_350; // @[EthFcsPadding.scala 48:44]
  wire  _T_352; // @[EthFcsPadding.scala 48:52]
  wire  newcrc_18; // @[EthFcsPadding.scala 48:60]
  wire  _T_358; // @[EthFcsPadding.scala 49:32]
  wire  _T_359; // @[EthFcsPadding.scala 49:29]
  wire  _T_361; // @[EthFcsPadding.scala 49:37]
  wire  newcrc_19; // @[EthFcsPadding.scala 49:45]
  wire  _T_365; // @[EthFcsPadding.scala 50:25]
  wire  _T_366; // @[EthFcsPadding.scala 50:22]
  wire  newcrc_20; // @[EthFcsPadding.scala 50:30]
  wire  _T_370; // @[EthFcsPadding.scala 51:25]
  wire  _T_371; // @[EthFcsPadding.scala 51:22]
  wire  newcrc_21; // @[EthFcsPadding.scala 51:30]
  wire  _T_375; // @[EthFcsPadding.scala 52:25]
  wire  _T_376; // @[EthFcsPadding.scala 52:22]
  wire  newcrc_22; // @[EthFcsPadding.scala 52:30]
  wire  _T_381; // @[EthFcsPadding.scala 53:22]
  wire  _T_383; // @[EthFcsPadding.scala 53:29]
  wire  _T_384; // @[EthFcsPadding.scala 53:39]
  wire  _T_385; // @[EthFcsPadding.scala 53:36]
  wire  _T_387; // @[EthFcsPadding.scala 53:44]
  wire  _T_389; // @[EthFcsPadding.scala 53:52]
  wire  newcrc_23; // @[EthFcsPadding.scala 53:60]
  wire  _T_394; // @[EthFcsPadding.scala 54:22]
  wire  _T_396; // @[EthFcsPadding.scala 54:29]
  wire  _T_397; // @[EthFcsPadding.scala 54:39]
  wire  _T_398; // @[EthFcsPadding.scala 54:36]
  wire  _T_400; // @[EthFcsPadding.scala 54:44]
  wire  _T_402; // @[EthFcsPadding.scala 54:52]
  wire  newcrc_24; // @[EthFcsPadding.scala 54:60]
  wire  _T_407; // @[EthFcsPadding.scala 55:22]
  wire  _T_408; // @[EthFcsPadding.scala 55:32]
  wire  _T_409; // @[EthFcsPadding.scala 55:29]
  wire  _T_411; // @[EthFcsPadding.scala 55:37]
  wire  newcrc_25; // @[EthFcsPadding.scala 55:45]
  wire  _T_420; // @[EthFcsPadding.scala 56:36]
  wire  _T_421; // @[EthFcsPadding.scala 56:46]
  wire  _T_422; // @[EthFcsPadding.scala 56:43]
  wire  _T_424; // @[EthFcsPadding.scala 56:51]
  wire  _T_426; // @[EthFcsPadding.scala 56:59]
  wire  _T_428; // @[EthFcsPadding.scala 56:67]
  wire  newcrc_26; // @[EthFcsPadding.scala 56:75]
  wire  _T_437; // @[EthFcsPadding.scala 57:36]
  wire  _T_438; // @[EthFcsPadding.scala 57:46]
  wire  _T_439; // @[EthFcsPadding.scala 57:43]
  wire  _T_441; // @[EthFcsPadding.scala 57:51]
  wire  _T_443; // @[EthFcsPadding.scala 57:59]
  wire  _T_445; // @[EthFcsPadding.scala 57:67]
  wire  newcrc_27; // @[EthFcsPadding.scala 57:75]
  wire  _T_452; // @[EthFcsPadding.scala 58:29]
  wire  _T_453; // @[EthFcsPadding.scala 58:39]
  wire  _T_454; // @[EthFcsPadding.scala 58:36]
  wire  _T_456; // @[EthFcsPadding.scala 58:44]
  wire  _T_458; // @[EthFcsPadding.scala 58:52]
  wire  newcrc_28; // @[EthFcsPadding.scala 58:60]
  wire  _T_465; // @[EthFcsPadding.scala 59:29]
  wire  _T_466; // @[EthFcsPadding.scala 59:39]
  wire  _T_467; // @[EthFcsPadding.scala 59:36]
  wire  _T_469; // @[EthFcsPadding.scala 59:44]
  wire  _T_471; // @[EthFcsPadding.scala 59:52]
  wire  newcrc_29; // @[EthFcsPadding.scala 59:60]
  wire  _T_476; // @[EthFcsPadding.scala 60:22]
  wire  _T_477; // @[EthFcsPadding.scala 60:32]
  wire  _T_478; // @[EthFcsPadding.scala 60:29]
  wire  _T_480; // @[EthFcsPadding.scala 60:37]
  wire  newcrc_30; // @[EthFcsPadding.scala 60:45]
  wire  _T_484; // @[EthFcsPadding.scala 61:25]
  wire  _T_485; // @[EthFcsPadding.scala 61:22]
  wire  newcrc_31; // @[EthFcsPadding.scala 61:30]
  wire  _T_488; // @[EthFcsPadding.scala 63:9]
  wire [7:0] _T_496; // @[EthFcsPadding.scala 66:25]
  wire [15:0] _T_504; // @[EthFcsPadding.scala 66:25]
  wire [7:0] _T_511; // @[EthFcsPadding.scala 66:25]
  wire [31:0] _T_520; // @[EthFcsPadding.scala 66:25]
  wire [31:0] crc_r; // @[EthFcsPadding.scala 72:12]
  wire  _T_522; // @[EthFcsPadding.scala 74:22]
  wire  _T_523; // @[EthFcsPadding.scala 74:32]
  wire  _T_524; // @[EthFcsPadding.scala 74:42]
  wire  _T_525; // @[EthFcsPadding.scala 74:52]
  wire  _T_526; // @[EthFcsPadding.scala 74:62]
  wire  _T_527; // @[EthFcsPadding.scala 74:72]
  wire  _T_528; // @[EthFcsPadding.scala 74:82]
  wire  _T_529; // @[EthFcsPadding.scala 74:92]
  wire  _T_530; // @[EthFcsPadding.scala 75:22]
  wire  _T_531; // @[EthFcsPadding.scala 75:32]
  wire  _T_532; // @[EthFcsPadding.scala 75:42]
  wire  _T_533; // @[EthFcsPadding.scala 75:52]
  wire  _T_534; // @[EthFcsPadding.scala 75:62]
  wire  _T_535; // @[EthFcsPadding.scala 75:72]
  wire  _T_536; // @[EthFcsPadding.scala 75:82]
  wire  _T_537; // @[EthFcsPadding.scala 75:92]
  wire  _T_538; // @[EthFcsPadding.scala 76:22]
  wire  _T_539; // @[EthFcsPadding.scala 76:32]
  wire  _T_540; // @[EthFcsPadding.scala 76:42]
  wire  _T_541; // @[EthFcsPadding.scala 76:52]
  wire  _T_542; // @[EthFcsPadding.scala 76:62]
  wire  _T_543; // @[EthFcsPadding.scala 76:72]
  wire  _T_544; // @[EthFcsPadding.scala 76:82]
  wire  _T_545; // @[EthFcsPadding.scala 76:92]
  wire  _T_546; // @[EthFcsPadding.scala 77:22]
  wire  _T_547; // @[EthFcsPadding.scala 77:32]
  wire  _T_548; // @[EthFcsPadding.scala 77:42]
  wire  _T_549; // @[EthFcsPadding.scala 77:52]
  wire  _T_550; // @[EthFcsPadding.scala 77:62]
  wire  _T_551; // @[EthFcsPadding.scala 77:72]
  wire  _T_552; // @[EthFcsPadding.scala 77:82]
  wire  _T_553; // @[EthFcsPadding.scala 77:92]
  wire [7:0] _T_560; // @[Cat.scala 29:58]
  wire [15:0] _T_568; // @[Cat.scala 29:58]
  wire [7:0] _T_575; // @[Cat.scala 29:58]
  wire [15:0] _T_583; // @[Cat.scala 29:58]
  assign _T_1 = io_data[0]; // @[EthFcsPadding.scala 28:19]
  assign _T_2 = io_data[1]; // @[EthFcsPadding.scala 28:31]
  assign _T_3 = io_data[2]; // @[EthFcsPadding.scala 28:43]
  assign _T_4 = io_data[3]; // @[EthFcsPadding.scala 28:54]
  assign _T_5 = io_data[4]; // @[EthFcsPadding.scala 28:65]
  assign _T_6 = io_data[5]; // @[EthFcsPadding.scala 28:76]
  assign _T_7 = io_data[6]; // @[EthFcsPadding.scala 28:87]
  assign _T_8 = io_data[7]; // @[EthFcsPadding.scala 28:98]
  assign d = {_T_1,_T_2,_T_3,_T_4,_T_5,_T_6,_T_7,_T_8}; // @[Cat.scala 29:58]
  assign _T_16 = d[6]; // @[EthFcsPadding.scala 30:18]
  assign _T_17 = d[0]; // @[EthFcsPadding.scala 30:25]
  assign _T_18 = _T_16 ^ _T_17; // @[EthFcsPadding.scala 30:22]
  assign _T_19 = c[24]; // @[EthFcsPadding.scala 30:32]
  assign _T_20 = _T_18 ^ _T_19; // @[EthFcsPadding.scala 30:29]
  assign _T_21 = c[30]; // @[EthFcsPadding.scala 30:40]
  assign newcrc_0 = _T_20 ^ _T_21; // @[EthFcsPadding.scala 30:37]
  assign _T_23 = d[7]; // @[EthFcsPadding.scala 31:18]
  assign _T_25 = _T_23 ^ _T_16; // @[EthFcsPadding.scala 31:22]
  assign _T_26 = d[1]; // @[EthFcsPadding.scala 31:32]
  assign _T_27 = _T_25 ^ _T_26; // @[EthFcsPadding.scala 31:29]
  assign _T_29 = _T_27 ^ _T_17; // @[EthFcsPadding.scala 31:36]
  assign _T_31 = _T_29 ^ _T_19; // @[EthFcsPadding.scala 31:43]
  assign _T_32 = c[25]; // @[EthFcsPadding.scala 31:54]
  assign _T_33 = _T_31 ^ _T_32; // @[EthFcsPadding.scala 31:51]
  assign _T_35 = _T_33 ^ _T_21; // @[EthFcsPadding.scala 31:59]
  assign _T_36 = c[31]; // @[EthFcsPadding.scala 31:70]
  assign newcrc_1 = _T_35 ^ _T_36; // @[EthFcsPadding.scala 31:67]
  assign _T_41 = d[2]; // @[EthFcsPadding.scala 32:32]
  assign _T_42 = _T_25 ^ _T_41; // @[EthFcsPadding.scala 32:29]
  assign _T_44 = _T_42 ^ _T_26; // @[EthFcsPadding.scala 32:36]
  assign _T_46 = _T_44 ^ _T_17; // @[EthFcsPadding.scala 32:43]
  assign _T_48 = _T_46 ^ _T_19; // @[EthFcsPadding.scala 32:50]
  assign _T_50 = _T_48 ^ _T_32; // @[EthFcsPadding.scala 32:58]
  assign _T_51 = c[26]; // @[EthFcsPadding.scala 32:69]
  assign _T_52 = _T_50 ^ _T_51; // @[EthFcsPadding.scala 32:66]
  assign _T_54 = _T_52 ^ _T_21; // @[EthFcsPadding.scala 32:74]
  assign newcrc_2 = _T_54 ^ _T_36; // @[EthFcsPadding.scala 32:82]
  assign _T_58 = d[3]; // @[EthFcsPadding.scala 33:25]
  assign _T_59 = _T_23 ^ _T_58; // @[EthFcsPadding.scala 33:22]
  assign _T_61 = _T_59 ^ _T_41; // @[EthFcsPadding.scala 33:29]
  assign _T_63 = _T_61 ^ _T_26; // @[EthFcsPadding.scala 33:36]
  assign _T_65 = _T_63 ^ _T_32; // @[EthFcsPadding.scala 33:43]
  assign _T_67 = _T_65 ^ _T_51; // @[EthFcsPadding.scala 33:51]
  assign _T_68 = c[27]; // @[EthFcsPadding.scala 33:62]
  assign _T_69 = _T_67 ^ _T_68; // @[EthFcsPadding.scala 33:59]
  assign newcrc_3 = _T_69 ^ _T_36; // @[EthFcsPadding.scala 33:67]
  assign _T_73 = d[4]; // @[EthFcsPadding.scala 34:25]
  assign _T_74 = _T_16 ^ _T_73; // @[EthFcsPadding.scala 34:22]
  assign _T_76 = _T_74 ^ _T_58; // @[EthFcsPadding.scala 34:29]
  assign _T_78 = _T_76 ^ _T_41; // @[EthFcsPadding.scala 34:36]
  assign _T_80 = _T_78 ^ _T_17; // @[EthFcsPadding.scala 34:43]
  assign _T_82 = _T_80 ^ _T_19; // @[EthFcsPadding.scala 34:50]
  assign _T_84 = _T_82 ^ _T_51; // @[EthFcsPadding.scala 34:58]
  assign _T_86 = _T_84 ^ _T_68; // @[EthFcsPadding.scala 34:66]
  assign _T_87 = c[28]; // @[EthFcsPadding.scala 34:77]
  assign _T_88 = _T_86 ^ _T_87; // @[EthFcsPadding.scala 34:74]
  assign newcrc_4 = _T_88 ^ _T_21; // @[EthFcsPadding.scala 34:82]
  assign _T_94 = d[5]; // @[EthFcsPadding.scala 35:32]
  assign _T_95 = _T_25 ^ _T_94; // @[EthFcsPadding.scala 35:29]
  assign _T_97 = _T_95 ^ _T_73; // @[EthFcsPadding.scala 35:36]
  assign _T_99 = _T_97 ^ _T_58; // @[EthFcsPadding.scala 35:43]
  assign _T_101 = _T_99 ^ _T_26; // @[EthFcsPadding.scala 35:50]
  assign _T_103 = _T_101 ^ _T_17; // @[EthFcsPadding.scala 35:57]
  assign _T_105 = _T_103 ^ _T_19; // @[EthFcsPadding.scala 35:64]
  assign _T_107 = _T_105 ^ _T_32; // @[EthFcsPadding.scala 35:72]
  assign _T_109 = _T_107 ^ _T_68; // @[EthFcsPadding.scala 35:80]
  assign _T_111 = _T_109 ^ _T_87; // @[EthFcsPadding.scala 35:88]
  assign _T_112 = c[29]; // @[EthFcsPadding.scala 35:99]
  assign _T_113 = _T_111 ^ _T_112; // @[EthFcsPadding.scala 35:96]
  assign _T_115 = _T_113 ^ _T_21; // @[EthFcsPadding.scala 35:104]
  assign newcrc_5 = _T_115 ^ _T_36; // @[EthFcsPadding.scala 35:112]
  assign _T_126 = _T_97 ^ _T_41; // @[EthFcsPadding.scala 36:43]
  assign _T_128 = _T_126 ^ _T_26; // @[EthFcsPadding.scala 36:50]
  assign _T_130 = _T_128 ^ _T_32; // @[EthFcsPadding.scala 36:57]
  assign _T_132 = _T_130 ^ _T_51; // @[EthFcsPadding.scala 36:65]
  assign _T_134 = _T_132 ^ _T_87; // @[EthFcsPadding.scala 36:73]
  assign _T_136 = _T_134 ^ _T_112; // @[EthFcsPadding.scala 36:81]
  assign _T_138 = _T_136 ^ _T_21; // @[EthFcsPadding.scala 36:89]
  assign newcrc_6 = _T_138 ^ _T_36; // @[EthFcsPadding.scala 36:97]
  assign _T_143 = _T_23 ^ _T_94; // @[EthFcsPadding.scala 37:22]
  assign _T_145 = _T_143 ^ _T_58; // @[EthFcsPadding.scala 37:29]
  assign _T_147 = _T_145 ^ _T_41; // @[EthFcsPadding.scala 37:36]
  assign _T_149 = _T_147 ^ _T_17; // @[EthFcsPadding.scala 37:43]
  assign _T_151 = _T_149 ^ _T_19; // @[EthFcsPadding.scala 37:50]
  assign _T_153 = _T_151 ^ _T_51; // @[EthFcsPadding.scala 37:58]
  assign _T_155 = _T_153 ^ _T_68; // @[EthFcsPadding.scala 37:66]
  assign _T_157 = _T_155 ^ _T_112; // @[EthFcsPadding.scala 37:74]
  assign newcrc_7 = _T_157 ^ _T_36; // @[EthFcsPadding.scala 37:82]
  assign _T_162 = _T_73 ^ _T_58; // @[EthFcsPadding.scala 38:22]
  assign _T_164 = _T_162 ^ _T_26; // @[EthFcsPadding.scala 38:29]
  assign _T_166 = _T_164 ^ _T_17; // @[EthFcsPadding.scala 38:36]
  assign _T_167 = c[0]; // @[EthFcsPadding.scala 38:46]
  assign _T_168 = _T_166 ^ _T_167; // @[EthFcsPadding.scala 38:43]
  assign _T_170 = _T_168 ^ _T_19; // @[EthFcsPadding.scala 38:50]
  assign _T_172 = _T_170 ^ _T_32; // @[EthFcsPadding.scala 38:58]
  assign _T_174 = _T_172 ^ _T_68; // @[EthFcsPadding.scala 38:66]
  assign newcrc_8 = _T_174 ^ _T_87; // @[EthFcsPadding.scala 38:74]
  assign _T_179 = _T_94 ^ _T_73; // @[EthFcsPadding.scala 39:22]
  assign _T_181 = _T_179 ^ _T_41; // @[EthFcsPadding.scala 39:29]
  assign _T_183 = _T_181 ^ _T_26; // @[EthFcsPadding.scala 39:36]
  assign _T_184 = c[1]; // @[EthFcsPadding.scala 39:46]
  assign _T_185 = _T_183 ^ _T_184; // @[EthFcsPadding.scala 39:43]
  assign _T_187 = _T_185 ^ _T_32; // @[EthFcsPadding.scala 39:50]
  assign _T_189 = _T_187 ^ _T_51; // @[EthFcsPadding.scala 39:58]
  assign _T_191 = _T_189 ^ _T_87; // @[EthFcsPadding.scala 39:66]
  assign newcrc_9 = _T_191 ^ _T_112; // @[EthFcsPadding.scala 39:74]
  assign _T_196 = _T_94 ^ _T_58; // @[EthFcsPadding.scala 40:22]
  assign _T_198 = _T_196 ^ _T_41; // @[EthFcsPadding.scala 40:29]
  assign _T_200 = _T_198 ^ _T_17; // @[EthFcsPadding.scala 40:36]
  assign _T_201 = c[2]; // @[EthFcsPadding.scala 40:46]
  assign _T_202 = _T_200 ^ _T_201; // @[EthFcsPadding.scala 40:43]
  assign _T_204 = _T_202 ^ _T_19; // @[EthFcsPadding.scala 40:50]
  assign _T_206 = _T_204 ^ _T_51; // @[EthFcsPadding.scala 40:58]
  assign _T_208 = _T_206 ^ _T_68; // @[EthFcsPadding.scala 40:66]
  assign newcrc_10 = _T_208 ^ _T_112; // @[EthFcsPadding.scala 40:74]
  assign _T_218 = c[3]; // @[EthFcsPadding.scala 41:46]
  assign _T_219 = _T_166 ^ _T_218; // @[EthFcsPadding.scala 41:43]
  assign _T_221 = _T_219 ^ _T_19; // @[EthFcsPadding.scala 41:50]
  assign _T_223 = _T_221 ^ _T_32; // @[EthFcsPadding.scala 41:58]
  assign _T_225 = _T_223 ^ _T_68; // @[EthFcsPadding.scala 41:66]
  assign newcrc_11 = _T_225 ^ _T_87; // @[EthFcsPadding.scala 41:74]
  assign _T_230 = _T_16 ^ _T_94; // @[EthFcsPadding.scala 42:22]
  assign _T_232 = _T_230 ^ _T_73; // @[EthFcsPadding.scala 42:29]
  assign _T_234 = _T_232 ^ _T_41; // @[EthFcsPadding.scala 42:36]
  assign _T_236 = _T_234 ^ _T_26; // @[EthFcsPadding.scala 42:43]
  assign _T_238 = _T_236 ^ _T_17; // @[EthFcsPadding.scala 42:50]
  assign _T_239 = c[4]; // @[EthFcsPadding.scala 42:60]
  assign _T_240 = _T_238 ^ _T_239; // @[EthFcsPadding.scala 42:57]
  assign _T_242 = _T_240 ^ _T_19; // @[EthFcsPadding.scala 42:64]
  assign _T_244 = _T_242 ^ _T_32; // @[EthFcsPadding.scala 42:72]
  assign _T_246 = _T_244 ^ _T_51; // @[EthFcsPadding.scala 42:80]
  assign _T_248 = _T_246 ^ _T_87; // @[EthFcsPadding.scala 42:88]
  assign _T_250 = _T_248 ^ _T_112; // @[EthFcsPadding.scala 42:96]
  assign newcrc_12 = _T_250 ^ _T_21; // @[EthFcsPadding.scala 42:104]
  assign _T_259 = _T_95 ^ _T_58; // @[EthFcsPadding.scala 43:36]
  assign _T_261 = _T_259 ^ _T_41; // @[EthFcsPadding.scala 43:43]
  assign _T_263 = _T_261 ^ _T_26; // @[EthFcsPadding.scala 43:50]
  assign _T_264 = c[5]; // @[EthFcsPadding.scala 43:60]
  assign _T_265 = _T_263 ^ _T_264; // @[EthFcsPadding.scala 43:57]
  assign _T_267 = _T_265 ^ _T_32; // @[EthFcsPadding.scala 43:64]
  assign _T_269 = _T_267 ^ _T_51; // @[EthFcsPadding.scala 43:72]
  assign _T_271 = _T_269 ^ _T_68; // @[EthFcsPadding.scala 43:80]
  assign _T_273 = _T_271 ^ _T_112; // @[EthFcsPadding.scala 43:88]
  assign _T_275 = _T_273 ^ _T_21; // @[EthFcsPadding.scala 43:96]
  assign newcrc_13 = _T_275 ^ _T_36; // @[EthFcsPadding.scala 43:104]
  assign _T_282 = _T_25 ^ _T_73; // @[EthFcsPadding.scala 44:29]
  assign _T_284 = _T_282 ^ _T_58; // @[EthFcsPadding.scala 44:36]
  assign _T_286 = _T_284 ^ _T_41; // @[EthFcsPadding.scala 44:43]
  assign _T_287 = c[6]; // @[EthFcsPadding.scala 44:53]
  assign _T_288 = _T_286 ^ _T_287; // @[EthFcsPadding.scala 44:50]
  assign _T_290 = _T_288 ^ _T_51; // @[EthFcsPadding.scala 44:57]
  assign _T_292 = _T_290 ^ _T_68; // @[EthFcsPadding.scala 44:65]
  assign _T_294 = _T_292 ^ _T_87; // @[EthFcsPadding.scala 44:73]
  assign _T_296 = _T_294 ^ _T_21; // @[EthFcsPadding.scala 44:81]
  assign newcrc_14 = _T_296 ^ _T_36; // @[EthFcsPadding.scala 44:89]
  assign _T_303 = _T_143 ^ _T_73; // @[EthFcsPadding.scala 45:29]
  assign _T_305 = _T_303 ^ _T_58; // @[EthFcsPadding.scala 45:36]
  assign _T_306 = c[7]; // @[EthFcsPadding.scala 45:46]
  assign _T_307 = _T_305 ^ _T_306; // @[EthFcsPadding.scala 45:43]
  assign _T_309 = _T_307 ^ _T_68; // @[EthFcsPadding.scala 45:50]
  assign _T_311 = _T_309 ^ _T_87; // @[EthFcsPadding.scala 45:58]
  assign _T_313 = _T_311 ^ _T_112; // @[EthFcsPadding.scala 45:66]
  assign newcrc_15 = _T_313 ^ _T_36; // @[EthFcsPadding.scala 45:74]
  assign _T_320 = _T_179 ^ _T_17; // @[EthFcsPadding.scala 46:29]
  assign _T_321 = c[8]; // @[EthFcsPadding.scala 46:39]
  assign _T_322 = _T_320 ^ _T_321; // @[EthFcsPadding.scala 46:36]
  assign _T_324 = _T_322 ^ _T_19; // @[EthFcsPadding.scala 46:43]
  assign _T_326 = _T_324 ^ _T_87; // @[EthFcsPadding.scala 46:51]
  assign newcrc_16 = _T_326 ^ _T_112; // @[EthFcsPadding.scala 46:59]
  assign _T_333 = _T_230 ^ _T_26; // @[EthFcsPadding.scala 47:29]
  assign _T_334 = c[9]; // @[EthFcsPadding.scala 47:39]
  assign _T_335 = _T_333 ^ _T_334; // @[EthFcsPadding.scala 47:36]
  assign _T_337 = _T_335 ^ _T_32; // @[EthFcsPadding.scala 47:43]
  assign _T_339 = _T_337 ^ _T_112; // @[EthFcsPadding.scala 47:51]
  assign newcrc_17 = _T_339 ^ _T_21; // @[EthFcsPadding.scala 47:59]
  assign _T_347 = c[10]; // @[EthFcsPadding.scala 48:39]
  assign _T_348 = _T_42 ^ _T_347; // @[EthFcsPadding.scala 48:36]
  assign _T_350 = _T_348 ^ _T_51; // @[EthFcsPadding.scala 48:44]
  assign _T_352 = _T_350 ^ _T_21; // @[EthFcsPadding.scala 48:52]
  assign newcrc_18 = _T_352 ^ _T_36; // @[EthFcsPadding.scala 48:60]
  assign _T_358 = c[11]; // @[EthFcsPadding.scala 49:32]
  assign _T_359 = _T_59 ^ _T_358; // @[EthFcsPadding.scala 49:29]
  assign _T_361 = _T_359 ^ _T_68; // @[EthFcsPadding.scala 49:37]
  assign newcrc_19 = _T_361 ^ _T_36; // @[EthFcsPadding.scala 49:45]
  assign _T_365 = c[12]; // @[EthFcsPadding.scala 50:25]
  assign _T_366 = _T_73 ^ _T_365; // @[EthFcsPadding.scala 50:22]
  assign newcrc_20 = _T_366 ^ _T_87; // @[EthFcsPadding.scala 50:30]
  assign _T_370 = c[13]; // @[EthFcsPadding.scala 51:25]
  assign _T_371 = _T_94 ^ _T_370; // @[EthFcsPadding.scala 51:22]
  assign newcrc_21 = _T_371 ^ _T_112; // @[EthFcsPadding.scala 51:30]
  assign _T_375 = c[14]; // @[EthFcsPadding.scala 52:25]
  assign _T_376 = _T_17 ^ _T_375; // @[EthFcsPadding.scala 52:22]
  assign newcrc_22 = _T_376 ^ _T_19; // @[EthFcsPadding.scala 52:30]
  assign _T_381 = _T_16 ^ _T_26; // @[EthFcsPadding.scala 53:22]
  assign _T_383 = _T_381 ^ _T_17; // @[EthFcsPadding.scala 53:29]
  assign _T_384 = c[15]; // @[EthFcsPadding.scala 53:39]
  assign _T_385 = _T_383 ^ _T_384; // @[EthFcsPadding.scala 53:36]
  assign _T_387 = _T_385 ^ _T_19; // @[EthFcsPadding.scala 53:44]
  assign _T_389 = _T_387 ^ _T_32; // @[EthFcsPadding.scala 53:52]
  assign newcrc_23 = _T_389 ^ _T_21; // @[EthFcsPadding.scala 53:60]
  assign _T_394 = _T_23 ^ _T_41; // @[EthFcsPadding.scala 54:22]
  assign _T_396 = _T_394 ^ _T_26; // @[EthFcsPadding.scala 54:29]
  assign _T_397 = c[16]; // @[EthFcsPadding.scala 54:39]
  assign _T_398 = _T_396 ^ _T_397; // @[EthFcsPadding.scala 54:36]
  assign _T_400 = _T_398 ^ _T_32; // @[EthFcsPadding.scala 54:44]
  assign _T_402 = _T_400 ^ _T_51; // @[EthFcsPadding.scala 54:52]
  assign newcrc_24 = _T_402 ^ _T_36; // @[EthFcsPadding.scala 54:60]
  assign _T_407 = _T_58 ^ _T_41; // @[EthFcsPadding.scala 55:22]
  assign _T_408 = c[17]; // @[EthFcsPadding.scala 55:32]
  assign _T_409 = _T_407 ^ _T_408; // @[EthFcsPadding.scala 55:29]
  assign _T_411 = _T_409 ^ _T_51; // @[EthFcsPadding.scala 55:37]
  assign newcrc_25 = _T_411 ^ _T_68; // @[EthFcsPadding.scala 55:45]
  assign _T_420 = _T_76 ^ _T_17; // @[EthFcsPadding.scala 56:36]
  assign _T_421 = c[18]; // @[EthFcsPadding.scala 56:46]
  assign _T_422 = _T_420 ^ _T_421; // @[EthFcsPadding.scala 56:43]
  assign _T_424 = _T_422 ^ _T_19; // @[EthFcsPadding.scala 56:51]
  assign _T_426 = _T_424 ^ _T_68; // @[EthFcsPadding.scala 56:59]
  assign _T_428 = _T_426 ^ _T_87; // @[EthFcsPadding.scala 56:67]
  assign newcrc_26 = _T_428 ^ _T_21; // @[EthFcsPadding.scala 56:75]
  assign _T_437 = _T_303 ^ _T_26; // @[EthFcsPadding.scala 57:36]
  assign _T_438 = c[19]; // @[EthFcsPadding.scala 57:46]
  assign _T_439 = _T_437 ^ _T_438; // @[EthFcsPadding.scala 57:43]
  assign _T_441 = _T_439 ^ _T_32; // @[EthFcsPadding.scala 57:51]
  assign _T_443 = _T_441 ^ _T_87; // @[EthFcsPadding.scala 57:59]
  assign _T_445 = _T_443 ^ _T_112; // @[EthFcsPadding.scala 57:67]
  assign newcrc_27 = _T_445 ^ _T_36; // @[EthFcsPadding.scala 57:75]
  assign _T_452 = _T_230 ^ _T_41; // @[EthFcsPadding.scala 58:29]
  assign _T_453 = c[20]; // @[EthFcsPadding.scala 58:39]
  assign _T_454 = _T_452 ^ _T_453; // @[EthFcsPadding.scala 58:36]
  assign _T_456 = _T_454 ^ _T_51; // @[EthFcsPadding.scala 58:44]
  assign _T_458 = _T_456 ^ _T_112; // @[EthFcsPadding.scala 58:52]
  assign newcrc_28 = _T_458 ^ _T_21; // @[EthFcsPadding.scala 58:60]
  assign _T_465 = _T_25 ^ _T_58; // @[EthFcsPadding.scala 59:29]
  assign _T_466 = c[21]; // @[EthFcsPadding.scala 59:39]
  assign _T_467 = _T_465 ^ _T_466; // @[EthFcsPadding.scala 59:36]
  assign _T_469 = _T_467 ^ _T_68; // @[EthFcsPadding.scala 59:44]
  assign _T_471 = _T_469 ^ _T_21; // @[EthFcsPadding.scala 59:52]
  assign newcrc_29 = _T_471 ^ _T_36; // @[EthFcsPadding.scala 59:60]
  assign _T_476 = _T_23 ^ _T_73; // @[EthFcsPadding.scala 60:22]
  assign _T_477 = c[22]; // @[EthFcsPadding.scala 60:32]
  assign _T_478 = _T_476 ^ _T_477; // @[EthFcsPadding.scala 60:29]
  assign _T_480 = _T_478 ^ _T_87; // @[EthFcsPadding.scala 60:37]
  assign newcrc_30 = _T_480 ^ _T_36; // @[EthFcsPadding.scala 60:45]
  assign _T_484 = c[23]; // @[EthFcsPadding.scala 61:25]
  assign _T_485 = _T_94 ^ _T_484; // @[EthFcsPadding.scala 61:22]
  assign newcrc_31 = _T_485 ^ _T_112; // @[EthFcsPadding.scala 61:30]
  assign _T_488 = io_start == 1'h0; // @[EthFcsPadding.scala 63:9]
  assign _T_496 = {newcrc_7,newcrc_6,newcrc_5,newcrc_4,newcrc_3,newcrc_2,newcrc_1,newcrc_0}; // @[EthFcsPadding.scala 66:25]
  assign _T_504 = {newcrc_15,newcrc_14,newcrc_13,newcrc_12,newcrc_11,newcrc_10,newcrc_9,newcrc_8,_T_496}; // @[EthFcsPadding.scala 66:25]
  assign _T_511 = {newcrc_23,newcrc_22,newcrc_21,newcrc_20,newcrc_19,newcrc_18,newcrc_17,newcrc_16}; // @[EthFcsPadding.scala 66:25]
  assign _T_520 = {newcrc_31,newcrc_30,newcrc_29,newcrc_28,newcrc_27,newcrc_26,newcrc_25,newcrc_24,_T_511,_T_504}; // @[EthFcsPadding.scala 66:25]
  assign crc_r = ~ c; // @[EthFcsPadding.scala 72:12]
  assign _T_522 = crc_r[0]; // @[EthFcsPadding.scala 74:22]
  assign _T_523 = crc_r[1]; // @[EthFcsPadding.scala 74:32]
  assign _T_524 = crc_r[2]; // @[EthFcsPadding.scala 74:42]
  assign _T_525 = crc_r[3]; // @[EthFcsPadding.scala 74:52]
  assign _T_526 = crc_r[4]; // @[EthFcsPadding.scala 74:62]
  assign _T_527 = crc_r[5]; // @[EthFcsPadding.scala 74:72]
  assign _T_528 = crc_r[6]; // @[EthFcsPadding.scala 74:82]
  assign _T_529 = crc_r[7]; // @[EthFcsPadding.scala 74:92]
  assign _T_530 = crc_r[8]; // @[EthFcsPadding.scala 75:22]
  assign _T_531 = crc_r[9]; // @[EthFcsPadding.scala 75:32]
  assign _T_532 = crc_r[10]; // @[EthFcsPadding.scala 75:42]
  assign _T_533 = crc_r[11]; // @[EthFcsPadding.scala 75:52]
  assign _T_534 = crc_r[12]; // @[EthFcsPadding.scala 75:62]
  assign _T_535 = crc_r[13]; // @[EthFcsPadding.scala 75:72]
  assign _T_536 = crc_r[14]; // @[EthFcsPadding.scala 75:82]
  assign _T_537 = crc_r[15]; // @[EthFcsPadding.scala 75:92]
  assign _T_538 = crc_r[16]; // @[EthFcsPadding.scala 76:22]
  assign _T_539 = crc_r[17]; // @[EthFcsPadding.scala 76:32]
  assign _T_540 = crc_r[18]; // @[EthFcsPadding.scala 76:42]
  assign _T_541 = crc_r[19]; // @[EthFcsPadding.scala 76:52]
  assign _T_542 = crc_r[20]; // @[EthFcsPadding.scala 76:62]
  assign _T_543 = crc_r[21]; // @[EthFcsPadding.scala 76:72]
  assign _T_544 = crc_r[22]; // @[EthFcsPadding.scala 76:82]
  assign _T_545 = crc_r[23]; // @[EthFcsPadding.scala 76:92]
  assign _T_546 = crc_r[24]; // @[EthFcsPadding.scala 77:22]
  assign _T_547 = crc_r[25]; // @[EthFcsPadding.scala 77:32]
  assign _T_548 = crc_r[26]; // @[EthFcsPadding.scala 77:42]
  assign _T_549 = crc_r[27]; // @[EthFcsPadding.scala 77:52]
  assign _T_550 = crc_r[28]; // @[EthFcsPadding.scala 77:62]
  assign _T_551 = crc_r[29]; // @[EthFcsPadding.scala 77:72]
  assign _T_552 = crc_r[30]; // @[EthFcsPadding.scala 77:82]
  assign _T_553 = crc_r[31]; // @[EthFcsPadding.scala 77:92]
  assign _T_560 = {_T_546,_T_547,_T_548,_T_549,_T_550,_T_551,_T_552,_T_553}; // @[Cat.scala 29:58]
  assign _T_568 = {_T_538,_T_539,_T_540,_T_541,_T_542,_T_543,_T_544,_T_545,_T_560}; // @[Cat.scala 29:58]
  assign _T_575 = {_T_530,_T_531,_T_532,_T_533,_T_534,_T_535,_T_536,_T_537}; // @[Cat.scala 29:58]
  assign _T_583 = {_T_522,_T_523,_T_524,_T_525,_T_526,_T_527,_T_528,_T_529,_T_575}; // @[Cat.scala 29:58]
  assign io_crc = {_T_583,_T_568}; // @[EthFcsPadding.scala 74:10]
  always @(posedge clock) begin
    if (reset) begin
      c <= 32'hffffffff;
    end else begin
      if (_T_488) begin
        c <= 32'hffffffff;
      end else begin
        if (io_enable) begin
          c <= _T_520;
        end
      end
    end
  end
endmodule
module EthFcsPadding(
  input        clock,
  input        reset,
  input        io_rx_en,
  input  [7:0] io_rx_dat,
  output       io_tx_en,
  output [7:0] io_tx_dat
);
  wire  crc32_d8_clock; // @[EthFcsPadding.scala 89:25]
  wire  crc32_d8_reset; // @[EthFcsPadding.scala 89:25]
  wire [7:0] crc32_d8_io_data; // @[EthFcsPadding.scala 89:25]
  wire  crc32_d8_io_enable; // @[EthFcsPadding.scala 89:25]
  wire  crc32_d8_io_start; // @[EthFcsPadding.scala 89:25]
  wire [31:0] crc32_d8_io_crc; // @[EthFcsPadding.scala 89:25]
  reg [2:0] state; // @[EthFcsPadding.scala 92:24]
  reg [7:0] counter; // @[EthFcsPadding.scala 94:28]
  reg  crc_enable; // @[EthFcsPadding.scala 95:28]
  reg [31:0] crc_out_r; // @[EthFcsPadding.scala 97:28]
  reg  tx_en; // @[EthFcsPadding.scala 98:28]
  reg [7:0] tx_dat; // @[EthFcsPadding.scala 99:28]
  reg  _T; // @[Reg.scala 15:16]
  reg  _T_1; // @[Reg.scala 15:16]
  reg  _T_2; // @[Reg.scala 15:16]
  reg  _T_3; // @[Reg.scala 15:16]
  reg  rx_valid_r5; // @[Reg.scala 15:16]
  reg [7:0] _T_4; // @[Reg.scala 15:16]
  reg [7:0] _T_5; // @[Reg.scala 15:16]
  reg [7:0] _T_6; // @[Reg.scala 15:16]
  reg [7:0] _T_7; // @[Reg.scala 15:16]
  reg [7:0] rx_data_r5; // @[Reg.scala 15:16]
  wire  _T_8; // @[Conditional.scala 37:30]
  reg  _T_9; // @[util.scala 13:42]
  wire  _T_10; // @[util.scala 13:34]
  wire  _T_11; // @[util.scala 13:31]
  wire  _T_12; // @[EthFcsPadding.scala 109:26]
  wire  _GEN_11; // @[EthFcsPadding.scala 109:38]
  wire  _GEN_14; // @[EthFcsPadding.scala 108:38]
  wire  _T_13; // @[Conditional.scala 37:30]
  wire [7:0] _T_15; // @[EthFcsPadding.scala 121:26]
  wire  _T_16; // @[EthFcsPadding.scala 122:21]
  wire  _T_17; // @[EthFcsPadding.scala 125:31]
  wire  _GEN_18; // @[EthFcsPadding.scala 125:43]
  wire  _T_18; // @[Conditional.scala 37:30]
  wire  _T_19; // @[EthFcsPadding.scala 133:13]
  wire  _T_20; // @[Conditional.scala 37:30]
  wire [31:0] crc_out; // @[EthFcsPadding.scala 161:22]
  wire [23:0] _T_21; // @[EthFcsPadding.scala 141:28]
  wire [7:0] _T_22; // @[EthFcsPadding.scala 142:24]
  wire  _T_25; // @[Conditional.scala 37:30]
  wire [23:0] _T_26; // @[EthFcsPadding.scala 146:30]
  wire  _T_29; // @[EthFcsPadding.scala 148:21]
  wire [7:0] _T_30; // @[EthFcsPadding.scala 153:28]
  EthCRC32 crc32_d8 ( // @[EthFcsPadding.scala 89:25]
    .clock(crc32_d8_clock),
    .reset(crc32_d8_reset),
    .io_data(crc32_d8_io_data),
    .io_enable(crc32_d8_io_enable),
    .io_start(crc32_d8_io_start),
    .io_crc(crc32_d8_io_crc)
  );
  assign _T_8 = 3'h0 == state; // @[Conditional.scala 37:30]
  assign _T_10 = _T_9 == 1'h0; // @[util.scala 13:34]
  assign _T_11 = rx_valid_r5 & _T_10; // @[util.scala 13:31]
  assign _T_12 = rx_data_r5 == 8'h55; // @[EthFcsPadding.scala 109:26]
  assign _GEN_11 = _T_12 | tx_en; // @[EthFcsPadding.scala 109:38]
  assign _GEN_14 = _T_11 & _GEN_11; // @[EthFcsPadding.scala 108:38]
  assign _T_13 = 3'h1 == state; // @[Conditional.scala 37:30]
  assign _T_15 = counter + 8'h1; // @[EthFcsPadding.scala 121:26]
  assign _T_16 = counter == 8'h7; // @[EthFcsPadding.scala 122:21]
  assign _T_17 = rx_data_r5 == 8'hd5; // @[EthFcsPadding.scala 125:31]
  assign _GEN_18 = _T_17 | crc_enable; // @[EthFcsPadding.scala 125:43]
  assign _T_18 = 3'h2 == state; // @[Conditional.scala 37:30]
  assign _T_19 = io_rx_en == 1'h0; // @[EthFcsPadding.scala 133:13]
  assign _T_20 = 3'h3 == state; // @[Conditional.scala 37:30]
  assign crc_out = crc32_d8_io_crc; // @[EthFcsPadding.scala 161:22]
  assign _T_21 = crc_out[31:8]; // @[EthFcsPadding.scala 141:28]
  assign _T_22 = crc_out[7:0]; // @[EthFcsPadding.scala 142:24]
  assign _T_25 = 3'h4 == state; // @[Conditional.scala 37:30]
  assign _T_26 = crc_out_r[31:8]; // @[EthFcsPadding.scala 146:30]
  assign _T_29 = counter == 8'h4; // @[EthFcsPadding.scala 148:21]
  assign _T_30 = crc_out_r[7:0]; // @[EthFcsPadding.scala 153:28]
  assign io_tx_en = tx_en; // @[EthFcsPadding.scala 163:13]
  assign io_tx_dat = tx_dat; // @[EthFcsPadding.scala 164:13]
  assign crc32_d8_clock = clock;
  assign crc32_d8_reset = reset;
  assign crc32_d8_io_data = rx_data_r5; // @[EthFcsPadding.scala 158:22]
  assign crc32_d8_io_enable = crc_enable; // @[EthFcsPadding.scala 159:22]
  assign crc32_d8_io_start = crc_enable; // @[EthFcsPadding.scala 160:22]
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_8) begin
        if (_T_11) begin
          if (_T_12) begin
            state <= 3'h1;
          end
        end
      end else begin
        if (_T_13) begin
          if (_T_16) begin
            state <= 3'h0;
          end else begin
            if (_T_17) begin
              state <= 3'h2;
            end
          end
        end else begin
          if (_T_18) begin
            if (_T_19) begin
              state <= 3'h3;
            end
          end else begin
            if (_T_20) begin
              state <= 3'h4;
            end else begin
              if (_T_25) begin
                if (_T_29) begin
                  state <= 3'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      counter <= 8'h0;
    end else begin
      if (_T_8) begin
        counter <= 8'h0;
      end else begin
        if (_T_13) begin
          if (_T_16) begin
            counter <= _T_15;
          end else begin
            if (_T_17) begin
              counter <= 8'h0;
            end else begin
              counter <= _T_15;
            end
          end
        end else begin
          if (_T_18) begin
            if (_T_19) begin
              counter <= 8'h0;
            end
          end else begin
            if (_T_20) begin
              counter <= _T_15;
            end else begin
              if (_T_25) begin
                counter <= _T_15;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      crc_enable <= 1'h0;
    end else begin
      if (_T_8) begin
        crc_enable <= 1'h0;
      end else begin
        if (_T_13) begin
          if (!(_T_16)) begin
            crc_enable <= _GEN_18;
          end
        end else begin
          if (_T_18) begin
            if (_T_19) begin
              crc_enable <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      crc_out_r <= 32'h0;
    end else begin
      if (!(_T_8)) begin
        if (!(_T_13)) begin
          if (!(_T_18)) begin
            if (_T_20) begin
              crc_out_r <= {{8'd0}, _T_21};
            end else begin
              if (_T_25) begin
                crc_out_r <= {{8'd0}, _T_26};
              end
            end
          end
        end
      end
    end
    if (reset) begin
      tx_en <= 1'h0;
    end else begin
      if (_T_8) begin
        tx_en <= _GEN_14;
      end else begin
        if (!(_T_13)) begin
          if (!(_T_18)) begin
            if (!(_T_20)) begin
              if (_T_25) begin
                if (_T_29) begin
                  tx_en <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      tx_dat <= 8'h0;
    end else begin
      if (_T_8) begin
        if (_T_11) begin
          if (_T_12) begin
            tx_dat <= rx_data_r5;
          end
        end else begin
          tx_dat <= 8'h0;
        end
      end else begin
        if (_T_13) begin
          tx_dat <= rx_data_r5;
        end else begin
          if (_T_18) begin
            tx_dat <= rx_data_r5;
          end else begin
            if (_T_20) begin
              tx_dat <= _T_22;
            end else begin
              if (_T_25) begin
                if (_T_29) begin
                  tx_dat <= 8'h0;
                end else begin
                  tx_dat <= _T_30;
                end
              end
            end
          end
        end
      end
    end
    _T <= io_rx_en;
    _T_1 <= _T;
    _T_2 <= _T_1;
    _T_3 <= _T_2;
    rx_valid_r5 <= _T_3;
    _T_4 <= io_rx_dat;
    _T_5 <= _T_4;
    _T_6 <= _T_5;
    _T_7 <= _T_6;
    rx_data_r5 <= _T_7;
    _T_9 <= rx_valid_r5;
  end
endmodule
