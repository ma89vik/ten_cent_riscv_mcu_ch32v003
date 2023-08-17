project('ten_cent_riscv_mcu_ch32v003', 'c',
  version : '0.1',
  default_options : ['warning_level=3'])

subdir('src')


app_linker_args = [
    '-T'+ join_paths(meson.current_source_dir(), 'src/ch32v003.ld')
]

exe = executable('ten_cent_riscv_mcu_ch32v003', app_srcs,
                  include_directories : [app_incs],
                  install : true,
                  link_args           : app_linker_args)

test('basic', exe)
