@echo off
REM SDCC OBJ MAKEFILE
SET SFILENAME=shampoo
echo Compiling...
echo %SFILENAME%
sdasz80 -o WYZ_%SFILENAME%.rel %SFILENAME%.s
pause
