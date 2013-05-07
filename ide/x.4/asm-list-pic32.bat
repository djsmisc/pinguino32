@echo off

rem Output disassenble list for PIC32MX 

rem 2013/03 by avrin



set dir_gcc_bin=win32\p32\bin
set objdump=mips-objdump
set target_dir=source

rem  get *.elf file name
for %%i in (%target_dir%\*.elf) do set f_elf=%%i

rem generate *.lst file name
set f_list=%f_elf:elf=lst%%

rem Output disassenble list to *.lst file
rem %dir_gcc_bin%\%objdump% -h -dxS  %f_elf% > %f_list% 
%dir_gcc_bin%\%objdump% -h -dS  %f_elf% > %f_list% 

rem open *.lst file with editor
start %f_list%



