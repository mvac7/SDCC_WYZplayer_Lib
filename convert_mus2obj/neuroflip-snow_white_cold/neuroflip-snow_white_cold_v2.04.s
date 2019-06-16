  .module WYZ_song_data

	.area _DATA
  
	.area _CODE

_WYZ_songs::  .DW SONG00  ;,SONG1,SONG02,SONG03

; Tabla de instrumentos
_WYZ_instruments:: .DW 0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,PAUTA_6,PAUTA_7,PAUTA_8

; Tabla de efectos
_WYZ_FXs:: .DW SONIDO0,SONIDO1,SONIDO2,SONIDO3

;Pautas (instrumentos)
;Instrumento 'piano'
PAUTA_1:	.DB	77,0,13,2,13,4,12,2,12,0,11,-2,10,-4,9,-2,8,0,7,2,7,4,6,2,6,0,6,-2,5,-4,5,-2,5,0,5,2,5,4,5,2,5,0,5,-2,5,-4,5,-2,136
;Instrumento 'Bass'
PAUTA_2:	.DB	47,0,15,0,13,0,11,0,8,0,129
;Instrumento 'MegaBass'
PAUTA_3:	.DB	45,0,13,0,12,0,75,0,10,2,10,4,10,6,10,8,10,6,10,4,10,2,10,0,10,-2,10,-4,10,-6,10,-8,10,-6,10,-4,10,-2,10,0,144
;Instrumento 'miniBass'
PAUTA_4:	.DB	44,0,11,0,11,0,10,0,9,4,9,8,9,4,9,0,9,-4,9,-8,9,-4,9,0,136
;Instrumento 'Note4'
PAUTA_5:	.DB	4,0,4,0,4,0,4,0,4,0,133
;Instrumento 'Note6'
PAUTA_6:	.DB	6,0,6,0,6,0,6,0,6,0,133
;Instrumento 'Note8'
PAUTA_7:	.DB	8,0,8,0,8,0,8,0,8,0,133
;Instrumento 'Note9'
PAUTA_8:	.DB	9,0,9,0,9,0,9,0,9,0,133

;Efectos
;Efecto 'bass drum'
SONIDO0:	.DB	232,63,0,15,124,0,255
;Efecto 'snare'
SONIDO1:	.DB	188,47,0,0,12,4,255
;Efecto 'hithat'
SONIDO2:	.DB	0,10,1,255
;Efecto 'LongSnare'
SONIDO3:	.DB	188,47,0,188,44,1,188,45,1,188,43,1,188,44,1,188,42,1,188,43,1,188,41,1,188,42,1,188,40,1,188,41,1,188,39,1,188,40,1,188,38,1,188,39,1,188,37,1,188,38,1,188,36,1,188,37,1,188,35,1,188,36,1,188,34,1,188,35,1,188,33,1,255

;Frecuencias para las notas
;DATOS_NOTAS: DW 0,0
;DW 1711,1614,1524,1438,1358,1281,1210,1142,1078,1017
;DW 960,906,855,807,762,719,679,641,605,571
;DW 539,509,480,453,428,404,381,360,339,320
;DW 302,285,269,254,240,227,214,202,190,180
;DW 170,160,151,143,135,127,120,113,107,101
;DW 95,90,85,80,76,71,67,64,60,57


