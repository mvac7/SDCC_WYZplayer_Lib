; ------------------------------------------------------------------------------
; WYZ SDCC mod
; ------------------------------------------------------------------------------

  .module WYZ_mod

	.area _DATA
  
	.area _CODE

_WYZ_songs::  .DW SONG00  

; Tabla de instrumentos
_WYZ_instruments:: .DW PAUTA_0,PAUTA_1,PAUTA_2

; Tabla de efectos
_WYZ_FXs:: .DW SONIDO0,SONIDO1



_Song_name::
	.ascii "pt10"
	.db 0x00
  
_Song_author::
	.ascii "WYZ"
	.db 0x00


;Pautas (instrumentos)
;Instrumento 'Piano'
PAUTA_0:	.DB	13,0,11,0,9,0,5,0,129
;Instrumento 'blip'
PAUTA_1:	.DB	11,0,8,0,9,0,7,0,5,0,0,129
;Instrumento 'piano 2'
PAUTA_2:	.DB	8,0,5,0,6,0,4,0,2,0,0,129

;Efectos
;Efecto 'bass'
SONIDO0:	.DB	69,47,0,69,92,0,255
;Efecto 'snare'
SONIDO1:	.DB	46,47,0,0,107,6,255


;Frecuencias para las notas
;DATOS_NOTAS: DW 0,0
;DW 1711,1614,1524,1438,1358,1281,1210,1142,1078,1017
;DW 960,906,855,807,762,719,679,641,605,571
;DW 539,509,480,453,428,404,381,360,339,320
;DW 302,285,269,254,240,227,214,202,190,180
;DW 170,160,151,143,135,127,120,113,107,101
;DW 95,90,85,80,76,71,67,64,60,57


; pt10_test.mus
; BinaryFile
; Length=228
SONG00:
.db 0x03,0x31,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x42,0x7E,0x3F,0x02
.db 0x00,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D
.db 0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66
.db 0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x69,0x6E,0x72,0x75,0x72,0x6E,0x68,0x6B,0x70,0xB4
.db 0x00,0x3F,0x00,0x00,0x8E,0x4E,0x8E,0x4E,0x8E,0x4E,0x49,0x49,0x49,0x8E,0x4E,0x8E
.db 0x4E,0x8E,0x4E,0x49,0x49,0x49,0x8E,0x4E,0x8E,0x4E,0x8E,0x4E,0x49,0x49,0x49,0x8A
.db 0x4A,0x8A,0x4A,0x8C,0x4C,0x8C,0x4C,0x00,0x3F,0x01,0x00,0x66,0x6A,0x6D,0x72,0x6D
.db 0x6A,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D
.db 0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x69
.db 0x6E,0x72,0x75,0x72,0x6E,0x68,0x6B,0x70,0x74,0x70,0x6B,0x00,0x7F,0x80,0x7F,0x40
.db 0x7F,0x41,0x7F,0x80,0x7F,0x80,0x7F,0x40,0x7F,0x41,0x7F,0x80,0x7F,0x80,0x7F,0x40
.db 0x7F,0x41,0x7F,0x80,0x7F,0x80,0x7F,0x40,0x7F,0x41,0x7F,0x40,0x7F,0x41,0x7F,0x80
.db 0x7F,0x40,0x7F,0x41,0x7F,0x80,0x7F,0x80,0x7F,0x00,0x7F,0x00,0x7F,0x41,0x7F,0x80
.db 0x7F,0x80,0x7F,0x40,0x7F,0x41,0x7F,0x80,0x7F,0x80,0x7F,0x00,0x7F,0x00,0x7F,0x41
.db 0x7F,0x81,0x00,0x00


	.area _INITIALIZER
	.area _CABS (ABS)