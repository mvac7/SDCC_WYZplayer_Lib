    .page	1
		.ROM
    
    
    
HOOK   EQU $FD9F



;-------------------------------------------------------------------- Constatine

VDPVRAM   EQU   $98 ;VRAM Data (Read/Write)
VDPSTATUS EQU   $99 ;VDP Status Registers
;-------------------------------------------------------------------------------



;--------------------------------------------------------------------- variables
VARIABLES             EQU $D000


_OLD_ISR        EQU VARIABLES+6   ;(3B)


;-------------------------------------------------------------------------------



main:


  call PLAYER_OFF
  
  LD      HL,$8000        	;* RESERVAR MEMORIA PARA BUFFER DE SONIDO!!!!!
  LD      [CANAL_A],HL
  
  LD      HL,$8010        	
  LD      [CANAL_B],HL       	

  LD      HL,$8020       	
  LD      [CANAL_C],HL 

  LD      HL,$8030       	
  LD      [CANAL_P],HL 
  
  
  ld   A,0
  call CARGA_CANCION
  
  
  ld   HL,my_isr1
  call install_isr
  
INFINITO:
  halt
  
  LD   HL,PSG_REG
  LD   DE,PSG_REG_SEC
  LD   BC,14
  LDIR
  CALL REPRODUCE_SONIDO
  CALL PLAY
   
   
  jr   INFINITO  




;-------------------------------------------------------------------------------
my_isr1:
  di
  in   A,(VDPSTATUS)  ;READ_VDP_STATUS
  exx
  
  call ROUT  ;INICIO
  
  exx 
  ei
  ret  
;-------------------------------------------------------------------------------


  
;-------------------------------------------------------------------------------
install_isr:
  di
  push HL
	; Save old ISR vector
	ld   A,[HOOK]
	ld   [_OLD_ISR],A
	ld   HL,[HOOK+1]
	ld   [_OLD_ISR+1],HL
  
	; Set new ISR vector
  pop  HL
  ld   [HOOK+1],HL
  ld   A,$C3
  ld   [HOOK],A
  EI
	
	ret
;-------------------------------------------------------------------------------

  

;-------------------------------------------------------------------------------  
uninstall_isr:
	; Restore old ISR vector
	di
	ld   A,[_OLD_ISR]
	ld   [HOOK],A
	ld   HL,[_OLD_ISR+1]
	ld   [HOOK+1],HL
	ei
	ret
;-------------------------------------------------------------------------------








.INCLUDE	"WYZPROPLAY47cMSX.ASM"

.INCLUDE	"pt10_test.mus.asm"  


TABLA_SONG:     DW      SONG00;

SONG00:
.INCBIN	"pt10_test.mus"


