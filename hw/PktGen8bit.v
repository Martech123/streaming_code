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
module MaxPeriodFibonacciLFSR(
  input   clock,
  input   reset,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2,
  output  io_out_3,
  output  io_out_4,
  output  io_out_5,
  output  io_out_6,
  output  io_out_7,
  output  io_out_8,
  output  io_out_9,
  output  io_out_10,
  output  io_out_11,
  output  io_out_12,
  output  io_out_13,
  output  io_out_14,
  output  io_out_15
);
  reg  state_0; // @[PRNG.scala 47:50]
  reg  state_1; // @[PRNG.scala 47:50]
  reg  state_2; // @[PRNG.scala 47:50]
  reg  state_3; // @[PRNG.scala 47:50]
  reg  state_4; // @[PRNG.scala 47:50]
  reg  state_5; // @[PRNG.scala 47:50]
  reg  state_6; // @[PRNG.scala 47:50]
  reg  state_7; // @[PRNG.scala 47:50]
  reg  state_8; // @[PRNG.scala 47:50]
  reg  state_9; // @[PRNG.scala 47:50]
  reg  state_10; // @[PRNG.scala 47:50]
  reg  state_11; // @[PRNG.scala 47:50]
  reg  state_12; // @[PRNG.scala 47:50]
  reg  state_13; // @[PRNG.scala 47:50]
  reg  state_14; // @[PRNG.scala 47:50]
  reg  state_15; // @[PRNG.scala 47:50]
  wire  _T_1; // @[LFSR.scala 15:41]
  wire  _T_2; // @[LFSR.scala 15:41]
  wire  _T_3; // @[LFSR.scala 15:41]
  assign _T_1 = state_15 ^ state_13; // @[LFSR.scala 15:41]
  assign _T_2 = _T_1 ^ state_12; // @[LFSR.scala 15:41]
  assign _T_3 = _T_2 ^ state_10; // @[LFSR.scala 15:41]
  assign io_out_0 = state_0; // @[PRNG.scala 69:10]
  assign io_out_1 = state_1; // @[PRNG.scala 69:10]
  assign io_out_2 = state_2; // @[PRNG.scala 69:10]
  assign io_out_3 = state_3; // @[PRNG.scala 69:10]
  assign io_out_4 = state_4; // @[PRNG.scala 69:10]
  assign io_out_5 = state_5; // @[PRNG.scala 69:10]
  assign io_out_6 = state_6; // @[PRNG.scala 69:10]
  assign io_out_7 = state_7; // @[PRNG.scala 69:10]
  assign io_out_8 = state_8; // @[PRNG.scala 69:10]
  assign io_out_9 = state_9; // @[PRNG.scala 69:10]
  assign io_out_10 = state_10; // @[PRNG.scala 69:10]
  assign io_out_11 = state_11; // @[PRNG.scala 69:10]
  assign io_out_12 = state_12; // @[PRNG.scala 69:10]
  assign io_out_13 = state_13; // @[PRNG.scala 69:10]
  assign io_out_14 = state_14; // @[PRNG.scala 69:10]
  assign io_out_15 = state_15; // @[PRNG.scala 69:10]
  always @(posedge clock) begin
    if (reset) begin
      state_0 <= 1'h0;
    end else begin
      state_0 <= _T_3;
    end
    if (reset) begin
      state_1 <= 1'h0;
    end else begin
      state_1 <= state_0;
    end
    if (reset) begin
      state_2 <= 1'h0;
    end else begin
      state_2 <= state_1;
    end
    if (reset) begin
      state_3 <= 1'h0;
    end else begin
      state_3 <= state_2;
    end
    if (reset) begin
      state_4 <= 1'h0;
    end else begin
      state_4 <= state_3;
    end
    if (reset) begin
      state_5 <= 1'h0;
    end else begin
      state_5 <= state_4;
    end
    if (reset) begin
      state_6 <= 1'h0;
    end else begin
      state_6 <= state_5;
    end
    if (reset) begin
      state_7 <= 1'h0;
    end else begin
      state_7 <= state_6;
    end
    if (reset) begin
      state_8 <= 1'h0;
    end else begin
      state_8 <= state_7;
    end
    if (reset) begin
      state_9 <= 1'h0;
    end else begin
      state_9 <= state_8;
    end
    if (reset) begin
      state_10 <= 1'h0;
    end else begin
      state_10 <= state_9;
    end
    if (reset) begin
      state_11 <= 1'h0;
    end else begin
      state_11 <= state_10;
    end
    if (reset) begin
      state_12 <= 1'h0;
    end else begin
      state_12 <= state_11;
    end
    if (reset) begin
      state_13 <= 1'h0;
    end else begin
      state_13 <= state_12;
    end
    if (reset) begin
      state_14 <= 1'h0;
    end else begin
      state_14 <= state_13;
    end
    state_15 <= reset | state_14;
  end
