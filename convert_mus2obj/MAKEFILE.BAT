@echo off
REM SDCC OBJ MAKEFILE
SET SFILENAME=pt10_test
echo Compiling...
echo %SFILENAME%
sdasz80 -o %SFILENAME%.rel %SFILENAME%.s
pause
