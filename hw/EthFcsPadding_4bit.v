module EthCRC32_4bit(
  input         clock,
  input         reset,
  input  [3:0]  io_data,
  input         io_enable,
  input         io_start,
  output [31:0] io_crc
);
  reg [31:0] c; // @[EthFcsPadding.scala 179:18]
  wire  _T_1; // @[EthFcsPadding.scala 183:19]
  wire  _T_2; // @[EthFcsPadding.scala 183:31]
  wire  _T_3; // @[EthFcsPadding.scala 183:43]
  wire  _T_4; // @[EthFcsPadding.scala 183:54]
  wire [3:0] d; // @[Cat.scala 29:58]
  wire  _T_8; // @[EthFcsPadding.scala 185:18]
  wire  _T_9; // @[EthFcsPadding.scala 185:25]
  wire  newcrc_0; // @[EthFcsPadding.scala 185:22]
  wire  _T_11; // @[EthFcsPadding.scala 186:18]
  wire  _T_13; // @[EthFcsPadding.scala 186:22]
  wire  _T_15; // @[EthFcsPadding.scala 186:30]
  wire  _T_16; // @[EthFcsPadding.scala 186:41]
  wire  newcrc_1; // @[EthFcsPadding.scala 186:38]
  wire  _T_18; // @[EthFcsPadding.scala 187:18]
  wire  _T_20; // @[EthFcsPadding.scala 187:22]
  wire  _T_22; // @[EthFcsPadding.scala 187:30]
  wire  _T_24; // @[EthFcsPadding.scala 187:38]
  wire  _T_26; // @[EthFcsPadding.scala 187:46]
  wire  _T_27; // @[EthFcsPadding.scala 187:57]
  wire  newcrc_2; // @[EthFcsPadding.scala 187:54]
  wire  _T_29; // @[EthFcsPadding.scala 188:18]
  wire  _T_31; // @[EthFcsPadding.scala 188:22]
  wire  _T_33; // @[EthFcsPadding.scala 188:30]
  wire  _T_35; // @[EthFcsPadding.scala 188:38]
  wire  _T_37; // @[EthFcsPadding.scala 188:46]
  wire  _T_38; // @[EthFcsPadding.scala 188:57]
  wire  newcrc_3; // @[EthFcsPadding.scala 188:54]
  wire  _T_44; // @[EthFcsPadding.scala 189:30]
  wire  _T_45; // @[EthFcsPadding.scala 189:41]
  wire  _T_46; // @[EthFcsPadding.scala 189:38]
  wire  _T_48; // @[EthFcsPadding.scala 189:46]
  wire  _T_50; // @[EthFcsPadding.scala 189:54]
  wire  newcrc_4; // @[EthFcsPadding.scala 189:62]
  wire  _T_55; // @[EthFcsPadding.scala 190:22]
  wire  _T_57; // @[EthFcsPadding.scala 190:30]
  wire  _T_58; // @[EthFcsPadding.scala 190:41]
  wire  _T_59; // @[EthFcsPadding.scala 190:38]
  wire  _T_61; // @[EthFcsPadding.scala 190:46]
  wire  _T_63; // @[EthFcsPadding.scala 190:54]
  wire  newcrc_5; // @[EthFcsPadding.scala 190:62]
  wire  _T_69; // @[EthFcsPadding.scala 191:33]
  wire  _T_70; // @[EthFcsPadding.scala 191:30]
  wire  _T_72; // @[EthFcsPadding.scala 191:38]
  wire  newcrc_6; // @[EthFcsPadding.scala 191:46]
  wire  _T_80; // @[EthFcsPadding.scala 192:41]
  wire  _T_81; // @[EthFcsPadding.scala 192:38]
  wire  _T_83; // @[EthFcsPadding.scala 192:46]
  wire  _T_85; // @[EthFcsPadding.scala 192:54]
  wire  newcrc_7; // @[EthFcsPadding.scala 192:62]
  wire  _T_93; // @[EthFcsPadding.scala 193:41]
  wire  _T_94; // @[EthFcsPadding.scala 193:38]
  wire  _T_96; // @[EthFcsPadding.scala 193:46]
  wire  _T_98; // @[EthFcsPadding.scala 193:54]
  wire  newcrc_8; // @[EthFcsPadding.scala 193:62]
  wire  _T_104; // @[EthFcsPadding.scala 194:33]
  wire  _T_105; // @[EthFcsPadding.scala 194:30]
  wire  _T_107; // @[EthFcsPadding.scala 194:38]
  wire  newcrc_9; // @[EthFcsPadding.scala 194:46]
  wire  _T_115; // @[EthFcsPadding.scala 195:41]
  wire  _T_116; // @[EthFcsPadding.scala 195:38]
  wire  _T_118; // @[EthFcsPadding.scala 195:46]
  wire  _T_120; // @[EthFcsPadding.scala 195:54]
  wire  newcrc_10; // @[EthFcsPadding.scala 195:62]
  wire  _T_128; // @[EthFcsPadding.scala 196:41]
  wire  _T_129; // @[EthFcsPadding.scala 196:38]
  wire  _T_131; // @[EthFcsPadding.scala 196:46]
  wire  _T_133; // @[EthFcsPadding.scala 196:54]
  wire  newcrc_11; // @[EthFcsPadding.scala 196:62]
  wire  _T_141; // @[EthFcsPadding.scala 197:41]
  wire  _T_142; // @[EthFcsPadding.scala 197:38]
  wire  _T_144; // @[EthFcsPadding.scala 197:46]
  wire  _T_146; // @[EthFcsPadding.scala 197:54]
  wire  newcrc_12; // @[EthFcsPadding.scala 197:62]
  wire  _T_154; // @[EthFcsPadding.scala 198:41]
  wire  _T_155; // @[EthFcsPadding.scala 198:38]
  wire  _T_157; // @[EthFcsPadding.scala 198:46]
  wire  _T_159; // @[EthFcsPadding.scala 198:54]
  wire  newcrc_13; // @[EthFcsPadding.scala 198:62]
  wire  _T_165; // @[EthFcsPadding.scala 199:33]
  wire  _T_166; // @[EthFcsPadding.scala 199:30]
  wire  _T_168; // @[EthFcsPadding.scala 199:38]
  wire  newcrc_14; // @[EthFcsPadding.scala 199:46]
  wire  _T_172; // @[EthFcsPadding.scala 200:25]
  wire  _T_173; // @[EthFcsPadding.scala 200:22]
  wire  newcrc_15; // @[EthFcsPadding.scala 200:30]
  wire  _T_177; // @[EthFcsPadding.scala 201:25]
  wire  _T_178; // @[EthFcsPadding.scala 201:22]
  wire  newcrc_16; // @[EthFcsPadding.scala 201:30]
  wire  _T_182; // @[EthFcsPadding.scala 202:25]
  wire  _T_183; // @[EthFcsPadding.scala 202:22]
  wire  newcrc_17; // @[EthFcsPadding.scala 202:30]
  wire  _T_187; // @[EthFcsPadding.scala 203:25]
  wire  _T_188; // @[EthFcsPadding.scala 203:22]
  wire  newcrc_18; // @[EthFcsPadding.scala 203:30]
  wire  _T_192; // @[EthFcsPadding.scala 204:25]
  wire  _T_193; // @[EthFcsPadding.scala 204:22]
  wire  newcrc_19; // @[EthFcsPadding.scala 204:30]
  wire  newcrc_20; // @[EthFcsPadding.scala 205:18]
  wire  newcrc_21; // @[EthFcsPadding.scala 206:18]
  wire  _T_199; // @[EthFcsPadding.scala 207:25]
  wire  _T_200; // @[EthFcsPadding.scala 207:22]
  wire  newcrc_22; // @[EthFcsPadding.scala 207:30]
  wire  _T_206; // @[EthFcsPadding.scala 208:33]
  wire  _T_207; // @[EthFcsPadding.scala 208:30]
  wire  _T_209; // @[EthFcsPadding.scala 208:38]
  wire  newcrc_23; // @[EthFcsPadding.scala 208:46]
  wire  _T_215; // @[EthFcsPadding.scala 209:33]
  wire  _T_216; // @[EthFcsPadding.scala 209:30]
  wire  _T_218; // @[EthFcsPadding.scala 209:38]
  wire  newcrc_24; // @[EthFcsPadding.scala 209:46]
  wire  _T_224; // @[EthFcsPadding.scala 210:33]
  wire  _T_225; // @[EthFcsPadding.scala 210:30]
  wire  _T_227; // @[EthFcsPadding.scala 210:38]
  wire  newcrc_25; // @[EthFcsPadding.scala 210:46]
  wire  _T_232; // @[EthFcsPadding.scala 211:22]
  wire  _T_233; // @[EthFcsPadding.scala 211:33]
  wire  _T_234; // @[EthFcsPadding.scala 211:30]
  wire  _T_236; // @[EthFcsPadding.scala 211:38]
  wire  newcrc_26; // @[EthFcsPadding.scala 211:46]
  wire  _T_240; // @[EthFcsPadding.scala 212:25]
  wire  _T_241; // @[EthFcsPadding.scala 212:22]
  wire  newcrc_27; // @[EthFcsPadding.scala 212:30]
  wire  _T_245; // @[EthFcsPadding.scala 213:25]
  wire  _T_246; // @[EthFcsPadding.scala 213:22]
  wire  newcrc_28; // @[EthFcsPadding.scala 213:30]
  wire  _T_250; // @[EthFcsPadding.scala 214:25]
  wire  _T_251; // @[EthFcsPadding.scala 214:22]
  wire  newcrc_29; // @[EthFcsPadding.scala 214:30]
  wire  newcrc_30; // @[EthFcsPadding.scala 215:18]
  wire  newcrc_31; // @[EthFcsPadding.scala 216:18]
  wire  _T_256; // @[EthFcsPadding.scala 218:9]
  wire [7:0] _T_264; // @[EthFcsPadding.scala 221:25]
  wire [15:0] _T_272; // @[EthFcsPadding.scala 221:25]
  wire [7:0] _T_279; // @[EthFcsPadding.scala 221:25]
  wire [31:0] _T_288; // @[EthFcsPadding.scala 221:25]
  wire [31:0] crc_r; // @[EthFcsPadding.scala 227:12]
  wire  _T_290; // @[EthFcsPadding.scala 229:22]
  wire  _T_291; // @[EthFcsPadding.scala 229:32]
  wire  _T_292; // @[EthFcsPadding.scala 229:42]
  wire  _T_293; // @[EthFcsPadding.scala 229:52]
  wire  _T_294; // @[EthFcsPadding.scala 229:62]
  wire  _T_295; // @[EthFcsPadding.scala 229:72]
  wire  _T_296; // @[EthFcsPadding.scala 229:82]
  wire  _T_297; // @[EthFcsPadding.scala 229:92]
  wire  _T_298; // @[EthFcsPadding.scala 230:22]
  wire  _T_299; // @[EthFcsPadding.scala 230:32]
  wire  _T_300; // @[EthFcsPadding.scala 230:42]
  wire  _T_301; // @[EthFcsPadding.scala 230:52]
  wire  _T_302; // @[EthFcsPadding.scala 230:62]
  wire  _T_303; // @[EthFcsPadding.scala 230:72]
  wire  _T_304; // @[EthFcsPadding.scala 230:82]
  wire  _T_305; // @[EthFcsPadding.scala 230:92]
  wire  _T_306; // @[EthFcsPadding.scala 231:22]
  wire  _T_307; // @[EthFcsPadding.scala 231:32]
  wire  _T_308; // @[EthFcsPadding.scala 231:42]
  wire  _T_309; // @[EthFcsPadding.scala 231:52]
  wire  _T_310; // @[EthFcsPadding.scala 231:62]
  wire  _T_311; // @[EthFcsPadding.scala 231:72]
  wire  _T_312; // @[EthFcsPadding.scala 231:82]
  wire  _T_313; // @[EthFcsPadding.scala 231:92]
  wire  _T_314; // @[EthFcsPadding.scala 232:22]
  wire  _T_315; // @[EthFcsPadding.scala 232:32]
  wire  _T_316; // @[EthFcsPadding.scala 232:42]
  wire  _T_317; // @[EthFcsPadding.scala 232:52]
  wire  _T_318; // @[EthFcsPadding.scala 232:62]
  wire  _T_319; // @[EthFcsPadding.scala 232:72]
  wire  _T_320; // @[EthFcsPadding.scala 232:82]
  wire  _T_321; // @[EthFcsPadding.scala 232:92]
  wire [7:0] _T_328; // @[Cat.scala 29:58]
  wire [15:0] _T_336; // @[Cat.scala 29:58]
  wire [7:0] _T_343; // @[Cat.scala 29:58]
  wire [15:0] _T_351; // @[Cat.scala 29:58]
  assign _T_1 = io_data[0]; // @[EthFcsPadding.scala 183:19]
  assign _T_2 = io_data[1]; // @[EthFcsPadding.scala 183:31]
  assign _T_3 = io_data[2]; // @[EthFcsPadding.scala 183:43]
  assign _T_4 = io_data[3]; // @[EthFcsPadding.scala 183:54]
  assign d = {_T_1,_T_2,_T_3,_T_4}; // @[Cat.scala 29:58]
  assign _T_8 = d[0]; // @[EthFcsPadding.scala 185:18]
  assign _T_9 = c[28]; // @[EthFcsPadding.scala 185:25]
  assign newcrc_0 = _T_8 ^ _T_9; // @[EthFcsPadding.scala 185:22]
  assign _T_11 = d[1]; // @[EthFcsPadding.scala 186:18]
  assign _T_13 = _T_11 ^ _T_8; // @[EthFcsPadding.scala 186:22]
  assign _T_15 = _T_13 ^ _T_9; // @[EthFcsPadding.scala 186:30]
  assign _T_16 = c[29]; // @[EthFcsPadding.scala 186:41]
  assign newcrc_1 = _T_15 ^ _T_16; // @[EthFcsPadding.scala 186:38]
  assign _T_18 = d[2]; // @[EthFcsPadding.scala 187:18]
  assign _T_20 = _T_18 ^ _T_11; // @[EthFcsPadding.scala 187:22]
  assign _T_22 = _T_20 ^ _T_8; // @[EthFcsPadding.scala 187:30]
  assign _T_24 = _T_22 ^ _T_9; // @[EthFcsPadding.scala 187:38]
  assign _T_26 = _T_24 ^ _T_16; // @[EthFcsPadding.scala 187:46]
  assign _T_27 = c[30]; // @[EthFcsPadding.scala 187:57]
  assign newcrc_2 = _T_26 ^ _T_27; // @[EthFcsPadding.scala 187:54]
  assign _T_29 = d[3]; // @[EthFcsPadding.scala 188:18]
  assign _T_31 = _T_29 ^ _T_18; // @[EthFcsPadding.scala 188:22]
  assign _T_33 = _T_31 ^ _T_11; // @[EthFcsPadding.scala 188:30]
  assign _T_35 = _T_33 ^ _T_16; // @[EthFcsPadding.scala 188:38]
  assign _T_37 = _T_35 ^ _T_27; // @[EthFcsPadding.scala 188:46]
  assign _T_38 = c[31]; // @[EthFcsPadding.scala 188:57]
  assign newcrc_3 = _T_37 ^ _T_38; // @[EthFcsPadding.scala 188:54]
  assign _T_44 = _T_31 ^ _T_8; // @[EthFcsPadding.scala 189:30]
  assign _T_45 = c[0]; // @[EthFcsPadding.scala 189:41]
  assign _T_46 = _T_44 ^ _T_45; // @[EthFcsPadding.scala 189:38]
  assign _T_48 = _T_46 ^ _T_9; // @[EthFcsPadding.scala 189:46]
  assign _T_50 = _T_48 ^ _T_27; // @[EthFcsPadding.scala 189:54]
  assign newcrc_4 = _T_50 ^ _T_38; // @[EthFcsPadding.scala 189:62]
  assign _T_55 = _T_29 ^ _T_11; // @[EthFcsPadding.scala 190:22]
  assign _T_57 = _T_55 ^ _T_8; // @[EthFcsPadding.scala 190:30]
  assign _T_58 = c[1]; // @[EthFcsPadding.scala 190:41]
  assign _T_59 = _T_57 ^ _T_58; // @[EthFcsPadding.scala 190:38]
  assign _T_61 = _T_59 ^ _T_9; // @[EthFcsPadding.scala 190:46]
  assign _T_63 = _T_61 ^ _T_16; // @[EthFcsPadding.scala 190:54]
  assign newcrc_5 = _T_63 ^ _T_38; // @[EthFcsPadding.scala 190:62]
  assign _T_69 = c[2]; // @[EthFcsPadding.scala 191:33]
  assign _T_70 = _T_20 ^ _T_69; // @[EthFcsPadding.scala 191:30]
  assign _T_72 = _T_70 ^ _T_16; // @[EthFcsPadding.scala 191:38]
  assign newcrc_6 = _T_72 ^ _T_27; // @[EthFcsPadding.scala 191:46]
  assign _T_80 = c[3]; // @[EthFcsPadding.scala 192:41]
  assign _T_81 = _T_44 ^ _T_80; // @[EthFcsPadding.scala 192:38]
  assign _T_83 = _T_81 ^ _T_9; // @[EthFcsPadding.scala 192:46]
  assign _T_85 = _T_83 ^ _T_27; // @[EthFcsPadding.scala 192:54]
  assign newcrc_7 = _T_85 ^ _T_38; // @[EthFcsPadding.scala 192:62]
  assign _T_93 = c[4]; // @[EthFcsPadding.scala 193:41]
  assign _T_94 = _T_57 ^ _T_93; // @[EthFcsPadding.scala 193:38]
  assign _T_96 = _T_94 ^ _T_9; // @[EthFcsPadding.scala 193:46]
  assign _T_98 = _T_96 ^ _T_16; // @[EthFcsPadding.scala 193:54]
  assign newcrc_8 = _T_98 ^ _T_38; // @[EthFcsPadding.scala 193:62]
  assign _T_104 = c[5]; // @[EthFcsPadding.scala 194:33]
  assign _T_105 = _T_20 ^ _T_104; // @[EthFcsPadding.scala 194:30]
  assign _T_107 = _T_105 ^ _T_16; // @[EthFcsPadding.scala 194:38]
  assign newcrc_9 = _T_107 ^ _T_27; // @[EthFcsPadding.scala 194:46]
  assign _T_115 = c[6]; // @[EthFcsPadding.scala 195:41]
  assign _T_116 = _T_44 ^ _T_115; // @[EthFcsPadding.scala 195:38]
  assign _T_118 = _T_116 ^ _T_9; // @[EthFcsPadding.scala 195:46]
  assign _T_120 = _T_118 ^ _T_27; // @[EthFcsPadding.scala 195:54]
  assign newcrc_10 = _T_120 ^ _T_38; // @[EthFcsPadding.scala 195:62]
  assign _T_128 = c[7]; // @[EthFcsPadding.scala 196:41]
  assign _T_129 = _T_57 ^ _T_128; // @[EthFcsPadding.scala 196:38]
  assign _T_131 = _T_129 ^ _T_9; // @[EthFcsPadding.scala 196:46]
  assign _T_133 = _T_131 ^ _T_16; // @[EthFcsPadding.scala 196:54]
  assign newcrc_11 = _T_133 ^ _T_38; // @[EthFcsPadding.scala 196:62]
  assign _T_141 = c[8]; // @[EthFcsPadding.scala 197:41]
  assign _T_142 = _T_22 ^ _T_141; // @[EthFcsPadding.scala 197:38]
  assign _T_144 = _T_142 ^ _T_9; // @[EthFcsPadding.scala 197:46]
  assign _T_146 = _T_144 ^ _T_16; // @[EthFcsPadding.scala 197:54]
  assign newcrc_12 = _T_146 ^ _T_27; // @[EthFcsPadding.scala 197:62]
  assign _T_154 = c[9]; // @[EthFcsPadding.scala 198:41]
  assign _T_155 = _T_33 ^ _T_154; // @[EthFcsPadding.scala 198:38]
  assign _T_157 = _T_155 ^ _T_16; // @[EthFcsPadding.scala 198:46]
  assign _T_159 = _T_157 ^ _T_27; // @[EthFcsPadding.scala 198:54]
  assign newcrc_13 = _T_159 ^ _T_38; // @[EthFcsPadding.scala 198:62]
  assign _T_165 = c[10]; // @[EthFcsPadding.scala 199:33]
  assign _T_166 = _T_31 ^ _T_165; // @[EthFcsPadding.scala 199:30]
  assign _T_168 = _T_166 ^ _T_27; // @[EthFcsPadding.scala 199:38]
  assign newcrc_14 = _T_168 ^ _T_38; // @[EthFcsPadding.scala 199:46]
  assign _T_172 = c[11]; // @[EthFcsPadding.scala 200:25]
  assign _T_173 = _T_29 ^ _T_172; // @[EthFcsPadding.scala 200:22]
  assign newcrc_15 = _T_173 ^ _T_38; // @[EthFcsPadding.scala 200:30]
  assign _T_177 = c[12]; // @[EthFcsPadding.scala 201:25]
  assign _T_178 = _T_8 ^ _T_177; // @[EthFcsPadding.scala 201:22]
  assign newcrc_16 = _T_178 ^ _T_9; // @[EthFcsPadding.scala 201:30]
  assign _T_182 = c[13]; // @[EthFcsPadding.scala 202:25]
  assign _T_183 = _T_11 ^ _T_182; // @[EthFcsPadding.scala 202:22]
  assign newcrc_17 = _T_183 ^ _T_16; // @[EthFcsPadding.scala 202:30]
  assign _T_187 = c[14]; // @[EthFcsPadding.scala 203:25]
  assign _T_188 = _T_18 ^ _T_187; // @[EthFcsPadding.scala 203:22]
  assign newcrc_18 = _T_188 ^ _T_27; // @[EthFcsPadding.scala 203:30]
  assign _T_192 = c[15]; // @[EthFcsPadding.scala 204:25]
  assign _T_193 = _T_29 ^ _T_192; // @[EthFcsPadding.scala 204:22]
  assign newcrc_19 = _T_193 ^ _T_38; // @[EthFcsPadding.scala 204:30]
  assign newcrc_20 = c[16]; // @[EthFcsPadding.scala 205:18]
  assign newcrc_21 = c[17]; // @[EthFcsPadding.scala 206:18]
  assign _T_199 = c[18]; // @[EthFcsPadding.scala 207:25]
  assign _T_200 = _T_8 ^ _T_199; // @[EthFcsPadding.scala 207:22]
  assign newcrc_22 = _T_200 ^ _T_9; // @[EthFcsPadding.scala 207:30]
  assign _T_206 = c[19]; // @[EthFcsPadding.scala 208:33]
  assign _T_207 = _T_13 ^ _T_206; // @[EthFcsPadding.scala 208:30]
  assign _T_209 = _T_207 ^ _T_9; // @[EthFcsPadding.scala 208:38]
  assign newcrc_23 = _T_209 ^ _T_16; // @[EthFcsPadding.scala 208:46]
  assign _T_215 = c[20]; // @[EthFcsPadding.scala 209:33]
  assign _T_216 = _T_20 ^ _T_215; // @[EthFcsPadding.scala 209:30]
  assign _T_218 = _T_216 ^ _T_16; // @[EthFcsPadding.scala 209:38]
  assign newcrc_24 = _T_218 ^ _T_27; // @[EthFcsPadding.scala 209:46]
  assign _T_224 = c[21]; // @[EthFcsPadding.scala 210:33]
  assign _T_225 = _T_31 ^ _T_224; // @[EthFcsPadding.scala 210:30]
  assign _T_227 = _T_225 ^ _T_27; // @[EthFcsPadding.scala 210:38]
  assign newcrc_25 = _T_227 ^ _T_38; // @[EthFcsPadding.scala 210:46]
  assign _T_232 = _T_29 ^ _T_8; // @[EthFcsPadding.scala 211:22]
  assign _T_233 = c[22]; // @[EthFcsPadding.scala 211:33]
  assign _T_234 = _T_232 ^ _T_233; // @[EthFcsPadding.scala 211:30]
  assign _T_236 = _T_234 ^ _T_9; // @[EthFcsPadding.scala 211:38]
  assign newcrc_26 = _T_236 ^ _T_38; // @[EthFcsPadding.scala 211:46]
  assign _T_240 = c[23]; // @[EthFcsPadding.scala 212:25]
  assign _T_241 = _T_11 ^ _T_240; // @[EthFcsPadding.scala 212:22]
  assign newcrc_27 = _T_241 ^ _T_16; // @[EthFcsPadding.scala 212:30]
  assign _T_245 = c[24]; // @[EthFcsPadding.scala 213:25]
  assign _T_246 = _T_18 ^ _T_245; // @[EthFcsPadding.scala 213:22]
  assign newcrc_28 = _T_246 ^ _T_27; // @[EthFcsPadding.scala 213:30]
  assign _T_250 = c[25]; // @[EthFcsPadding.scala 214:25]
  assign _T_251 = _T_29 ^ _T_250; // @[EthFcsPadding.scala 214:22]
  assign newcrc_29 = _T_251 ^ _T_38; // @[EthFcsPadding.scala 214:30]
  assign newcrc_30 = c[26]; // @[EthFcsPadding.scala 215:18]
  assign newcrc_31 = c[27]; // @[EthFcsPadding.scala 216:18]
  assign _T_256 = io_start == 1'h0; // @[EthFcsPadding.scala 218:9]
  assign _T_264 = {newcrc_7,newcrc_6,newcrc_5,newcrc_4,newcrc_3,newcrc_2,newcrc_1,newcrc_0}; // @[EthFcsPadding.scala 221:25]
  assign _T_272 = {newcrc_15,newcrc_14,newcrc_13,newcrc_12,newcrc_11,newcrc_10,newcrc_9,newcrc_8,_T_264}; // @[EthFcsPadding.scala 221:25]
  assign _T_279 = {newcrc_23,newcrc_22,newcrc_21,newcrc_20,newcrc_19,newcrc_18,newcrc_17,newcrc_16}; // @[EthFcsPadding.scala 221:25]
  assign _T_288 = {newcrc_31,newcrc_30,newcrc_29,newcrc_28,newcrc_27,newcrc_26,newcrc_25,newcrc_24,_T_279,_T_272}; // @[EthFcsPadding.scala 221:25]
  assign crc_r = ~ c; // @[EthFcsPadding.scala 227:12]
  assign _T_290 = crc_r[0]; // @[EthFcsPadding.scala 229:22]
  assign _T_291 = crc_r[1]; // @[EthFcsPadding.scala 229:32]
  assign _T_292 = crc_r[2]; // @[EthFcsPadding.scala 229:42]
  assign _T_293 = crc_r[3]; // @[EthFcsPadding.scala 229:52]
  assign _T_294 = crc_r[4]; // @[EthFcsPadding.scala 229:62]
  assign _T_295 = crc_r[5]; // @[EthFcsPadding.scala 229:72]
  assign _T_296 = crc_r[6]; // @[EthFcsPadding.scala 229:82]
  assign _T_297 = crc_r[7]; // @[EthFcsPadding.scala 229:92]
  assign _T_298 = crc_r[8]; // @[EthFcsPadding.scala 230:22]
  assign _T_299 = crc_r[9]; // @[EthFcsPadding.scala 230:32]
  assign _T_300 = crc_r[10]; // @[EthFcsPadding.scala 230:42]
  assign _T_301 = crc_r[11]; // @[EthFcsPadding.scala 230:52]
  assign _T_302 = crc_r[12]; // @[EthFcsPadding.scala 230:62]
  assign _T_303 = crc_r[13]; // @[EthFcsPadding.scala 230:72]
  assign _T_304 = crc_r[14]; // @[EthFcsPadding.scala 230:82]
  assign _T_305 = crc_r[15]; // @[EthFcsPadding.scala 230:92]
  assign _T_306 = crc_r[16]; // @[EthFcsPadding.scala 231:22]
  assign _T_307 = crc_r[17]; // @[EthFcsPadding.scala 231:32]
  assign _T_308 = crc_r[18]; // @[EthFcsPadding.scala 231:42]
  assign _T_309 = crc_r[19]; // @[EthFcsPadding.scala 231:52]
  assign _T_310 = crc_r[20]; // @[EthFcsPadding.scala 231:62]
  assign _T_311 = crc_r[21]; // @[EthFcsPadding.scala 231:72]
  assign _T_312 = crc_r[22]; // @[EthFcsPadding.scala 231:82]
  assign _T_313 = crc_r[23]; // @[EthFcsPadding.scala 231:92]
  assign _T_314 = crc_r[24]; // @[EthFcsPadding.scala 232:22]
  assign _T_315 = crc_r[25]; // @[EthFcsPadding.scala 232:32]
  assign _T_316 = crc_r[26]; // @[EthFcsPadding.scala 232:42]
  assign _T_317 = crc_r[27]; // @[EthFcsPadding.scala 232:52]
  assign _T_318 = crc_r[28]; // @[EthFcsPadding.scala 232:62]
  assign _T_319 = crc_r[29]; // @[EthFcsPadding.scala 232:72]
  assign _T_320 = crc_r[30]; // @[EthFcsPadding.scala 232:82]
  assign _T_321 = crc_r[31]; // @[EthFcsPadding.scala 232:92]
  assign _T_328 = {_T_314,_T_315,_T_316,_T_317,_T_318,_T_319,_T_320,_T_321}; // @[Cat.scala 29:58]
  assign _T_336 = {_T_306,_T_307,_T_308,_T_309,_T_310,_T_311,_T_312,_T_313,_T_328}; // @[Cat.scala 29:58]
  assign _T_343 = {_T_298,_T_299,_T_300,_T_301,_T_302,_T_303,_T_304,_T_305}; // @[Cat.scala 29:58]
  assign _T_351 = {_T_290,_T_291,_T_292,_T_293,_T_294,_T_295,_T_296,_T_297,_T_343}; // @[Cat.scala 29:58]
  assign io_crc = {_T_351,_T_336}; // @[EthFcsPadding.scala 229:10]
  always @(posedge clock) begin
    if (reset) begin
      c <= 32'hffffffff;
    end else begin
      if (_T_256) begin
        c <= 32'hffffffff;
      end else begin
        if (io_enable) begin
          c <= _T_288;
        end
      end
    end
  end
