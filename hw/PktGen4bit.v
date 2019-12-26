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
module PktGen4bit(
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
  output [3:0]  io_tx_data,
  input         io_total_send_count_clr,
  output [47:0] io_total_send_count
);
  wire  eth_fcs_padding_clock; // @[PktGen.scala 251:32]
  wire  eth_fcs_padding_reset; // @[PktGen.scala 251:32]
  wire  eth_fcs_padding_io_rx_en; // @[PktGen.scala 251:32]
  wire [3:0] eth_fcs_padding_io_rx_dat; // @[PktGen.scala 251:32]
  wire  eth_fcs_padding_io_tx_en; // @[PktGen.scala 251:32]
  wire [3:0] eth_fcs_padding_io_tx_dat; // @[PktGen.scala 251:32]
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
  reg [3:0] state; // @[PktGen.scala 250:22]
  reg  tx_en; // @[PktGen.scala 253:39]
  reg [3:0] tx_data; // @[PktGen.scala 254:39]
  reg [15:0] cntr; // @[PktGen.scala 256:39]
  reg [15:0] pkt_len; // @[PktGen.scala 257:39]
  reg [47:0] total_send_count; // @[PktGen.scala 258:39]
  reg [47:0] send_count; // @[PktGen.scala 259:39]
  reg  send_done; // @[PktGen.scala 260:39]
  reg [15:0] loaded_pkt_len; // @[PktGen.scala 262:39]
  reg  _T; // @[util.scala 13:42]
  wire  _T_1; // @[util.scala 13:34]
  wire  _T_2; // @[util.scala 13:31]
  wire  _T_3; // @[util.scala 14:30]
  reg  _T_4; // @[util.scala 14:43]
  wire  _T_5; // @[util.scala 14:33]
  wire  _T_6; // @[PktGen.scala 267:42]
  wire  _T_7; // @[PktGen.scala 267:38]
  wire [47:0] _T_9; // @[PktGen.scala 268:30]
  reg  _T_10; // @[util.scala 13:42]
  wire  _T_11; // @[util.scala 13:34]
  wire  _T_12; // @[util.scala 13:31]
  wire  _T_13; // @[PktGen.scala 274:24]
  wire [47:0] _GEN_86; // @[PktGen.scala 275:31]
  wire  _T_14; // @[PktGen.scala 275:31]
  reg  _T_16; // @[util.scala 14:43]
  wire  _T_17; // @[util.scala 14:33]
  wire [47:0] _T_19; // @[PktGen.scala 282:42]
  reg  _T_20; // @[util.scala 13:42]
  wire  _T_21; // @[util.scala 13:34]
  wire  _T_22; // @[util.scala 13:31]
  reg [47:0] load_r; // @[PktGen.scala 291:23]
  wire  _T_23; // @[Conditional.scala 37:30]
  wire  _T_24; // @[PktGen.scala 296:13]
  reg  _T_25; // @[PktGen.scala 296:35]
  wire  _T_26; // @[PktGen.scala 296:25]
  wire  _T_28; // @[PktGen.scala 296:47]
  wire  _T_29; // @[PktGen.scala 300:31]
  wire [7:0] _T_37; // @[PRNG.scala 86:17]
  wire [15:0] _T_45; // @[PRNG.scala 86:17]
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
  wire  _T_60; // @[LFSR.scala 41:16]
  wire  _T_61; // @[LFSR.scala 41:16]
  wire [7:0] _T_69; // @[LFSR.scala 43:8]
  wire [15:0] _T_77; // @[LFSR.scala 43:8]
  wire [10:0] _T_79; // @[PktGen.scala 305:41]
  wire [10:0] _T_81; // @[PktGen.scala 305:51]
  wire [15:0] _GEN_87; // @[PktGen.scala 305:32]
  wire [15:0] _GEN_0; // @[PktGen.scala 305:32]
  wire [10:0] _T_82; // @[PktGen.scala 305:32]
  wire [10:0] _T_84; // @[PktGen.scala 305:59]
  wire [2:0] _GEN_11; // @[PktGen.scala 296:62]
  wire  _T_85; // @[Conditional.scala 37:30]
  wire  _T_86; // @[PktGen.scala 313:18]
  wire [15:0] _T_88; // @[PktGen.scala 317:22]
  wire [3:0] _GEN_14; // @[PktGen.scala 313:34]
  wire  _T_89; // @[Conditional.scala 37:30]
  wire [3:0] _T_90; // @[PktGen.scala 323:23]
  wire [51:0] _T_91; // @[PktGen.scala 324:23]
  wire  _T_92; // @[Conditional.scala 37:30]
  wire  _T_93; // @[PktGen.scala 327:18]
  wire [3:0] _T_94; // @[PktGen.scala 329:25]
  wire [51:0] _T_95; // @[PktGen.scala 330:25]
  wire [3:0] _T_96; // @[PktGen.scala 333:26]
  wire [51:0] _T_97; // @[PktGen.scala 334:26]
  wire [3:0] _GEN_17; // @[PktGen.scala 327:34]
  wire [51:0] _GEN_18; // @[PktGen.scala 327:34]
  wire  _T_100; // @[Conditional.scala 37:30]
  wire [3:0] _T_102; // @[PktGen.scala 341:28]
  wire [19:0] _T_103; // @[PktGen.scala 342:28]
  wire [3:0] _GEN_21; // @[PktGen.scala 339:34]
  wire [51:0] _GEN_22; // @[PktGen.scala 339:34]
  wire  _T_108; // @[Conditional.scala 37:30]
  wire  _T_109; // @[PktGen.scala 351:18]
  wire  _T_110; // @[PktGen.scala 353:31]
  wire  _T_111; // @[PktGen.scala 355:38]
  wire  _T_112; // @[PktGen.scala 357:38]
  wire [7:0] _T_119; // @[PRNG.scala 86:17]
  wire [15:0] _T_127; // @[PRNG.scala 86:17]
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
  wire  _T_141; // @[LFSR.scala 41:16]
  wire  _T_142; // @[LFSR.scala 41:16]
  wire  _T_143; // @[LFSR.scala 41:16]
  wire [7:0] _T_151; // @[LFSR.scala 43:8]
  wire [15:0] _T_159; // @[LFSR.scala 43:8]
  wire  _T_160; // @[PktGen.scala 359:38]
  wire [3:0] _GEN_24; // @[PktGen.scala 359:47]
  wire [15:0] _GEN_25; // @[PktGen.scala 357:47]
  wire [15:0] _GEN_26; // @[PktGen.scala 355:47]
  wire [15:0] _GEN_27; // @[PktGen.scala 353:40]
  wire [3:0] _T_161; // @[PktGen.scala 364:26]
  wire [15:0] _GEN_29; // @[PktGen.scala 351:33]
  wire [51:0] _GEN_31; // @[PktGen.scala 351:33]
  wire  _T_165; // @[Conditional.scala 37:30]
  wire [15:0] _T_167; // @[PktGen.scala 370:30]
  wire [15:0] _T_169; // @[PktGen.scala 370:49]
  wire [15:0] _T_171; // @[PktGen.scala 370:67]
  wire [15:0] _T_173; // @[PktGen.scala 370:83]
  wire  _T_174; // @[PktGen.scala 370:18]
  wire [3:0] _T_178; // @[PktGen.scala 379:30]
  wire [7:0] _T_186; // @[PRNG.scala 86:17]
  wire [15:0] _T_194; // @[PRNG.scala 86:17]
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
  wire  _T_207; // @[LFSR.scala 41:16]
  wire  _T_208; // @[LFSR.scala 41:16]
  wire  _T_209; // @[LFSR.scala 41:16]
  wire  _T_210; // @[LFSR.scala 41:16]
  wire [7:0] _T_218; // @[LFSR.scala 43:8]
  wire [15:0] _T_226; // @[LFSR.scala 43:8]
  wire [3:0] _T_229; // @[PktGen.scala 383:30]
  wire [3:0] _GEN_32; // @[PktGen.scala 382:47]
  wire [15:0] _GEN_33; // @[PktGen.scala 380:47]
  wire [15:0] _GEN_34; // @[PktGen.scala 378:47]
  wire [15:0] _GEN_35; // @[PktGen.scala 376:40]
  wire [15:0] _GEN_38; // @[PktGen.scala 370:90]
  wire  _T_232; // @[Conditional.scala 37:30]
  wire  _T_233; // @[PktGen.scala 389:18]
  wire [3:0] _GEN_41; // @[PktGen.scala 389:33]
  wire  _T_236; // @[Conditional.scala 37:30]
  wire [15:0] _T_238; // @[PktGen.scala 400:41]
  wire [15:0] _T_240; // @[PktGen.scala 400:47]
  wire  _T_241; // @[PktGen.scala 400:18]
  wire [3:0] _GEN_49; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_53; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_56; // @[Conditional.scala 39:67]
  wire [51:0] _GEN_58; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_61; // @[Conditional.scala 39:67]
  wire [51:0] _GEN_62; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_66; // @[Conditional.scala 39:67]
  wire [51:0] _GEN_67; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_72; // @[Conditional.scala 39:67]
  wire [51:0] _GEN_73; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_76; // @[Conditional.scala 39:67]
  wire [51:0] _GEN_78; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_83; // @[Conditional.scala 40:58]
  wire [51:0] _GEN_85; // @[Conditional.scala 40:58]
  EthFcsPadding_4bit eth_fcs_padding ( // @[PktGen.scala 251:32]
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
  assign _T_6 = send_done == 1'h0; // @[PktGen.scala 267:42]
  assign _T_7 = _T_5 & _T_6; // @[PktGen.scala 267:38]
  assign _T_9 = send_count + 48'h1; // @[PktGen.scala 268:30]
  assign _T_11 = _T_10 == 1'h0; // @[util.scala 13:34]
  assign _T_12 = io_enable & _T_11; // @[util.scala 13:31]
  assign _T_13 = io_send_mode == 1'h0; // @[PktGen.scala 274:24]
  assign _GEN_86 = {{16'd0}, io_send_count}; // @[PktGen.scala 275:31]
  assign _T_14 = send_count == _GEN_86; // @[PktGen.scala 275:31]
  assign _T_17 = _T_3 & _T_16; // @[util.scala 14:33]
  assign _T_19 = total_send_count + 48'h1; // @[PktGen.scala 282:42]
  assign _T_21 = _T_20 == 1'h0; // @[util.scala 13:34]
  assign _T_22 = io_enable & _T_21; // @[util.scala 13:31]
  assign _T_23 = 4'h0 == state; // @[Conditional.scala 37:30]
  assign _T_24 = io_suspend == 1'h0; // @[PktGen.scala 296:13]
  assign _T_26 = _T_24 & _T_25; // @[PktGen.scala 296:25]
  assign _T_28 = _T_26 & _T_6; // @[PktGen.scala 296:47]
  assign _T_29 = io_pkt_len_mode == 1'h0; // @[PktGen.scala 300:31]
  assign _T_37 = {MaxPeriodFibonacciLFSR_io_out_7,MaxPeriodFibonacciLFSR_io_out_6,MaxPeriodFibonacciLFSR_io_out_5,MaxPeriodFibonacciLFSR_io_out_4,MaxPeriodFibonacciLFSR_io_out_3,MaxPeriodFibonacciLFSR_io_out_2,MaxPeriodFibonacciLFSR_io_out_1,MaxPeriodFibonacciLFSR_io_out_0}; // @[PRNG.scala 86:17]
  assign _T_45 = {MaxPeriodFibonacciLFSR_io_out_15,MaxPeriodFibonacciLFSR_io_out_14,MaxPeriodFibonacciLFSR_io_out_13,MaxPeriodFibonacciLFSR_io_out_12,MaxPeriodFibonacciLFSR_io_out_11,MaxPeriodFibonacciLFSR_io_out_10,MaxPeriodFibonacciLFSR_io_out_9,MaxPeriodFibonacciLFSR_io_out_8,_T_37}; // @[PRNG.scala 86:17]
  assign _T_46 = _T_45[0]; // @[LFSR.scala 41:16]
  assign _T_47 = _T_45[1]; // @[LFSR.scala 41:16]
  assign _T_48 = _T_45[2]; // @[LFSR.scala 41:16]
  assign _T_49 = _T_45[3]; // @[LFSR.scala 41:16]
  assign _T_50 = _T_45[4]; // @[LFSR.scala 41:16]
  assign _T_51 = _T_45[5]; // @[LFSR.scala 41:16]
  assign _T_52 = _T_45[6]; // @[LFSR.scala 41:16]
  assign _T_53 = _T_45[7]; // @[LFSR.scala 41:16]
  assign _T_54 = _T_45[8]; // @[LFSR.scala 41:16]
  assign _T_55 = _T_45[9]; // @[LFSR.scala 41:16]
  assign _T_56 = _T_45[10]; // @[LFSR.scala 41:16]
  assign _T_57 = _T_45[11]; // @[LFSR.scala 41:16]
  assign _T_58 = _T_45[12]; // @[LFSR.scala 41:16]
  assign _T_59 = _T_45[13]; // @[LFSR.scala 41:16]
  assign _T_60 = _T_45[14]; // @[LFSR.scala 41:16]
  assign _T_61 = _T_45[15]; // @[LFSR.scala 41:16]
  assign _T_69 = {_T_54,_T_55,_T_56,_T_57,_T_58,_T_59,_T_60,_T_61}; // @[LFSR.scala 43:8]
  assign _T_77 = {_T_46,_T_47,_T_48,_T_49,_T_50,_T_51,_T_52,_T_53,_T_69}; // @[LFSR.scala 43:8]
  assign _T_79 = 11'h40 - 11'h5ee; // @[PktGen.scala 305:41]
  assign _T_81 = _T_79 + 11'h1; // @[PktGen.scala 305:51]
  assign _GEN_87 = {{5'd0}, _T_81}; // @[PktGen.scala 305:32]
  assign _GEN_0 = _T_77 % _GEN_87; // @[PktGen.scala 305:32]
  assign _T_82 = _GEN_0[10:0]; // @[PktGen.scala 305:32]
  assign _T_84 = _T_82 + 11'h40; // @[PktGen.scala 305:59]
  assign _GEN_11 = _T_28 ? 3'h5 : 3'h0; // @[PktGen.scala 296:62]
  assign _T_85 = 4'h2 == state; // @[Conditional.scala 37:30]
  assign _T_86 = cntr == 16'he; // @[PktGen.scala 313:18]
  assign _T_88 = cntr + 16'h1; // @[PktGen.scala 317:22]
  assign _GEN_14 = _T_86 ? 4'hd : tx_data; // @[PktGen.scala 313:34]
  assign _T_89 = 4'h3 == state; // @[Conditional.scala 37:30]
  assign _T_90 = io_da[47:44]; // @[PktGen.scala 323:23]
  assign _T_91 = {io_da, 4'h0}; // @[PktGen.scala 324:23]
  assign _T_92 = 4'h5 == state; // @[Conditional.scala 37:30]
  assign _T_93 = cntr == 16'hb; // @[PktGen.scala 327:18]
  assign _T_94 = io_sa[47:44]; // @[PktGen.scala 329:25]
  assign _T_95 = {io_sa, 4'h0}; // @[PktGen.scala 330:25]
  assign _T_96 = load_r[47:44]; // @[PktGen.scala 333:26]
  assign _T_97 = {load_r, 4'h0}; // @[PktGen.scala 334:26]
  assign _GEN_17 = _T_93 ? _T_94 : _T_96; // @[PktGen.scala 327:34]
  assign _GEN_18 = _T_93 ? _T_95 : _T_97; // @[PktGen.scala 327:34]
  assign _T_100 = 4'h6 == state; // @[Conditional.scala 37:30]
  assign _T_102 = io_etype[15:12]; // @[PktGen.scala 341:28]
  assign _T_103 = {io_etype, 4'h0}; // @[PktGen.scala 342:28]
  assign _GEN_21 = _T_93 ? _T_102 : _T_96; // @[PktGen.scala 339:34]
  assign _GEN_22 = _T_93 ? {{32'd0}, _T_103} : _T_97; // @[PktGen.scala 339:34]
  assign _T_108 = 4'h4 == state; // @[Conditional.scala 37:30]
  assign _T_109 = cntr == 16'h3; // @[PktGen.scala 351:18]
  assign _T_110 = io_payload_mode == 2'h0; // @[PktGen.scala 353:31]
  assign _T_111 = io_payload_mode == 2'h1; // @[PktGen.scala 355:38]
  assign _T_112 = io_payload_mode == 2'h2; // @[PktGen.scala 357:38]
  assign _T_119 = {MaxPeriodFibonacciLFSR_1_io_out_7,MaxPeriodFibonacciLFSR_1_io_out_6,MaxPeriodFibonacciLFSR_1_io_out_5,MaxPeriodFibonacciLFSR_1_io_out_4,MaxPeriodFibonacciLFSR_1_io_out_3,MaxPeriodFibonacciLFSR_1_io_out_2,MaxPeriodFibonacciLFSR_1_io_out_1,MaxPeriodFibonacciLFSR_1_io_out_0}; // @[PRNG.scala 86:17]
  assign _T_127 = {MaxPeriodFibonacciLFSR_1_io_out_15,MaxPeriodFibonacciLFSR_1_io_out_14,MaxPeriodFibonacciLFSR_1_io_out_13,MaxPeriodFibonacciLFSR_1_io_out_12,MaxPeriodFibonacciLFSR_1_io_out_11,MaxPeriodFibonacciLFSR_1_io_out_10,MaxPeriodFibonacciLFSR_1_io_out_9,MaxPeriodFibonacciLFSR_1_io_out_8,_T_119}; // @[PRNG.scala 86:17]
  assign _T_128 = _T_127[0]; // @[LFSR.scala 41:16]
  assign _T_129 = _T_127[1]; // @[LFSR.scala 41:16]
  assign _T_130 = _T_127[2]; // @[LFSR.scala 41:16]
  assign _T_131 = _T_127[3]; // @[LFSR.scala 41:16]
  assign _T_132 = _T_127[4]; // @[LFSR.scala 41:16]
  assign _T_133 = _T_127[5]; // @[LFSR.scala 41:16]
  assign _T_134 = _T_127[6]; // @[LFSR.scala 41:16]
  assign _T_135 = _T_127[7]; // @[LFSR.scala 41:16]
  assign _T_136 = _T_127[8]; // @[LFSR.scala 41:16]
  assign _T_137 = _T_127[9]; // @[LFSR.scala 41:16]
  assign _T_138 = _T_127[10]; // @[LFSR.scala 41:16]
  assign _T_139 = _T_127[11]; // @[LFSR.scala 41:16]
  assign _T_140 = _T_127[12]; // @[LFSR.scala 41:16]
  assign _T_141 = _T_127[13]; // @[LFSR.scala 41:16]
  assign _T_142 = _T_127[14]; // @[LFSR.scala 41:16]
  assign _T_143 = _T_127[15]; // @[LFSR.scala 41:16]
  assign _T_151 = {_T_136,_T_137,_T_138,_T_139,_T_140,_T_141,_T_142,_T_143}; // @[LFSR.scala 43:8]
  assign _T_159 = {_T_128,_T_129,_T_130,_T_131,_T_132,_T_133,_T_134,_T_135,_T_151}; // @[LFSR.scala 43:8]
  assign _T_160 = io_payload_mode == 2'h3; // @[PktGen.scala 359:38]
  assign _GEN_24 = _T_160 ? 4'h0 : tx_data; // @[PktGen.scala 359:47]
  assign _GEN_25 = _T_112 ? _T_159 : {{12'd0}, _GEN_24}; // @[PktGen.scala 357:47]
  assign _GEN_26 = _T_111 ? 16'h0 : _GEN_25; // @[PktGen.scala 355:47]
  assign _GEN_27 = _T_110 ? 16'h0 : _GEN_26; // @[PktGen.scala 353:40]
  assign _T_161 = load_r[15:12]; // @[PktGen.scala 364:26]
  assign _GEN_29 = _T_109 ? _GEN_27 : {{12'd0}, _T_161}; // @[PktGen.scala 351:33]
  assign _GEN_31 = _T_109 ? {{4'd0}, load_r} : _T_97; // @[PktGen.scala 351:33]
  assign _T_165 = 4'h7 == state; // @[Conditional.scala 37:30]
  assign _T_167 = pkt_len - 16'h18; // @[PktGen.scala 370:30]
  assign _T_169 = _T_167 - 16'h4; // @[PktGen.scala 370:49]
  assign _T_171 = _T_169 - 16'h8; // @[PktGen.scala 370:67]
  assign _T_173 = _T_171 - 16'h1; // @[PktGen.scala 370:83]
  assign _T_174 = cntr == _T_173; // @[PktGen.scala 370:18]
  assign _T_178 = tx_data + 4'h1; // @[PktGen.scala 379:30]
  assign _T_186 = {MaxPeriodFibonacciLFSR_2_io_out_7,MaxPeriodFibonacciLFSR_2_io_out_6,MaxPeriodFibonacciLFSR_2_io_out_5,MaxPeriodFibonacciLFSR_2_io_out_4,MaxPeriodFibonacciLFSR_2_io_out_3,MaxPeriodFibonacciLFSR_2_io_out_2,MaxPeriodFibonacciLFSR_2_io_out_1,MaxPeriodFibonacciLFSR_2_io_out_0}; // @[PRNG.scala 86:17]
  assign _T_194 = {MaxPeriodFibonacciLFSR_2_io_out_15,MaxPeriodFibonacciLFSR_2_io_out_14,MaxPeriodFibonacciLFSR_2_io_out_13,MaxPeriodFibonacciLFSR_2_io_out_12,MaxPeriodFibonacciLFSR_2_io_out_11,MaxPeriodFibonacciLFSR_2_io_out_10,MaxPeriodFibonacciLFSR_2_io_out_9,MaxPeriodFibonacciLFSR_2_io_out_8,_T_186}; // @[PRNG.scala 86:17]
  assign _T_195 = _T_194[0]; // @[LFSR.scala 41:16]
  assign _T_196 = _T_194[1]; // @[LFSR.scala 41:16]
  assign _T_197 = _T_194[2]; // @[LFSR.scala 41:16]
  assign _T_198 = _T_194[3]; // @[LFSR.scala 41:16]
  assign _T_199 = _T_194[4]; // @[LFSR.scala 41:16]
  assign _T_200 = _T_194[5]; // @[LFSR.scala 41:16]
  assign _T_201 = _T_194[6]; // @[LFSR.scala 41:16]
  assign _T_202 = _T_194[7]; // @[LFSR.scala 41:16]
  assign _T_203 = _T_194[8]; // @[LFSR.scala 41:16]
  assign _T_204 = _T_194[9]; // @[LFSR.scala 41:16]
  assign _T_205 = _T_194[10]; // @[LFSR.scala 41:16]
  assign _T_206 = _T_194[11]; // @[LFSR.scala 41:16]
  assign _T_207 = _T_194[12]; // @[LFSR.scala 41:16]
  assign _T_208 = _T_194[13]; // @[LFSR.scala 41:16]
  assign _T_209 = _T_194[14]; // @[LFSR.scala 41:16]
  assign _T_210 = _T_194[15]; // @[LFSR.scala 41:16]
  assign _T_218 = {_T_203,_T_204,_T_205,_T_206,_T_207,_T_208,_T_209,_T_210}; // @[LFSR.scala 43:8]
  assign _T_226 = {_T_195,_T_196,_T_197,_T_198,_T_199,_T_200,_T_201,_T_202,_T_218}; // @[LFSR.scala 43:8]
  assign _T_229 = tx_data + 4'h4; // @[PktGen.scala 383:30]
  assign _GEN_32 = _T_160 ? _T_229 : tx_data; // @[PktGen.scala 382:47]
  assign _GEN_33 = _T_112 ? _T_226 : {{12'd0}, _GEN_32}; // @[PktGen.scala 380:47]
  assign _GEN_34 = _T_111 ? {{12'd0}, _T_178} : _GEN_33; // @[PktGen.scala 378:47]
  assign _GEN_35 = _T_110 ? 16'h0 : _GEN_34; // @[PktGen.scala 376:40]
  assign _GEN_38 = _T_174 ? 16'hd : _GEN_35; // @[PktGen.scala 370:90]
  assign _T_232 = 4'h8 == state; // @[Conditional.scala 37:30]
  assign _T_233 = cntr == 16'h7; // @[PktGen.scala 389:18]
  assign _GEN_41 = _T_233 ? 4'h0 : tx_data; // @[PktGen.scala 389:33]
  assign _T_236 = 4'h1 == state; // @[Conditional.scala 37:30]
  assign _T_238 = io_inter_frame_gap - 16'h1; // @[PktGen.scala 400:41]
  assign _T_240 = _T_238 - 16'h1; // @[PktGen.scala 400:47]
  assign _T_241 = cntr == _T_240; // @[PktGen.scala 400:18]
  assign _GEN_49 = _T_232 ? _GEN_41 : tx_data; // @[Conditional.scala 39:67]
  assign _GEN_53 = _T_165 ? _GEN_38 : {{12'd0}, _GEN_49}; // @[Conditional.scala 39:67]
  assign _GEN_56 = _T_108 ? _GEN_29 : _GEN_53; // @[Conditional.scala 39:67]
  assign _GEN_58 = _T_108 ? _GEN_31 : {{4'd0}, load_r}; // @[Conditional.scala 39:67]
  assign _GEN_61 = _T_100 ? {{12'd0}, _GEN_21} : _GEN_56; // @[Conditional.scala 39:67]
  assign _GEN_62 = _T_100 ? _GEN_22 : _GEN_58; // @[Conditional.scala 39:67]
  assign _GEN_66 = _T_92 ? {{12'd0}, _GEN_17} : _GEN_61; // @[Conditional.scala 39:67]
  assign _GEN_67 = _T_92 ? _GEN_18 : _GEN_62; // @[Conditional.scala 39:67]
  assign _GEN_72 = _T_89 ? {{12'd0}, _T_90} : _GEN_66; // @[Conditional.scala 39:67]
  assign _GEN_73 = _T_89 ? _T_91 : _GEN_67; // @[Conditional.scala 39:67]
  assign _GEN_76 = _T_85 ? {{12'd0}, _GEN_14} : _GEN_72; // @[Conditional.scala 39:67]
  assign _GEN_78 = _T_85 ? {{4'd0}, load_r} : _GEN_73; // @[Conditional.scala 39:67]
  assign _GEN_83 = _T_23 ? {{13'd0}, _GEN_11} : _GEN_76; // @[Conditional.scala 40:58]
  assign _GEN_85 = _T_23 ? {{4'd0}, load_r} : _GEN_78; // @[Conditional.scala 40:58]
  assign io_send_done = send_done; // @[PktGen.scala 411:16]
  assign io_tx_en = eth_fcs_padding_io_tx_en; // @[PktGen.scala 413:14]
  assign io_tx_data = eth_fcs_padding_io_tx_dat; // @[PktGen.scala 414:14]
  assign io_total_send_count = total_send_count; // @[PktGen.scala 416:23]
  assign eth_fcs_padding_clock = clock;
  assign eth_fcs_padding_reset = reset;
  assign eth_fcs_padding_io_rx_en = tx_en; // @[PktGen.scala 408:29]
  assign eth_fcs_padding_io_rx_dat = tx_data; // @[PktGen.scala 409:29]
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
      if (_T_23) begin
        if (_T_28) begin
          state <= 4'h2;
        end
      end else begin
        if (_T_85) begin
          if (_T_86) begin
            state <= 4'h3;
          end
        end else begin
          if (_T_89) begin
            state <= 4'h5;
          end else begin
            if (_T_92) begin
              if (_T_93) begin
                state <= 4'h6;
              end
            end else begin
              if (_T_100) begin
                if (_T_93) begin
                  state <= 4'h4;
                end
              end else begin
                if (_T_108) begin
                  if (_T_109) begin
                    state <= 4'h7;
                  end
                end else begin
                  if (_T_165) begin
                    if (_T_174) begin
                      state <= 4'h8;
                    end
                  end else begin
                    if (_T_232) begin
                      if (_T_233) begin
                        state <= 4'h1;
                      end
                    end else begin
                      if (_T_236) begin
                        if (_T_241) begin
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
      if (_T_23) begin
        tx_en <= _T_28;
      end else begin
        if (!(_T_85)) begin
          if (!(_T_89)) begin
            if (!(_T_92)) begin
              if (!(_T_100)) begin
                if (!(_T_108)) begin
                  if (!(_T_165)) begin
                    if (_T_232) begin
                      if (_T_233) begin
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
      tx_data <= 4'h0;
    end else begin
      tx_data <= _GEN_83[3:0];
    end
    if (reset) begin
      cntr <= 16'h0;
    end else begin
      if (_T_23) begin
        cntr <= 16'h0;
      end else begin
        if (_T_85) begin
          if (!(_T_86)) begin
            cntr <= _T_88;
          end
        end else begin
          if (_T_89) begin
            cntr <= 16'h0;
          end else begin
            if (_T_92) begin
              if (_T_93) begin
                cntr <= 16'h0;
              end else begin
                cntr <= _T_88;
              end
            end else begin
              if (_T_100) begin
                if (_T_93) begin
                  cntr <= 16'h0;
                end else begin
                  cntr <= _T_88;
                end
              end else begin
                if (_T_108) begin
                  if (_T_109) begin
                    cntr <= 16'h0;
                  end else begin
                    cntr <= _T_88;
                  end
                end else begin
                  if (_T_165) begin
                    if (_T_174) begin
                      cntr <= 16'h0;
                    end else begin
                      cntr <= _T_88;
                    end
                  end else begin
                    if (_T_232) begin
                      if (_T_233) begin
                        cntr <= 16'h0;
                      end else begin
                        cntr <= _T_88;
                      end
                    end else begin
                      if (_T_236) begin
                        if (!(_T_241)) begin
                          cntr <= _T_88;
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
      if (_T_23) begin
        if (_T_28) begin
          if (_T_29) begin
            pkt_len <= loaded_pkt_len;
          end else begin
            if (io_pkt_len_mode) begin
              pkt_len <= {{5'd0}, _T_84};
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
        if (_T_17) begin
          total_send_count <= _T_19;
        end
      end
    end
    if (reset) begin
      send_count <= 48'h0;
    end else begin
      if (_T_2) begin
        send_count <= 48'h0;
      end else begin
        if (_T_7) begin
          send_count <= _T_9;
        end
      end
    end
    if (reset) begin
      send_done <= 1'h0;
    end else begin
      if (_T_12) begin
        send_done <= 1'h0;
      end else begin
        if (_T_13) begin
          send_done <= _T_14;
        end
      end
    end
    if (reset) begin
      loaded_pkt_len <= 16'h0;
    end else begin
      if (_T_22) begin
        loaded_pkt_len <= io_pkt_len_init;
      end
    end
    _T <= io_enable;
    _T_4 <= io_tx_en;
    _T_10 <= io_enable;
    _T_16 <= io_tx_en;
    _T_20 <= io_enable;
    if (reset) begin
      load_r <= 48'h0;
    end else begin
      load_r <= _GEN_85[47:0];
    end
    _T_25 <= io_enable;
  end
endmodule
