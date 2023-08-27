project('ten_cent_riscv_mcu_ch32v003', 'c',
  version : '0.1',
  default_options : ['warning_level=3'])

subdir('src')


app_linker_args = [
    '-Wl,-Map=' + meson.project_name() + '.map',
    '-T'+ join_paths(meson.current_source_dir(), 'src/ch32v003.ld')
]

exe = executable('ten_cent_riscv_mcu_ch32v003', app_srcs,
                  include_directories : [app_incs],
                  name_suffix         : 'elf',
                  install : true,
                  link_args           : app_linker_args)

bin = custom_target('app_elf_to_bin',
                    output           : meson.project_name() + '.bin',
                    build_by_default : true,
                    command          : ['objcopy', '-O', 'binary', meson.project_name() + '.elf', meson.project_name() + '.bin'],
                    depends          : [exe])


flash = run_target('flash',
                    command          : [join_paths(meson.source_root(), 'tools/minichlink/minichlink'), '-w', bin.full_path(), '0x0' ],
                    depends          : [bin])

