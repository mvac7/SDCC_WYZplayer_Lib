
; Tabla de instrumentos
TABLA_PAUTAS: DW 0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,PAUTA_6,PAUTA_7,PAUTA_8

; Tabla de efectos
TABLA_SONIDOS: DW SONIDO0,SONIDO1,SONIDO2,SONIDO3

;Pautas (instrumentos)
;Instrumento 'piano'
PAUTA_1:	DB	77,0,13,2,13,4,12,2,12,0,11,-2,10,-4,9,-2,8,0,7,2,7,4,6,2,6,0,6,-2,5,-4,5,-2,5,0,5,2,5,4,5,2,5,0,5,-2,5,-4,5,-2,136
;Instrumento 'Bass'
PAUTA_2:	DB	47,0,15,0,13,0,11,0,8,0,129
;Instrumento 'MegaBass'
PAUTA_3:	DB	45,0,13,0,12,0,75,0,10,2,10,4,10,6,10,8,10,6,10,4,10,2,10,0,10,-2,10,-4,10,-6,10,-8,10,-6,10,-4,10,-2,10,0,144
;Instrumento 'miniBass'
PAUTA_4:	DB	44,0,11,0,11,0,10,0,9,4,9,8,9,4,9,0,9,-4,9,-8,9,-4,9,0,136
;Instrumento 'Note4'
PAUTA_5:	DB	4,0,4,0,4,0,4,0,4,0,133
;Instrumento 'Note6'
PAUTA_6:	DB	6,0,6,0,6,0,6,0,6,0,133
;Instrumento 'Note8'
PAUTA_7:	DB	8,0,8,0,8,0,8,0,8,0,133
;Instrumento 'Note9'
PAUTA_8:	DB	9,0,9,0,9,0,9,0,9,0,133

;Efectos
;Efecto 'bass drum'
SONIDO0:	DB	232,63,0,15,124,0,255
;Efecto 'snare'
SONIDO1:	DB	188,47,0,0,12,4,255
;Efecto 'hithat'
SONIDO2:	DB	0,10,1,255
;Efecto 'LongSnare'
SONIDO3:	DB	188,47,0,188,44,1,188,45,1,188,43,1,188,44,1,188,42,1,188,43,1,188,41,1,188,42,1,188,40,1,188,41,1,188,39,1,188,40,1,188,38,1,188,39,1,188,37,1,188,38,1,188,36,1,188,37,1,188,35,1,188,36,1,188,34,1,188,35,1,188,33,1,255

;Frecuencias para las notas
DATOS_NOTAS: DW 0,0
DW 1711,1614,1524,1438,1358,1281,1210,1142,1078,1017
DW 960,906,855,807,762,719,679,641,605,571
DW 539,509,480,453,428,404,381,360,339,320
DW 302,285,269,254,240,227,214,202,190,180
DW 170,160,151,143,135,127,120,113,107,101
DW 95,90,85,80,76,71,67,64,60,57