endmodule
module EthFcsPadding_4bit(
  input        clock,
  input        reset,
  input        io_rx_en,
  input  [3:0] io_rx_dat,
  output       io_tx_en,
  output [3:0] io_tx_dat
);
  wire  crc32_d4_clock; // @[EthFcsPadding.scala 244:25]
  wire  crc32_d4_reset; // @[EthFcsPadding.scala 244:25]
  wire [3:0] crc32_d4_io_data; // @[EthFcsPadding.scala 244:25]
  wire  crc32_d4_io_enable; // @[EthFcsPadding.scala 244:25]
  wire  crc32_d4_io_start; // @[EthFcsPadding.scala 244:25]
  wire [31:0] crc32_d4_io_crc; // @[EthFcsPadding.scala 244:25]
  reg [2:0] state; // @[EthFcsPadding.scala 247:24]
  reg [7:0] counter; // @[EthFcsPadding.scala 249:28]
  reg  crc_enable; // @[EthFcsPadding.scala 250:28]
  reg [31:0] crc_out_r; // @[EthFcsPadding.scala 252:28]
  reg  tx_en; // @[EthFcsPadding.scala 253:28]
  reg [3:0] tx_dat; // @[EthFcsPadding.scala 254:28]
  reg  _T; // @[Reg.scala 15:16]
  reg  _T_1; // @[Reg.scala 15:16]
  reg  _T_2; // @[Reg.scala 15:16]
  reg  _T_3; // @[Reg.scala 15:16]
  reg  _T_4; // @[Reg.scala 15:16]
  reg  _T_5; // @[Reg.scala 15:16]
  reg  _T_6; // @[Reg.scala 15:16]
  reg  _T_7; // @[Reg.scala 15:16]
  reg  rx_valid_r5; // @[Reg.scala 15:16]
  reg [3:0] _T_8; // @[Reg.scala 15:16]
  reg [3:0] _T_9; // @[Reg.scala 15:16]
  reg [3:0] _T_10; // @[Reg.scala 15:16]
  reg [3:0] _T_11; // @[Reg.scala 15:16]
  reg [3:0] _T_12; // @[Reg.scala 15:16]
  reg [3:0] _T_13; // @[Reg.scala 15:16]
  reg [3:0] _T_14; // @[Reg.scala 15:16]
  reg [3:0] _T_15; // @[Reg.scala 15:16]
  reg [3:0] rx_data_r5; // @[Reg.scala 15:16]
  wire  _T_16; // @[Conditional.scala 37:30]
  reg  _T_17; // @[util.scala 13:42]
  wire  _T_18; // @[util.scala 13:34]
  wire  _T_19; // @[util.scala 13:31]
  wire  _T_20; // @[EthFcsPadding.scala 264:26]
  wire  _GEN_19; // @[EthFcsPadding.scala 264:37]
  wire  _GEN_22; // @[EthFcsPadding.scala 263:38]
  wire  _T_21; // @[Conditional.scala 37:30]
  wire [7:0] _T_23; // @[EthFcsPadding.scala 276:26]
  wire  _T_24; // @[EthFcsPadding.scala 277:21]
  wire  _T_25; // @[EthFcsPadding.scala 280:31]
  wire  _GEN_26; // @[EthFcsPadding.scala 280:42]
  wire  _T_26; // @[Conditional.scala 37:30]
  wire  _T_27; // @[EthFcsPadding.scala 288:13]
  wire  _T_28; // @[Conditional.scala 37:30]
  wire [31:0] crc_out; // @[EthFcsPadding.scala 317:22]
  wire [27:0] _T_29; // @[EthFcsPadding.scala 296:28]
  wire [3:0] _T_30; // @[EthFcsPadding.scala 297:24]
  wire  _T_33; // @[Conditional.scala 37:30]
  wire [27:0] _T_34; // @[EthFcsPadding.scala 301:30]
  wire  _T_37; // @[EthFcsPadding.scala 303:21]
  wire [3:0] _T_38; // @[EthFcsPadding.scala 309:28]
  EthCRC32_4bit crc32_d4 ( // @[EthFcsPadding.scala 244:25]
    .clock(crc32_d4_clock),
    .reset(crc32_d4_reset),
    .io_data(crc32_d4_io_data),
    .io_enable(crc32_d4_io_enable),
    .io_start(crc32_d4_io_start),
    .io_crc(crc32_d4_io_crc)
  );
  assign _T_16 = 3'h0 == state; // @[Conditional.scala 37:30]
  assign _T_18 = _T_17 == 1'h0; // @[util.scala 13:34]
  assign _T_19 = rx_valid_r5 & _T_18; // @[util.scala 13:31]
  assign _T_20 = rx_data_r5 == 4'h5; // @[EthFcsPadding.scala 264:26]
  assign _GEN_19 = _T_20 | tx_en; // @[EthFcsPadding.scala 264:37]
  assign _GEN_22 = _T_19 & _GEN_19; // @[EthFcsPadding.scala 263:38]
  assign _T_21 = 3'h1 == state; // @[Conditional.scala 37:30]
  assign _T_23 = counter + 8'h1; // @[EthFcsPadding.scala 276:26]
  assign _T_24 = counter == 8'hf; // @[EthFcsPadding.scala 277:21]
  assign _T_25 = rx_data_r5 == 4'hd; // @[EthFcsPadding.scala 280:31]
  assign _GEN_26 = _T_25 | crc_enable; // @[EthFcsPadding.scala 280:42]
  assign _T_26 = 3'h2 == state; // @[Conditional.scala 37:30]
  assign _T_27 = io_rx_en == 1'h0; // @[EthFcsPadding.scala 288:13]
  assign _T_28 = 3'h3 == state; // @[Conditional.scala 37:30]
  assign crc_out = crc32_d4_io_crc; // @[EthFcsPadding.scala 317:22]
  assign _T_29 = crc_out[31:4]; // @[EthFcsPadding.scala 296:28]
  assign _T_30 = crc_out[3:0]; // @[EthFcsPadding.scala 297:24]
  assign _T_33 = 3'h4 == state; // @[Conditional.scala 37:30]
  assign _T_34 = crc_out_r[31:4]; // @[EthFcsPadding.scala 301:30]
  assign _T_37 = counter == 8'h8; // @[EthFcsPadding.scala 303:21]
  assign _T_38 = crc_out_r[3:0]; // @[EthFcsPadding.scala 309:28]
  assign io_tx_en = tx_en; // @[EthFcsPadding.scala 319:13]
  assign io_tx_dat = tx_dat; // @[EthFcsPadding.scala 320:13]
  assign crc32_d4_clock = clock;
  assign crc32_d4_reset = reset;
  assign crc32_d4_io_data = rx_data_r5; // @[EthFcsPadding.scala 314:22]
  assign crc32_d4_io_enable = crc_enable; // @[EthFcsPadding.scala 315:22]
  assign crc32_d4_io_start = crc_enable; // @[EthFcsPadding.scala 316:22]
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_20) begin
            state <= 3'h1;
          end
        end
      end else begin
        if (_T_21) begin
          if (_T_24) begin
            state <= 3'h0;
          end else begin
            if (_T_25) begin
              state <= 3'h2;
            end
          end
        end else begin
          if (_T_26) begin
            if (_T_27) begin
              state <= 3'h3;
            end
          end else begin
            if (_T_28) begin
              state <= 3'h4;
            end else begin
              if (_T_33) begin
                if (_T_37) begin
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
      if (_T_16) begin
        counter <= 8'h0;
      end else begin
        if (_T_21) begin
          if (_T_24) begin
            counter <= _T_23;
          end else begin
            if (_T_25) begin
              counter <= 8'h0;
            end else begin
              counter <= _T_23;
            end
          end
        end else begin
          if (_T_26) begin
            if (_T_27) begin
              counter <= 8'h0;
            end
          end else begin
            if (_T_28) begin
              counter <= _T_23;
            end else begin
              if (_T_33) begin
                if (_T_37) begin
                  counter <= 8'h0;
                end else begin
                  counter <= _T_23;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      crc_enable <= 1'h0;
    end else begin
      if (_T_16) begin
        crc_enable <= 1'h0;
      end else begin
        if (_T_21) begin
          if (!(_T_24)) begin
            crc_enable <= _GEN_26;
          end
        end else begin
          if (_T_26) begin
            if (_T_27) begin
              crc_enable <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      crc_out_r <= 32'h0;
    end else begin
      if (!(_T_16)) begin
        if (!(_T_21)) begin
          if (!(_T_26)) begin
            if (_T_28) begin
              crc_out_r <= {{4'd0}, _T_29};
            end else begin
              if (_T_33) begin
                crc_out_r <= {{4'd0}, _T_34};
              end
            end
          end
        end
      end
    end
    if (reset) begin
      tx_en <= 1'h0;
    end else begin
      if (_T_16) begin
        tx_en <= _GEN_22;
      end else begin
        if (!(_T_21)) begin
          if (!(_T_26)) begin
            if (!(_T_28)) begin
              if (_T_33) begin
                if (_T_37) begin
                  tx_en <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      tx_dat <= 4'h0;
    end else begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_20) begin
            tx_dat <= rx_data_r5;
          end
        end else begin
          tx_dat <= 4'h0;
        end
      end else begin
        if (_T_21) begin
          tx_dat <= rx_data_r5;
        end else begin
          if (_T_26) begin
            tx_dat <= rx_data_r5;
          end else begin
            if (_T_28) begin
              tx_dat <= _T_30;
            end else begin
              if (_T_33) begin
                if (_T_37) begin
                  tx_dat <= 4'h0;
                end else begin
                  tx_dat <= _T_38;
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
    _T_4 <= _T_3;
    _T_5 <= _T_4;
    _T_6 <= _T_5;
    _T_7 <= _T_6;
    rx_valid_r5 <= _T_7;
    _T_8 <= io_rx_dat;
    _T_9 <= _T_8;
    _T_10 <= _T_9;
    _T_11 <= _T_10;
    _T_12 <= _T_11;
    _T_13 <= _T_12;
    _T_14 <= _T_13;
    _T_15 <= _T_14;
    rx_data_r5 <= _T_15;
    _T_17 <= rx_valid_r5;
  end
endmodule
