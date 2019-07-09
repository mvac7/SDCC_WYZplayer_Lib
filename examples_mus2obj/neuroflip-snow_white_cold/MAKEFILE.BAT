@echo off
REM SDCC OBJ MAKEFILE
SET SFILENAME=neuroflip-snow_white_cold
echo Compiling...
echo %SFILENAME%
sdasz80 -o %SFILENAME%.rel %SFILENAME%.s
pause
