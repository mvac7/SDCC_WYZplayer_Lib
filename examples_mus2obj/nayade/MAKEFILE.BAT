@echo off
REM SDCC OBJ MAKEFILE
SET SFILENAME=Nayade.mus
echo Compiling...
echo %SFILENAME%
sdasz80 -o WYZ_%SFILENAME%.rel %SFILENAME%.s
pause