; neuroflip-snow white cold_v2.04.mus
; BinaryFile
; Length=2964
SONG00:
.db 0x06,0x07,0x00,0x00,0x3F,0x02,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51
.db 0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E
.db 0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0x4E,0x7E,0x4E,0x7E,0x4E
.db 0x7E,0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56
.db 0x7E,0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51
.db 0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55
.db 0x7E,0x51,0x7E,0x51,0x4E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51,0x7E
.db 0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x96
.db 0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E
.db 0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E
.db 0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0x4E
.db 0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E
.db 0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E
.db 0x51,0x7E,0x51,0x4E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x9A,0x4E,0x7E,0x4E
.db 0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E
.db 0x7E,0x4E,0x0E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x9A,0xBE,0x4E,0x7E,0x4E
.db 0x7E,0x4E,0x7E,0x82,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x9A,0x4E,0x7E,0x4E
.db 0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E
.db 0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0xC2,0xFE,0xFE,0x41,0x7E
.db 0x3F,0x04,0xDA,0xFE,0x9C,0xDD,0xFE,0xA1,0xE2,0xFE,0xFE,0xE1,0x01,0x5D,0x7E,0x5D
.db 0x5A,0xDA,0xFE,0x9C,0xDD,0xFE,0xA1,0xE2,0xFE,0xFE,0xE1,0x01,0x5D,0x7E,0x5D,0x5A
.db 0x3F,0x02,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x55,0x7E,0x55,0x7E,0x55
.db 0x7E,0x55,0x7E,0x95,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x50,0x7E,0x51
.db 0x7E,0x50,0x7E,0x56,0x7E,0x95,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x55
.db 0x7E,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x95,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E
.db 0x8E,0x50,0x7E,0x51,0x7E,0x50,0x7E,0x56,0x7E,0x95,0x3F,0x04,0xDA,0xFE,0x9C,0xDD
.db 0xFE,0xA1,0xE2,0xFE,0xFE,0xE1,0x01,0x5D,0x7E,0x5D,0x5A,0xDA,0xFE,0x9C,0xDD,0xFE
.db 0xA1,0xE2,0xFE,0xFE,0xE1,0x01,0x5D,0x7E,0x5D,0x5A,0x3F,0x02,0x4E,0x7E,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x8E,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x95,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x50,0x7E,0x51,0x7E,0x50,0x7E,0x56,0x7E,0x95
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x55
.db 0x7E,0x95,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x50,0x7E,0x51,0x7E,0x50
.db 0x7E,0x56,0x7E,0x95,0x3F,0x04,0xDA,0xFE,0x9C,0xDD,0xFE,0xA1,0xE2,0xFE,0xFE,0xE1
.db 0x01,0x5D,0x7E,0x5D,0x5A,0xDA,0xFE,0x9C,0xDD,0xFE,0xA1,0xE2,0xFE,0xFE,0xE1,0x01
.db 0x5D,0x7E,0x5D,0x5A,0xDA,0xFE,0x9C,0xDD,0xFE,0xA1,0xE2,0xFE,0xFE,0xE1,0x01,0x5D
.db 0x7E,0x5D,0x5A,0xDA,0xFE,0x9C,0xDD,0xFE,0xA1,0xE2,0xFE,0xFE,0xE1,0x01,0x5D,0x7E
.db 0x5D,0x5A,0x00,0x3F,0x03,0xC2,0xFE,0xFE,0xC5,0xFE,0xFE,0xCA,0xFE,0xFE,0xC9,0x01
.db 0x85,0x01,0x42,0x42,0x7E,0x42,0x42,0x42,0x4E,0x7E,0x82,0x85,0xBE,0xC5,0x41,0x4A
.db 0x7E,0x56,0x7E,0x4A,0x7E,0x96,0x01,0x4A,0xC9,0x01,0x85,0xBE,0x01,0xC2,0xFE,0xFE
.db 0xC5,0xFE,0xFE,0xCA,0xFE,0xFE,0xC9,0x01,0x85,0x01,0x42,0x42,0x7E,0x42,0x42,0x42
.db 0x4E,0x7E,0x82,0x85,0xBE,0xC5,0x41,0x4A,0x7E,0x56,0x7E,0x4A,0x7E,0x96,0x01,0x4A
.db 0xC9,0x01,0x85,0xBE,0x01,0xC2,0xFE,0xFE,0xC5,0xFE,0xFE,0xCA,0xFE,0xFE,0xC9,0x01
.db 0x85,0x01,0x42,0x42,0x7E,0x42,0x42,0x42,0x4E,0x7E,0x82,0x85,0xBE,0xC5,0x41,0x4A
.db 0x7E,0x56,0x7E,0x4A,0x7E,0x96,0x01,0x4A,0xC9,0x01,0x85,0xBE,0x01,0xC2,0xFE,0xFE
.db 0xC2,0xFE,0xFE,0xC2,0xFE,0xFE,0xFE,0xFE,0xFE,0x9A,0xC2,0xFE,0xFE,0xC2,0xFE,0xFE
.db 0xC2,0xFE,0x01,0x9A,0xBE,0xC2,0x01,0x82,0xC1,0x3F,0x01,0x82,0x8E,0xC2,0xC5,0xFE
.db 0xFE,0x85,0xBE,0x4A,0xC9,0xC9,0xFE,0xFE,0x41,0x3F,0x05,0x1A,0x1E,0x21,0x1A,0x3F
.db 0x06,0x1A,0x1E,0x21,0x1A,0x3F,0x07,0x1A,0x1E,0x21,0x1A,0x3F,0x08,0x1A,0x1E,0x21
.db 0x1A,0x3F,0x07,0x1A,0x1E,0x21,0x1A,0x3F,0x06,0x1A,0x1E,0x21,0x1A,0x3F,0x05,0x1A
.db 0x1E,0x21,0x5A,0x7E,0x3F,0x01,0x85,0xBE,0x4A,0xC9,0xFE,0xFE,0x4E,0x4E,0x7E,0x4E
.db 0x8E,0x01,0x90,0x51,0x51,0x7E,0x51,0x91,0x01,0x95,0x56,0x56,0x7E,0x56,0xD6,0x01
.db 0x55,0x55,0x7E,0x55,0x55,0x51,0x51,0x4E,0x7E,0x4E,0x4E,0x7E,0x4E,0x8E,0x01,0x90
.db 0x51,0x51,0x7E,0x51,0x91,0x01,0x95,0x56,0x56,0x7E,0x56,0xD6,0x01,0x55,0x55,0x7E
.db 0x55,0x55,0x51,0x51,0x4E,0x7E,0x0E,0x4E,0x4E,0x7E,0x4E,0x90,0x51,0x13,0x14,0x55
.db 0x7E,0x55,0x7E,0x55,0x96,0x55,0x11,0x10,0x4E,0x7E,0x4E,0x7E,0x4E,0x90,0x91,0x10
.db 0x51,0x11,0x50,0x50,0x7E,0x56,0x7E,0x95,0x0E,0x4E,0x4E,0x7E,0x4E,0x90,0x51,0x13
.db 0x14,0x55,0x7E,0x55,0x7E,0x55,0x96,0x55,0x11,0x10,0x4E,0x7E,0x4E,0x7E,0x4E,0x90
.db 0x91,0x10,0x51,0x11,0x50,0x50,0x7E,0x56,0x7E,0x95,0x4E,0x4E,0x7E,0x4E,0x8E,0x01
.db 0x90,0x51,0x51,0x7E,0x51,0x91,0x01,0x95,0x56,0x56,0x7E,0x56,0xD6,0x01,0x55,0x55
.db 0x7E,0x55,0x55,0x51,0x51,0x4E,0x7E,0x4E,0x4E,0x7E,0x4E,0x8E,0x01,0x90,0x51,0x51
.db 0x7E,0x51,0x91,0x01,0x95,0x56,0x56,0x7E,0x56,0xD6,0x01,0x55,0x55,0x7E,0x55,0x55
.db 0x51,0x51,0x4E,0x7E,0x0E,0x4E,0x4E,0x7E,0x4E,0x90,0x51,0x13,0x14,0x55,0x7E,0x55
.db 0x7E,0x55,0x96,0x55,0x11,0x10,0x4E,0x7E,0x4E,0x7E,0x4E,0x90,0x91,0x10,0x51,0x11
.db 0x50,0x50,0x7E,0x56,0x7E,0x95,0x0E,0x4E,0x4E,0x7E,0x4E,0x90,0x51,0x13,0x14,0x55
.db 0x7E,0x55,0x7E,0x55,0x96,0x55,0x11,0x10,0x4E,0x7E,0x4E,0x7E,0x4E,0x90,0x91,0x10
.db 0x51,0x11,0x50,0x50,0x7E,0x56,0x7E,0x95,0x4E,0x4E,0x7E,0x4E,0x8E,0x01,0x90,0x51
.db 0x51,0x7E,0x51,0x91,0x01,0x95,0x56,0x56,0x7E,0x56,0xD6,0x01,0x55,0x55,0x7E,0x55
.db 0x55,0x51,0x51,0x4E,0x7E,0x4E,0x4E,0x7E,0x4E,0x8E,0x01,0x90,0x51,0x51,0x7E,0x51
.db 0x91,0x01,0x95,0x56,0x56,0x7E,0x56,0xD6,0x01,0x55,0x55,0x7E,0x55,0x55,0x51,0x51
.db 0x4E,0x7E,0x4E,0x4E,0x7E,0x4E,0x8E,0x01,0x90,0x51,0x51,0x7E,0x51,0x91,0x01,0x95
.db 0x56,0x56,0x7E,0x56,0xD6,0x01,0x55,0x55,0x7E,0x55,0x55,0x51,0x51,0x4E,0x7E,0x4E
.db 0x4E,0x7E,0x4E,0x8E,0x01,0x90,0x51,0x51,0x7E,0x51,0x91,0x01,0x95,0x56,0x56,0x7E
.db 0x56,0xD6,0x01,0x55,0x55,0x7E,0x55,0x55,0x51,0x51,0x4E,0x7E,0x00,0x3F,0x04,0xC1
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xDA,0xFE
.db 0xFE,0xDD,0xFE,0xFE,0xD6,0xFE,0xFE,0xE1,0x01,0x91,0xBE,0x01,0xDA,0xFE,0xFE,0xDD
.db 0xFE,0xFE,0xD6,0xFE,0xFE,0xE1,0x01,0x91,0xBE,0x01,0xC1,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0x3F,0x01,0x4E,0x4E,0x7E,0x4E,0xCE
.db 0x01,0x51,0x51,0x7E,0x51,0xD1,0x01,0x56,0x56,0x7E,0x56,0xD6,0x01,0x55,0x55,0x7E
.db 0x55,0xD5,0x01,0x4E,0x4E,0x7E,0x4E,0xCE,0x01,0x51,0x51,0x7E,0x51,0xD1,0x01,0x56
.db 0x56,0x7E,0x56,0xD6,0x01,0x55,0x55,0x7E,0x55,0xD5,0x01,0xC1,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xC1,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xC1,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xC1,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0x3F,0x02,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E
.db 0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56
.db 0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91
.db 0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51
.db 0x7E,0x51,0x4E,0xC1,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xC1,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E
.db 0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E
.db 0x55,0x7E,0x51,0x7E,0x51,0x4E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51
.db 0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E
.db 0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0xC1,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xC1,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E
.db 0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56
.db 0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0x4E,0x7E
.db 0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91
.db 0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51
.db 0x7E,0x51,0x4E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x8E,0x51,0x7E,0x51,0x7E
.db 0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x56,0x7E,0x96,0x55,0x7E
.db 0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E,0x4E,0x7E
.db 0x8E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x51,0x7E,0x91,0x56,0x7E,0x56,0x7E,0x56,0x7E
.db 0x56,0x7E,0x96,0x55,0x7E,0x55,0x7E,0x55,0x7E,0x51,0x7E,0x51,0x4E,0x00,0xC1,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE
.db 0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0xFE,0x7F,0xC0,0x7F
.db 0xC3,0x7F,0xC0,0x7F,0xC3,0x7F,0xC0,0x7F,0xC3,0x7F,0xC0,0x7F,0xC3,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0xC2,0xFE,0xFE,0xFE,0x7F,0x40
.db 0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43
.db 0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00
.db 0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02
.db 0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00
.db 0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40
.db 0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43
.db 0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00
.db 0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02
.db 0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00
.db 0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43
.db 0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00
.db 0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02
.db 0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00
.db 0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40
.db 0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43
.db 0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00
.db 0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02
.db 0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00
.db 0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x42,0x7F,0x42,0x7F,0x40
.db 0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43
.db 0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00
.db 0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02
.db 0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00
.db 0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x00
.db 0x7F,0x00,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42
.db 0x7F,0x43,0x7F,0x42,0x7E,0x7F,0x00,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F
.db 0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F
.db 0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F
.db 0x42,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F
.db 0x00,0x7F,0x00,0x7F,0x02,0x7F,0x00,0x7F,0x03,0x7F,0x02,0x7F,0x02,0x7F,0x42,0x7F
.db 0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7E,0x7F,0x00,0x7F,0x02,0x7F,0x00,0x7F,0x43
.db 0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x42
.db 0x7F,0x00,0x7F,0x03,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42
.db 0x7F,0x40,0x7F,0x42,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43
.db 0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00
.db 0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02
.db 0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40,0x7F,0x02,0x7F,0x00
.db 0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43,0x7F,0x42,0x7F,0x40
.db 0x7F,0x02,0x7F,0x00,0x7F,0x43,0x7F,0x02,0x7F,0x42,0x7F,0x00,0x7F,0x42,0x7F,0x43
.db 0x7F,0x42,0x00,0x00



	.area _INITIALIZER
	.area _CABS (ABS)