endmodule
module PktGen8bit(
  input         clock,
  input         reset,
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
  output [7:0]  io_tx_data,
  input         io_total_send_count_clr,
  output [47:0] io_total_send_count
);
  wire  eth_fcs_padding_clock; // @[PktGen.scala 50:32]
  wire  eth_fcs_padding_reset; // @[PktGen.scala 50:32]
  wire  eth_fcs_padding_io_rx_en; // @[PktGen.scala 50:32]
  wire [7:0] eth_fcs_padding_io_rx_dat; // @[PktGen.scala 50:32]
  wire  eth_fcs_padding_io_tx_en; // @[PktGen.scala 50:32]
  wire [7:0] eth_fcs_padding_io_tx_dat; // @[PktGen.scala 50:32]
  wire  MaxPeriodFibonacciLFSR_clock; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_reset; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_0; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_1; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_2; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_3; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_4; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_5; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_6; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_7; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_8; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_9; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_10; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_11; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_12; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_13; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_14; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_io_out_15; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_clock; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_reset; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_0; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_1; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_2; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_3; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_4; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_5; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_6; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_7; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_8; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_9; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_10; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_11; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_12; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_13; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_14; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_1_io_out_15; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_clock; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_reset; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_0; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_1; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_2; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_3; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_4; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_5; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_6; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_7; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_8; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_9; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_10; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_11; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_12; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_13; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_14; // @[PRNG.scala 82:22]
  wire  MaxPeriodFibonacciLFSR_2_io_out_15; // @[PRNG.scala 82:22]
  reg [3:0] state; // @[PktGen.scala 49:22]
  reg  tx_en; // @[PktGen.scala 52:39]
  reg [7:0] tx_data; // @[PktGen.scala 53:39]
  reg [15:0] cntr; // @[PktGen.scala 55:39]
  reg [15:0] pkt_len; // @[PktGen.scala 56:39]
  reg [47:0] total_send_count; // @[PktGen.scala 57:39]
  reg [47:0] send_count; // @[PktGen.scala 58:39]
  reg  send_done; // @[PktGen.scala 59:39]
  reg [15:0] loaded_pkt_len; // @[PktGen.scala 61:39]
  reg  _T; // @[util.scala 13:42]
  wire  _T_1; // @[util.scala 13:34]
  wire  _T_2; // @[util.scala 13:31]
  wire  _T_3; // @[util.scala 14:30]
  reg  _T_4; // @[util.scala 14:43]
  wire  _T_5; // @[util.scala 14:33]
  wire [47:0] _T_7; // @[PktGen.scala 67:30]
  reg  _T_8; // @[util.scala 13:42]
  wire  _T_9; // @[util.scala 13:34]
  wire  _T_10; // @[util.scala 13:31]
  wire  _T_11; // @[PktGen.scala 73:24]
  wire [47:0] _GEN_84; // @[PktGen.scala 74:31]
  wire  _T_12; // @[PktGen.scala 74:31]
  reg  _T_14; // @[util.scala 14:43]
  wire  _T_15; // @[util.scala 14:33]
  wire [47:0] _T_17; // @[PktGen.scala 81:42]
  reg  _T_18; // @[util.scala 13:42]
  wire  _T_19; // @[util.scala 13:34]
  wire  _T_20; // @[util.scala 13:31]
  reg [47:0] load_r; // @[PktGen.scala 90:23]
  wire  _T_21; // @[Conditional.scala 37:30]
  wire  _T_22; // @[PktGen.scala 95:13]
  reg  _T_23; // @[PktGen.scala 95:35]
  wire  _T_24; // @[PktGen.scala 95:25]
  wire  _T_25; // @[PktGen.scala 95:50]
  wire  _T_26; // @[PktGen.scala 95:47]
  wire  _T_27; // @[PktGen.scala 99:31]
  wire [7:0] _T_35; // @[PRNG.scala 86:17]
  wire [15:0] _T_43; // @[PRNG.scala 86:17]
  wire  _T_44; // @[LFSR.scala 41:16]
  wire  _T_45; // @[LFSR.scala 41:16]
  wire  _T_46; // @[LFSR.scala 41:16]
  wire  _T_47; // @[LFSR.scala 41:16]
  wire  _T_48; // @[LFSR.scala 41:16]
  wire  _T_49; // @[LFSR.scala 41:16]
  wire  _T_50; // @[LFSR.scala 41:16]
  wire  _T_51; // @[LFSR.scala 41:16]
  wire  _T_52; // @[LFSR.scala 41:16]
  wire  _T_53; // @[LFSR.scala 41:16]
  wire  _T_54; // @[LFSR.scala 41:16]
  wire  _T_55; // @[LFSR.scala 41:16]
  wire  _T_56; // @[LFSR.scala 41:16]
  wire  _T_57; // @[LFSR.scala 41:16]
  wire  _T_58; // @[LFSR.scala 41:16]
  wire  _T_59; // @[LFSR.scala 41:16]
  wire [7:0] _T_67; // @[LFSR.scala 43:8]
  wire [15:0] _T_75; // @[LFSR.scala 43:8]
  wire [10:0] _T_77; // @[PktGen.scala 104:41]
  wire [10:0] _T_79; // @[PktGen.scala 104:51]
  wire [15:0] _GEN_85; // @[PktGen.scala 104:32]
  wire [15:0] _GEN_0; // @[PktGen.scala 104:32]
  wire [10:0] _T_80; // @[PktGen.scala 104:32]
  wire [10:0] _T_82; // @[PktGen.scala 104:59]
  wire [6:0] _GEN_11; // @[PktGen.scala 95:62]
  wire  _T_83; // @[Conditional.scala 37:30]
  wire  _T_84; // @[PktGen.scala 112:18]
  wire [15:0] _T_86; // @[PktGen.scala 116:22]
  wire [7:0] _GEN_14; // @[PktGen.scala 112:33]
  wire  _T_87; // @[Conditional.scala 37:30]
  wire [7:0] _T_88; // @[PktGen.scala 122:23]
  wire [55:0] _T_89; // @[PktGen.scala 123:23]
  wire  _T_90; // @[Conditional.scala 37:30]
  wire  _T_91; // @[PktGen.scala 126:18]
  wire [7:0] _T_92; // @[PktGen.scala 128:25]
  wire [55:0] _T_93; // @[PktGen.scala 129:25]
  wire [7:0] _T_94; // @[PktGen.scala 132:26]
  wire [55:0] _T_95; // @[PktGen.scala 133:26]
  wire [7:0] _GEN_17; // @[PktGen.scala 126:33]
  wire [55:0] _GEN_18; // @[PktGen.scala 126:33]
  wire  _T_98; // @[Conditional.scala 37:30]
  wire [7:0] _T_100; // @[PktGen.scala 140:28]
  wire [7:0] _GEN_21; // @[PktGen.scala 138:33]
  wire [55:0] _GEN_23; // @[PktGen.scala 138:33]
  wire  _T_105; // @[Conditional.scala 37:30]
  wire  _T_106; // @[PktGen.scala 149:18]
  wire  _T_107; // @[PktGen.scala 151:31]
  wire  _T_108; // @[PktGen.scala 153:38]
  wire  _T_109; // @[PktGen.scala 155:38]
  wire [7:0] _T_116; // @[PRNG.scala 86:17]
  wire [15:0] _T_124; // @[PRNG.scala 86:17]
  wire  _T_125; // @[LFSR.scala 41:16]
  wire  _T_126; // @[LFSR.scala 41:16]
  wire  _T_127; // @[LFSR.scala 41:16]
  wire  _T_128; // @[LFSR.scala 41:16]
  wire  _T_129; // @[LFSR.scala 41:16]
  wire  _T_130; // @[LFSR.scala 41:16]
  wire  _T_131; // @[LFSR.scala 41:16]
  wire  _T_132; // @[LFSR.scala 41:16]
  wire  _T_133; // @[LFSR.scala 41:16]
  wire  _T_134; // @[LFSR.scala 41:16]
  wire  _T_135; // @[LFSR.scala 41:16]
  wire  _T_136; // @[LFSR.scala 41:16]
  wire  _T_137; // @[LFSR.scala 41:16]
  wire  _T_138; // @[LFSR.scala 41:16]
  wire  _T_139; // @[LFSR.scala 41:16]
  wire  _T_140; // @[LFSR.scala 41:16]
  wire [7:0] _T_148; // @[LFSR.scala 43:8]
  wire [15:0] _T_156; // @[LFSR.scala 43:8]
  wire  _T_157; // @[PktGen.scala 157:38]
  wire [7:0] _GEN_24; // @[PktGen.scala 157:47]
  wire [15:0] _GEN_25; // @[PktGen.scala 155:47]
  wire [15:0] _GEN_26; // @[PktGen.scala 153:47]
  wire [15:0] _GEN_27; // @[PktGen.scala 151:40]
  wire [7:0] _T_158; // @[PktGen.scala 162:28]
  wire [15:0] _GEN_29; // @[PktGen.scala 149:33]
  wire  _T_161; // @[Conditional.scala 37:30]
  wire [15:0] _T_163; // @[PktGen.scala 167:30]
  wire [15:0] _T_165; // @[PktGen.scala 167:49]
  wire [15:0] _T_167; // @[PktGen.scala 167:67]
  wire [15:0] _T_169; // @[PktGen.scala 167:83]
  wire  _T_170; // @[PktGen.scala 167:18]
  wire [7:0] _T_174; // @[PktGen.scala 176:30]
  wire [7:0] _T_182; // @[PRNG.scala 86:17]
  wire [15:0] _T_190; // @[PRNG.scala 86:17]
  wire  _T_191; // @[LFSR.scala 41:16]
  wire  _T_192; // @[LFSR.scala 41:16]
  wire  _T_193; // @[LFSR.scala 41:16]
  wire  _T_194; // @[LFSR.scala 41:16]
  wire  _T_195; // @[LFSR.scala 41:16]
  wire  _T_196; // @[LFSR.scala 41:16]
  wire  _T_197; // @[LFSR.scala 41:16]
  wire  _T_198; // @[LFSR.scala 41:16]
  wire  _T_199; // @[LFSR.scala 41:16]
  wire  _T_200; // @[LFSR.scala 41:16]
  wire  _T_201; // @[LFSR.scala 41:16]
  wire  _T_202; // @[LFSR.scala 41:16]
  wire  _T_203; // @[LFSR.scala 41:16]
  wire  _T_204; // @[LFSR.scala 41:16]
  wire  _T_205; // @[LFSR.scala 41:16]
  wire  _T_206; // @[LFSR.scala 41:16]
  wire [7:0] _T_214; // @[LFSR.scala 43:8]
  wire [15:0] _T_222; // @[LFSR.scala 43:8]
  wire [7:0] _T_225; // @[PktGen.scala 180:30]
  wire [7:0] _GEN_31; // @[PktGen.scala 179:47]
  wire [15:0] _GEN_32; // @[PktGen.scala 177:47]
  wire [15:0] _GEN_33; // @[PktGen.scala 175:47]
  wire [15:0] _GEN_34; // @[PktGen.scala 173:40]
  wire [15:0] _GEN_37; // @[PktGen.scala 167:90]
  wire  _T_228; // @[Conditional.scala 37:30]
  wire  _T_229; // @[PktGen.scala 186:18]
  wire [7:0] _GEN_40; // @[PktGen.scala 186:33]
  wire  _T_234; // @[Conditional.scala 37:30]
  wire [15:0] _T_236; // @[PktGen.scala 197:41]
  wire [15:0] _T_238; // @[PktGen.scala 197:47]
  wire  _T_239; // @[PktGen.scala 197:18]
  wire [7:0] _GEN_48; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_52; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_55; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_59; // @[Conditional.scala 39:67]
  wire [55:0] _GEN_61; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_64; // @[Conditional.scala 39:67]
  wire [55:0] _GEN_65; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_70; // @[Conditional.scala 39:67]
  wire [55:0] _GEN_71; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_74; // @[Conditional.scala 39:67]
  wire [55:0] _GEN_76; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_81; // @[Conditional.scala 40:58]
  wire [55:0] _GEN_83; // @[Conditional.scala 40:58]
  EthFcsPadding eth_fcs_padding ( // @[PktGen.scala 50:32]
    .clock(eth_fcs_padding_clock),
    .reset(eth_fcs_padding_reset),
    .io_rx_en(eth_fcs_padding_io_rx_en),
    .io_rx_dat(eth_fcs_padding_io_rx_dat),
    .io_tx_en(eth_fcs_padding_io_tx_en),
    .io_tx_dat(eth_fcs_padding_io_tx_dat)
  );
  MaxPeriodFibonacciLFSR MaxPeriodFibonacciLFSR ( // @[PRNG.scala 82:22]
    .clock(MaxPeriodFibonacciLFSR_clock),
    .reset(MaxPeriodFibonacciLFSR_reset),
    .io_out_0(MaxPeriodFibonacciLFSR_io_out_0),
    .io_out_1(MaxPeriodFibonacciLFSR_io_out_1),
    .io_out_2(MaxPeriodFibonacciLFSR_io_out_2),
    .io_out_3(MaxPeriodFibonacciLFSR_io_out_3),
    .io_out_4(MaxPeriodFibonacciLFSR_io_out_4),
    .io_out_5(MaxPeriodFibonacciLFSR_io_out_5),
    .io_out_6(MaxPeriodFibonacciLFSR_io_out_6),
    .io_out_7(MaxPeriodFibonacciLFSR_io_out_7),
    .io_out_8(MaxPeriodFibonacciLFSR_io_out_8),
    .io_out_9(MaxPeriodFibonacciLFSR_io_out_9),
    .io_out_10(MaxPeriodFibonacciLFSR_io_out_10),
    .io_out_11(MaxPeriodFibonacciLFSR_io_out_11),
    .io_out_12(MaxPeriodFibonacciLFSR_io_out_12),
    .io_out_13(MaxPeriodFibonacciLFSR_io_out_13),
    .io_out_14(MaxPeriodFibonacciLFSR_io_out_14),
    .io_out_15(MaxPeriodFibonacciLFSR_io_out_15)
  );
  MaxPeriodFibonacciLFSR MaxPeriodFibonacciLFSR_1 ( // @[PRNG.scala 82:22]
    .clock(MaxPeriodFibonacciLFSR_1_clock),
    .reset(MaxPeriodFibonacciLFSR_1_reset),
    .io_out_0(MaxPeriodFibonacciLFSR_1_io_out_0),
    .io_out_1(MaxPeriodFibonacciLFSR_1_io_out_1),
    .io_out_2(MaxPeriodFibonacciLFSR_1_io_out_2),
    .io_out_3(MaxPeriodFibonacciLFSR_1_io_out_3),
    .io_out_4(MaxPeriodFibonacciLFSR_1_io_out_4),
    .io_out_5(MaxPeriodFibonacciLFSR_1_io_out_5),
    .io_out_6(MaxPeriodFibonacciLFSR_1_io_out_6),
    .io_out_7(MaxPeriodFibonacciLFSR_1_io_out_7),
    .io_out_8(MaxPeriodFibonacciLFSR_1_io_out_8),
    .io_out_9(MaxPeriodFibonacciLFSR_1_io_out_9),
    .io_out_10(MaxPeriodFibonacciLFSR_1_io_out_10),
    .io_out_11(MaxPeriodFibonacciLFSR_1_io_out_11),
    .io_out_12(MaxPeriodFibonacciLFSR_1_io_out_12),
    .io_out_13(MaxPeriodFibonacciLFSR_1_io_out_13),
    .io_out_14(MaxPeriodFibonacciLFSR_1_io_out_14),
    .io_out_15(MaxPeriodFibonacciLFSR_1_io_out_15)
  );
  MaxPeriodFibonacciLFSR MaxPeriodFibonacciLFSR_2 ( // @[PRNG.scala 82:22]
    .clock(MaxPeriodFibonacciLFSR_2_clock),
    .reset(MaxPeriodFibonacciLFSR_2_reset),
    .io_out_0(MaxPeriodFibonacciLFSR_2_io_out_0),
    .io_out_1(MaxPeriodFibonacciLFSR_2_io_out_1),
    .io_out_2(MaxPeriodFibonacciLFSR_2_io_out_2),
    .io_out_3(MaxPeriodFibonacciLFSR_2_io_out_3),
    .io_out_4(MaxPeriodFibonacciLFSR_2_io_out_4),
    .io_out_5(MaxPeriodFibonacciLFSR_2_io_out_5),
    .io_out_6(MaxPeriodFibonacciLFSR_2_io_out_6),
    .io_out_7(MaxPeriodFibonacciLFSR_2_io_out_7),
    .io_out_8(MaxPeriodFibonacciLFSR_2_io_out_8),
    .io_out_9(MaxPeriodFibonacciLFSR_2_io_out_9),
    .io_out_10(MaxPeriodFibonacciLFSR_2_io_out_10),
    .io_out_11(MaxPeriodFibonacciLFSR_2_io_out_11),
    .io_out_12(MaxPeriodFibonacciLFSR_2_io_out_12),
    .io_out_13(MaxPeriodFibonacciLFSR_2_io_out_13),
    .io_out_14(MaxPeriodFibonacciLFSR_2_io_out_14),
    .io_out_15(MaxPeriodFibonacciLFSR_2_io_out_15)
  );
  assign _T_1 = _T == 1'h0; // @[util.scala 13:34]
  assign _T_2 = io_enable & _T_1; // @[util.scala 13:31]
  assign _T_3 = io_tx_en == 1'h0; // @[util.scala 14:30]
  assign _T_5 = _T_3 & _T_4; // @[util.scala 14:33]
  assign _T_7 = send_count + 48'h1; // @[PktGen.scala 67:30]
  assign _T_9 = _T_8 == 1'h0; // @[util.scala 13:34]
  assign _T_10 = io_enable & _T_9; // @[util.scala 13:31]
  assign _T_11 = io_send_mode == 1'h0; // @[PktGen.scala 73:24]
  assign _GEN_84 = {{16'd0}, io_send_count}; // @[PktGen.scala 74:31]
  assign _T_12 = send_count == _GEN_84; // @[PktGen.scala 74:31]
  assign _T_15 = _T_3 & _T_14; // @[util.scala 14:33]
  assign _T_17 = total_send_count + 48'h1; // @[PktGen.scala 81:42]
  assign _T_19 = _T_18 == 1'h0; // @[util.scala 13:34]
  assign _T_20 = io_enable & _T_19; // @[util.scala 13:31]
  assign _T_21 = 4'h0 == state; // @[Conditional.scala 37:30]
  assign _T_22 = io_suspend == 1'h0; // @[PktGen.scala 95:13]
  assign _T_24 = _T_22 & _T_23; // @[PktGen.scala 95:25]
  assign _T_25 = send_done == 1'h0; // @[PktGen.scala 95:50]
  assign _T_26 = _T_24 & _T_25; // @[PktGen.scala 95:47]
  assign _T_27 = io_pkt_len_mode == 1'h0; // @[PktGen.scala 99:31]
  assign _T_35 = {MaxPeriodFibonacciLFSR_io_out_7,MaxPeriodFibonacciLFSR_io_out_6,MaxPeriodFibonacciLFSR_io_out_5,MaxPeriodFibonacciLFSR_io_out_4,MaxPeriodFibonacciLFSR_io_out_3,MaxPeriodFibonacciLFSR_io_out_2,MaxPeriodFibonacciLFSR_io_out_1,MaxPeriodFibonacciLFSR_io_out_0}; // @[PRNG.scala 86:17]
  assign _T_43 = {MaxPeriodFibonacciLFSR_io_out_15,MaxPeriodFibonacciLFSR_io_out_14,MaxPeriodFibonacciLFSR_io_out_13,MaxPeriodFibonacciLFSR_io_out_12,MaxPeriodFibonacciLFSR_io_out_11,MaxPeriodFibonacciLFSR_io_out_10,MaxPeriodFibonacciLFSR_io_out_9,MaxPeriodFibonacciLFSR_io_out_8,_T_35}; // @[PRNG.scala 86:17]
  assign _T_44 = _T_43[0]; // @[LFSR.scala 41:16]
  assign _T_45 = _T_43[1]; // @[LFSR.scala 41:16]
  assign _T_46 = _T_43[2]; // @[LFSR.scala 41:16]
  assign _T_47 = _T_43[3]; // @[LFSR.scala 41:16]
  assign _T_48 = _T_43[4]; // @[LFSR.scala 41:16]
  assign _T_49 = _T_43[5]; // @[LFSR.scala 41:16]
  assign _T_50 = _T_43[6]; // @[LFSR.scala 41:16]
  assign _T_51 = _T_43[7]; // @[LFSR.scala 41:16]
  assign _T_52 = _T_43[8]; // @[LFSR.scala 41:16]
  assign _T_53 = _T_43[9]; // @[LFSR.scala 41:16]
  assign _T_54 = _T_43[10]; // @[LFSR.scala 41:16]
  assign _T_55 = _T_43[11]; // @[LFSR.scala 41:16]
  assign _T_56 = _T_43[12]; // @[LFSR.scala 41:16]
  assign _T_57 = _T_43[13]; // @[LFSR.scala 41:16]
  assign _T_58 = _T_43[14]; // @[LFSR.scala 41:16]
  assign _T_59 = _T_43[15]; // @[LFSR.scala 41:16]
  assign _T_67 = {_T_52,_T_53,_T_54,_T_55,_T_56,_T_57,_T_58,_T_59}; // @[LFSR.scala 43:8]
  assign _T_75 = {_T_44,_T_45,_T_46,_T_47,_T_48,_T_49,_T_50,_T_51,_T_67}; // @[LFSR.scala 43:8]
  assign _T_77 = 11'h40 - 11'h5ee; // @[PktGen.scala 104:41]
  assign _T_79 = _T_77 + 11'h1; // @[PktGen.scala 104:51]
  assign _GEN_85 = {{5'd0}, _T_79}; // @[PktGen.scala 104:32]
  assign _GEN_0 = _T_75 % _GEN_85; // @[PktGen.scala 104:32]
  assign _T_80 = _GEN_0[10:0]; // @[PktGen.scala 104:32]
  assign _T_82 = _T_80 + 11'h40; // @[PktGen.scala 104:59]
  assign _GEN_11 = _T_26 ? 7'h55 : 7'h0; // @[PktGen.scala 95:62]
  assign _T_83 = 4'h2 == state; // @[Conditional.scala 37:30]
  assign _T_84 = cntr == 16'h6; // @[PktGen.scala 112:18]
  assign _T_86 = cntr + 16'h1; // @[PktGen.scala 116:22]
  assign _GEN_14 = _T_84 ? 8'hd5 : tx_data; // @[PktGen.scala 112:33]
  assign _T_87 = 4'h3 == state; // @[Conditional.scala 37:30]
  assign _T_88 = io_da[47:40]; // @[PktGen.scala 122:23]
  assign _T_89 = {io_da, 8'h0}; // @[PktGen.scala 123:23]
  assign _T_90 = 4'h5 == state; // @[Conditional.scala 37:30]
  assign _T_91 = cntr == 16'h5; // @[PktGen.scala 126:18]
  assign _T_92 = io_sa[47:40]; // @[PktGen.scala 128:25]
  assign _T_93 = {io_sa, 8'h0}; // @[PktGen.scala 129:25]
  assign _T_94 = load_r[47:40]; // @[PktGen.scala 132:26]
  assign _T_95 = {load_r, 8'h0}; // @[PktGen.scala 133:26]
  assign _GEN_17 = _T_91 ? _T_92 : _T_94; // @[PktGen.scala 126:33]
  assign _GEN_18 = _T_91 ? _T_93 : _T_95; // @[PktGen.scala 126:33]
  assign _T_98 = 4'h6 == state; // @[Conditional.scala 37:30]
  assign _T_100 = io_etype[15:8]; // @[PktGen.scala 140:28]
  assign _GEN_21 = _T_91 ? _T_100 : _T_94; // @[PktGen.scala 138:33]
  assign _GEN_23 = _T_91 ? {{8'd0}, load_r} : _T_95; // @[PktGen.scala 138:33]
  assign _T_105 = 4'h4 == state; // @[Conditional.scala 37:30]
  assign _T_106 = cntr == 16'h1; // @[PktGen.scala 149:18]
  assign _T_107 = io_payload_mode == 2'h0; // @[PktGen.scala 151:31]
  assign _T_108 = io_payload_mode == 2'h1; // @[PktGen.scala 153:38]
  assign _T_109 = io_payload_mode == 2'h2; // @[PktGen.scala 155:38]
  assign _T_116 = {MaxPeriodFibonacciLFSR_1_io_out_7,MaxPeriodFibonacciLFSR_1_io_out_6,MaxPeriodFibonacciLFSR_1_io_out_5,MaxPeriodFibonacciLFSR_1_io_out_4,MaxPeriodFibonacciLFSR_1_io_out_3,MaxPeriodFibonacciLFSR_1_io_out_2,MaxPeriodFibonacciLFSR_1_io_out_1,MaxPeriodFibonacciLFSR_1_io_out_0}; // @[PRNG.scala 86:17]
  assign _T_124 = {MaxPeriodFibonacciLFSR_1_io_out_15,MaxPeriodFibonacciLFSR_1_io_out_14,MaxPeriodFibonacciLFSR_1_io_out_13,MaxPeriodFibonacciLFSR_1_io_out_12,MaxPeriodFibonacciLFSR_1_io_out_11,MaxPeriodFibonacciLFSR_1_io_out_10,MaxPeriodFibonacciLFSR_1_io_out_9,MaxPeriodFibonacciLFSR_1_io_out_8,_T_116}; // @[PRNG.scala 86:17]
  assign _T_125 = _T_124[0]; // @[LFSR.scala 41:16]
  assign _T_126 = _T_124[1]; // @[LFSR.scala 41:16]
  assign _T_127 = _T_124[2]; // @[LFSR.scala 41:16]
  assign _T_128 = _T_124[3]; // @[LFSR.scala 41:16]
  assign _T_129 = _T_124[4]; // @[LFSR.scala 41:16]
  assign _T_130 = _T_124[5]; // @[LFSR.scala 41:16]
  assign _T_131 = _T_124[6]; // @[LFSR.scala 41:16]
  assign _T_132 = _T_124[7]; // @[LFSR.scala 41:16]
  assign _T_133 = _T_124[8]; // @[LFSR.scala 41:16]
  assign _T_134 = _T_124[9]; // @[LFSR.scala 41:16]
  assign _T_135 = _T_124[10]; // @[LFSR.scala 41:16]
  assign _T_136 = _T_124[11]; // @[LFSR.scala 41:16]
  assign _T_137 = _T_124[12]; // @[LFSR.scala 41:16]
  assign _T_138 = _T_124[13]; // @[LFSR.scala 41:16]
  assign _T_139 = _T_124[14]; // @[LFSR.scala 41:16]
  assign _T_140 = _T_124[15]; // @[LFSR.scala 41:16]
  assign _T_148 = {_T_133,_T_134,_T_135,_T_136,_T_137,_T_138,_T_139,_T_140}; // @[LFSR.scala 43:8]
  assign _T_156 = {_T_125,_T_126,_T_127,_T_128,_T_129,_T_130,_T_131,_T_132,_T_148}; // @[LFSR.scala 43:8]
  assign _T_157 = io_payload_mode == 2'h3; // @[PktGen.scala 157:38]
  assign _GEN_24 = _T_157 ? 8'h0 : tx_data; // @[PktGen.scala 157:47]
  assign _GEN_25 = _T_109 ? _T_156 : {{8'd0}, _GEN_24}; // @[PktGen.scala 155:47]
  assign _GEN_26 = _T_108 ? 16'h0 : _GEN_25; // @[PktGen.scala 153:47]
  assign _GEN_27 = _T_107 ? 16'h5a : _GEN_26; // @[PktGen.scala 151:40]
  assign _T_158 = io_etype[7:0]; // @[PktGen.scala 162:28]
  assign _GEN_29 = _T_106 ? _GEN_27 : {{8'd0}, _T_158}; // @[PktGen.scala 149:33]
  assign _T_161 = 4'h7 == state; // @[Conditional.scala 37:30]
  assign _T_163 = pkt_len - 16'hc; // @[PktGen.scala 167:30]
  assign _T_165 = _T_163 - 16'h2; // @[PktGen.scala 167:49]
  assign _T_167 = _T_165 - 16'h4; // @[PktGen.scala 167:67]
  assign _T_169 = _T_167 - 16'h1; // @[PktGen.scala 167:83]
  assign _T_170 = cntr == _T_169; // @[PktGen.scala 167:18]
  assign _T_174 = tx_data + 8'h1; // @[PktGen.scala 176:30]
  assign _T_182 = {MaxPeriodFibonacciLFSR_2_io_out_7,MaxPeriodFibonacciLFSR_2_io_out_6,MaxPeriodFibonacciLFSR_2_io_out_5,MaxPeriodFibonacciLFSR_2_io_out_4,MaxPeriodFibonacciLFSR_2_io_out_3,MaxPeriodFibonacciLFSR_2_io_out_2,MaxPeriodFibonacciLFSR_2_io_out_1,MaxPeriodFibonacciLFSR_2_io_out_0}; // @[PRNG.scala 86:17]
  assign _T_190 = {MaxPeriodFibonacciLFSR_2_io_out_15,MaxPeriodFibonacciLFSR_2_io_out_14,MaxPeriodFibonacciLFSR_2_io_out_13,MaxPeriodFibonacciLFSR_2_io_out_12,MaxPeriodFibonacciLFSR_2_io_out_11,MaxPeriodFibonacciLFSR_2_io_out_10,MaxPeriodFibonacciLFSR_2_io_out_9,MaxPeriodFibonacciLFSR_2_io_out_8,_T_182}; // @[PRNG.scala 86:17]
  assign _T_191 = _T_190[0]; // @[LFSR.scala 41:16]
  assign _T_192 = _T_190[1]; // @[LFSR.scala 41:16]
  assign _T_193 = _T_190[2]; // @[LFSR.scala 41:16]
  assign _T_194 = _T_190[3]; // @[LFSR.scala 41:16]
  assign _T_195 = _T_190[4]; // @[LFSR.scala 41:16]
  assign _T_196 = _T_190[5]; // @[LFSR.scala 41:16]
  assign _T_197 = _T_190[6]; // @[LFSR.scala 41:16]
  assign _T_198 = _T_190[7]; // @[LFSR.scala 41:16]
  assign _T_199 = _T_190[8]; // @[LFSR.scala 41:16]
  assign _T_200 = _T_190[9]; // @[LFSR.scala 41:16]
  assign _T_201 = _T_190[10]; // @[LFSR.scala 41:16]
  assign _T_202 = _T_190[11]; // @[LFSR.scala 41:16]
  assign _T_203 = _T_190[12]; // @[LFSR.scala 41:16]
  assign _T_204 = _T_190[13]; // @[LFSR.scala 41:16]
  assign _T_205 = _T_190[14]; // @[LFSR.scala 41:16]
  assign _T_206 = _T_190[15]; // @[LFSR.scala 41:16]
  assign _T_214 = {_T_199,_T_200,_T_201,_T_202,_T_203,_T_204,_T_205,_T_206}; // @[LFSR.scala 43:8]
  assign _T_222 = {_T_191,_T_192,_T_193,_T_194,_T_195,_T_196,_T_197,_T_198,_T_214}; // @[LFSR.scala 43:8]
  assign _T_225 = tx_data + 8'h8; // @[PktGen.scala 180:30]
  assign _GEN_31 = _T_157 ? _T_225 : tx_data; // @[PktGen.scala 179:47]
  assign _GEN_32 = _T_109 ? _T_222 : {{8'd0}, _GEN_31}; // @[PktGen.scala 177:47]
  assign _GEN_33 = _T_108 ? {{8'd0}, _T_174} : _GEN_32; // @[PktGen.scala 175:47]
  assign _GEN_34 = _T_107 ? 16'h5a : _GEN_33; // @[PktGen.scala 173:40]
  assign _GEN_37 = _T_170 ? 16'hab : _GEN_34; // @[PktGen.scala 167:90]
  assign _T_228 = 4'h8 == state; // @[Conditional.scala 37:30]
  assign _T_229 = cntr == 16'h3; // @[PktGen.scala 186:18]
  assign _GEN_40 = _T_229 ? 8'h0 : _T_174; // @[PktGen.scala 186:33]
  assign _T_234 = 4'h1 == state; // @[Conditional.scala 37:30]
  assign _T_236 = io_inter_frame_gap - 16'h1; // @[PktGen.scala 197:41]
  assign _T_238 = _T_236 - 16'h1; // @[PktGen.scala 197:47]
  assign _T_239 = cntr == _T_238; // @[PktGen.scala 197:18]
  assign _GEN_48 = _T_228 ? _GEN_40 : tx_data; // @[Conditional.scala 39:67]
  assign _GEN_52 = _T_161 ? _GEN_37 : {{8'd0}, _GEN_48}; // @[Conditional.scala 39:67]
  assign _GEN_55 = _T_105 ? _GEN_29 : _GEN_52; // @[Conditional.scala 39:67]
  assign _GEN_59 = _T_98 ? {{8'd0}, _GEN_21} : _GEN_55; // @[Conditional.scala 39:67]
  assign _GEN_61 = _T_98 ? _GEN_23 : {{8'd0}, load_r}; // @[Conditional.scala 39:67]
  assign _GEN_64 = _T_90 ? {{8'd0}, _GEN_17} : _GEN_59; // @[Conditional.scala 39:67]
  assign _GEN_65 = _T_90 ? _GEN_18 : _GEN_61; // @[Conditional.scala 39:67]
  assign _GEN_70 = _T_87 ? {{8'd0}, _T_88} : _GEN_64; // @[Conditional.scala 39:67]
  assign _GEN_71 = _T_87 ? _T_89 : _GEN_65; // @[Conditional.scala 39:67]
  assign _GEN_74 = _T_83 ? {{8'd0}, _GEN_14} : _GEN_70; // @[Conditional.scala 39:67]
  assign _GEN_76 = _T_83 ? {{8'd0}, load_r} : _GEN_71; // @[Conditional.scala 39:67]
  assign _GEN_81 = _T_21 ? {{9'd0}, _GEN_11} : _GEN_74; // @[Conditional.scala 40:58]
  assign _GEN_83 = _T_21 ? {{8'd0}, load_r} : _GEN_76; // @[Conditional.scala 40:58]
  assign io_send_done = send_done; // @[PktGen.scala 208:16]
  assign io_tx_en = eth_fcs_padding_io_tx_en; // @[PktGen.scala 210:14]
  assign io_tx_data = eth_fcs_padding_io_tx_dat; // @[PktGen.scala 211:14]
  assign io_total_send_count = total_send_count; // @[PktGen.scala 213:23]
  assign eth_fcs_padding_clock = clock;
  assign eth_fcs_padding_reset = reset;
  assign eth_fcs_padding_io_rx_en = tx_en; // @[PktGen.scala 205:29]
  assign eth_fcs_padding_io_rx_dat = tx_data; // @[PktGen.scala 206:29]
  assign MaxPeriodFibonacciLFSR_clock = clock;
  assign MaxPeriodFibonacciLFSR_reset = reset;
  assign MaxPeriodFibonacciLFSR_1_clock = clock;
  assign MaxPeriodFibonacciLFSR_1_reset = reset;
  assign MaxPeriodFibonacciLFSR_2_clock = clock;
  assign MaxPeriodFibonacciLFSR_2_reset = reset;
  always @(posedge clock) begin
    if (reset) begin
      state <= 4'h0;
    end else begin
      if (_T_21) begin
        if (_T_26) begin
          state <= 4'h2;
        end
      end else begin
        if (_T_83) begin
          if (_T_84) begin
            state <= 4'h3;
          end
        end else begin
          if (_T_87) begin
            state <= 4'h5;
          end else begin
            if (_T_90) begin
              if (_T_91) begin
                state <= 4'h6;
              end
            end else begin
              if (_T_98) begin
                if (_T_91) begin
                  state <= 4'h4;
                end
              end else begin
                if (_T_105) begin
                  if (_T_106) begin
                    state <= 4'h7;
                  end
                end else begin
                  if (_T_161) begin
                    if (_T_170) begin
                      state <= 4'h8;
                    end
                  end else begin
                    if (_T_228) begin
                      if (_T_229) begin
                        state <= 4'h1;
                      end
                    end else begin
                      if (_T_234) begin
                        if (_T_239) begin
                          state <= 4'h0;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      tx_en <= 1'h0;
    end else begin
      if (_T_21) begin
        tx_en <= _T_26;
      end else begin
        if (!(_T_83)) begin
          if (!(_T_87)) begin
            if (!(_T_90)) begin
              if (!(_T_98)) begin
                if (!(_T_105)) begin
                  if (!(_T_161)) begin
                    if (_T_228) begin
                      if (_T_229) begin
                        tx_en <= 1'h0;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      tx_data <= 8'h0;
    end else begin
      tx_data <= _GEN_81[7:0];
    end
    if (reset) begin
      cntr <= 16'h0;
    end else begin
      if (_T_21) begin
        cntr <= 16'h0;
      end else begin
        if (_T_83) begin
          if (!(_T_84)) begin
            cntr <= _T_86;
          end
        end else begin
          if (_T_87) begin
            cntr <= 16'h0;
          end else begin
            if (_T_90) begin
              if (_T_91) begin
                cntr <= 16'h0;
              end else begin
                cntr <= _T_86;
              end
            end else begin
              if (_T_98) begin
                if (_T_91) begin
                  cntr <= 16'h0;
                end else begin
                  cntr <= _T_86;
                end
              end else begin
                if (_T_105) begin
                  if (_T_106) begin
                    cntr <= 16'h0;
                  end else begin
                    cntr <= _T_86;
                  end
                end else begin
                  if (_T_161) begin
                    if (_T_170) begin
                      cntr <= 16'h0;
                    end else begin
                      cntr <= _T_86;
                    end
                  end else begin
                    if (_T_228) begin
                      if (_T_229) begin
                        cntr <= 16'h0;
                      end else begin
                        cntr <= _T_86;
                      end
                    end else begin
                      if (_T_234) begin
                        if (!(_T_239)) begin
                          cntr <= _T_86;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      pkt_len <= 16'h0;
    end else begin
      if (_T_21) begin
        if (_T_26) begin
          if (_T_27) begin
            pkt_len <= loaded_pkt_len;
          end else begin
            if (io_pkt_len_mode) begin
              pkt_len <= {{5'd0}, _T_82};
            end
          end
        end
      end
    end
    if (reset) begin
      total_send_count <= 48'h0;
    end else begin
      if (io_total_send_count_clr) begin
        total_send_count <= 48'h0;
      end else begin
        if (_T_15) begin
          total_send_count <= _T_17;
        end
      end
    end
    if (reset) begin
      send_count <= 48'h0;
    end else begin
      if (_T_2) begin
        send_count <= 48'h0;
      end else begin
        if (_T_5) begin
          send_count <= _T_7;
        end
      end
    end
    if (reset) begin
      send_done <= 1'h0;
    end else begin
      if (_T_10) begin
        send_done <= 1'h0;
      end else begin
        if (_T_11) begin
          send_done <= _T_12;
        end
      end
    end
    if (reset) begin
      loaded_pkt_len <= 16'h0;
    end else begin
      if (_T_20) begin
        loaded_pkt_len <= io_pkt_len_init;
      end
    end
    _T <= io_enable;
    _T_4 <= io_tx_en;
    _T_8 <= io_enable;
    _T_14 <= io_tx_en;
    _T_18 <= io_enable;
    if (reset) begin
      load_r <= 48'h0;
    end else begin
      load_r <= _GEN_83[47:0];
    end
    _T_23 <= io_enable;
  end
endmodule
