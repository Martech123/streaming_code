import os
import sys
import imp
from rfgen_config     import Parser
from rfgen_regfile    import RegMapRegFileGenerator
from rfgen_regfile_tb import RegMapRegFileTBGenerator

def read_file(source_dir, source_name):
  source_file = os.path.join(source_dir, source_name)
  with open(os.path.abspath(source_file), "r") as source:
    return source.readlines()

def write_file(contents, target_dir, target_name):
  if not os.path.exists(target_dir):
    os.makedirs(target_dir)
  target_file = os.path.join(target_dir, target_name)
  with open(os.path.abspath(target_file), "w") as target:
    target.writelines(contents)


if __name__ == "__main__":
  if len(sys.argv) != 5:
    print "Require Config, Source and Verilg Src, Sim, Software Target Dir."

  # Get absolute path of configure file, source and target dir, regfile pressure test tiems, SPI test times.
  config_filename     = sys.argv[1]
  source_dir          = sys.argv[2]
  vsrc_target_dir     = sys.argv[3]
  bench_target_dir    = sys.argv[4]

  base_dir        = os.path.abspath('.')
  vsrc_target_dir_path = os.path.join(base_dir, vsrc_target_dir)
  source_dir_path = os.path.join(base_dir, source_dir)
  bench_target_dir_path = os.path.join(base_dir, bench_target_dir)

  config_path = os.path.join(base_dir, config_filename)

  # Parse Configure file
  conf_parser    = Parser()
  regfile_config = conf_parser.genConfig(config_path)

  write_file(
    conf_parser.dump_config(regfile_config),
    vsrc_target_dir_path,
    "auto_regfile.py")

  genRegFile = RegMapRegFileGenerator()
  genRegFileTB = RegMapRegFileTBGenerator(regfile_config)
  genRegFileTB.genCommon(regfile_config)

  write_file(
    genRegFile.gen(
      regfile_config,
      read_file(source_dir_path, "auto_regfile.vt")),
    vsrc_target_dir_path,
    "auto_regfile.v")

  write_file(
    genRegFileTB.gen_analog2(
      read_file(source_dir_path, "spi_debug_if.vt")),
    vsrc_target_dir_path,
    "spi_debug_if.v")
