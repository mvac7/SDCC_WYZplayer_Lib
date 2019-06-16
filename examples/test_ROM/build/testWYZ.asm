;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module testWYZ
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _my_isr0
	.globl _WYZresume
	.globl _WYZpause
	.globl _WYZplayAY
	.globl _WYZdecode
	.globl _WYZloadSong
	.globl _WYZinit
	.globl _install_isr
	.globl _PRINT
	.globl _LOCATE
	.globl _COLOR
	.globl _WIDTH
	.globl _SCREEN1
	.globl _firstPATaddr
	.globl _keyB7semaphore
	.globl _SPRBUFFER
	.globl _VALUE
	.globl _presskey
	.globl _text02
	.globl _text01
	.globl _PauseSong
	.globl _SetSpritesSize
	.globl _PEEK
	.globl _POKE
	.globl _CopyMEM
	.globl _VPEEK
	.globl _INKEY
	.globl _WAIT
	.globl _GetKeyMatrix
	.globl _ShowVumeter
	.globl _SetSPRITES
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_VALUE::
	.ds 1
_SPRBUFFER::
	.ds 72
_keyB7semaphore::
	.ds 1
_firstPATaddr::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src\testWYZ.c:102: void my_isr0(void) __interrupt 
;	---------------------------------
; Function my_isr0
; ---------------------------------
_my_isr0::
	ei
	push	af
	push	bc
	push	de
	push	hl
	push	iy
;src\testWYZ.c:104: DI;
	di	
;src\testWYZ.c:105: READ_VDP_STATUS;
	in	a,(#0x99) 
;src\testWYZ.c:108: WYZplayAY();
	call	_WYZplayAY
;src\testWYZ.c:116: __endasm;
;vuelca	a VRAM buffer atributos sprites
	ld	HL,#_SPRBUFFER
	ld	DE,#0x1B00
	ld	BC,#20*4
	call	0x005C
;src\testWYZ.c:119: EI;
	ei	
	pop	iy
	pop	hl
	pop	de
	pop	bc
	pop	af
	reti
_text01:
	.ascii "Test WYZ player Lib for SDCC"
	.db 0x00
_text02:
	.ascii "v1.0 (05/06/2019)"
	.db 0x00
_presskey:
	.ascii "Press a key to Play"
	.db 0x00
;src\testWYZ.c:128: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\testWYZ.c:135: keyB7semaphore=false;
	ld	hl,#_keyB7semaphore + 0
	ld	(hl), #0x00
;src\testWYZ.c:137: COLOR(WHITE,DARK_BLUE,LIGHT_BLUE);
	ld	hl,#0x0504
	push	hl
	ld	a,#0x0f
	push	af
	inc	sp
	call	_COLOR
	pop	af
	inc	sp
;src\testWYZ.c:139: WIDTH(32);
	ld	a,#0x20
	push	af
	inc	sp
	call	_WIDTH
	inc	sp
;src\testWYZ.c:140: SCREEN1();    
	call	_SCREEN1
;src\testWYZ.c:141: SetSpritesSize(1);  
	ld	a,#0x01
	push	af
	inc	sp
	call	_SetSpritesSize
	inc	sp
;src\testWYZ.c:143: LOCATE(0,0);
	ld	hl,#0x0000
	push	hl
	call	_LOCATE
;src\testWYZ.c:144: PRINT(text01);
	ld	hl, #_text01
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:145: PRINT("\n");
	ld	hl, #___str_3
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:146: PRINT(text02);
	ld	hl, #_text02
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:148: PRINT("\n\n");
	ld	hl, #___str_4
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:150: PRINT("Song name:\n ");
	ld	hl, #___str_5
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:151: PRINT(Song_name);
	ld	hl, #_Song_name
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:153: PRINT("\n\n");
	ld	hl, #___str_4
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:155: PRINT("Author:\n ");
	ld	hl, #___str_6
	ex	(sp),hl
	call	_PRINT
;src\testWYZ.c:156: PRINT(Song_author);
	ld	hl, #_Song_author
	ex	(sp),hl
	call	_PRINT
	pop	af
;src\testWYZ.c:183: WYZinit((unsigned int) WYZ_songs, (unsigned int) WYZ_instruments, (unsigned int) WYZ_FXs);   
	ld	bc,#_WYZ_FXs
	ld	de,#_WYZ_instruments
	ld	hl,#_WYZ_songs
	push	bc
	push	de
	push	hl
	call	_WYZinit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src\testWYZ.c:185: WYZloadSong(0);   //(unsigned int) SONG00);   
	xor	a, a
	push	af
	inc	sp
	call	_WYZloadSong
	inc	sp
;src\testWYZ.c:196: SetSPRITES();
	call	_SetSPRITES
;src\testWYZ.c:198: install_isr(my_isr0);
	ld	hl,#_my_isr0
	push	hl
	call	_install_isr
	pop	af
;src\testWYZ.c:200: while(1)
00109$:
;src\testWYZ.c:202: HALT;
	halt	
;src\testWYZ.c:233: ShowVumeter(0,PSG_REG_SEC[AY_AmplA]);
	ld	hl, #_PSG_REG_SEC + 8
	ld	b,(hl)
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_ShowVumeter
	pop	af
;src\testWYZ.c:234: ShowVumeter(1,PSG_REG_SEC[AY_AmplB]);
	ld	hl, #_PSG_REG_SEC + 9
	ld	b,(hl)
	push	bc
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_ShowVumeter
	pop	af
;src\testWYZ.c:235: ShowVumeter(2,PSG_REG_SEC[AY_AmplC]);
	ld	hl, #_PSG_REG_SEC + 10
	ld	b,(hl)
	push	bc
	inc	sp
	ld	a,#0x02
	push	af
	inc	sp
	call	_ShowVumeter
;src\testWYZ.c:240: keyPressed = GetKeyMatrix(7);  
	ld	h,#0x07
	ex	(sp),hl
	inc	sp
	call	_GetKeyMatrix
	inc	sp
	ld	c,l
;src\testWYZ.c:241: if (keyPressed!=0xFF)  //pressure control of the keys
	ld	a,c
	inc	a
	jr	Z,00106$
;src\testWYZ.c:243: if(keyB7semaphore==false)
	ld	a,(#_keyB7semaphore + 0)
	or	a, a
	jr	NZ,00107$
;src\testWYZ.c:246: if (!(keyPressed&16))//  0b11101111)
	bit	4, c
	jr	NZ,00107$
;src\testWYZ.c:248: keyB7semaphore=true;
	ld	hl,#_keyB7semaphore + 0
	ld	(hl), #0x01
;src\testWYZ.c:249: PauseSong(); 
	call	_PauseSong
	jr	00107$
00106$:
;src\testWYZ.c:253: keyB7semaphore=false;        
	ld	hl,#_keyB7semaphore + 0
	ld	(hl), #0x00
00107$:
;src\testWYZ.c:259: WYZdecode();
	call	_WYZdecode
	jr	00109$
___str_3:
	.db 0x0a
	.db 0x00
___str_4:
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_5:
	.ascii "Song name:"
	.db 0x0a
	.ascii " "
	.db 0x00
___str_6:
	.ascii "Author:"
	.db 0x0a
	.ascii " "
	.db 0x00
;src\testWYZ.c:274: void PauseSong()
;	---------------------------------
; Function PauseSong
; ---------------------------------
_PauseSong::
;src\testWYZ.c:276: if((INTERR & 0b00000010)==0) WYZresume();  //AND binario  
	ld	hl,#_INTERR+0
	bit	1, (hl)
	jp	Z,_WYZresume
;src\testWYZ.c:277: else WYZpause();  
	jp  _WYZpause
;src\testWYZ.c:287: void SetSpritesSize(char size) __naked
;	---------------------------------
; Function SetSpritesSize
; ---------------------------------
_SetSpritesSize::
;src\testWYZ.c:333: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	HL,#0xF3DF +1 ; --- read vdp(1) from mem
	ld	B,(HL)
	ld	A,4(ix)
	cp	#1
	jr	NZ,size8
	set	1,B ; 16x16
	jr	setSize
	size8:
	res	1,B ; 8x8
	setSize:
	ld	C,#0x01
	call	writeVDP
	pop	IX
	ret
	writeVDP:
	ld	IY,#0xF3DF
	ld	E,C
	ld	D,#0
	add	IY,DE
	ld	(IY),B ;save copy of vdp value in system var
	ld	A,B
	di
	out	(#0x99),A
	ld	A,C
	or	#0x80 ;add 128 to VDP reg value
	out	(#0x99),A
	ei
	ret
;src\testWYZ.c:341: char PEEK(uint address)
;	---------------------------------
; Function PEEK
; ---------------------------------
_PEEK::
;src\testWYZ.c:355: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX)
	ld	A,(HL)
	ld	L,A
	pop	IX
	ret
;src\testWYZ.c:360: void POKE(uint address, char value)
;	---------------------------------
; Function POKE
; ---------------------------------
_POKE::
;src\testWYZ.c:374: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX)
	ld	A,6(IX)
	ld	(HL),A
	pop	IX
	ret
;src\testWYZ.c:388: void CopyMEM(unsigned int source, unsigned int destination, unsigned int length)
;	---------------------------------
; Function CopyMEM
; ---------------------------------
_CopyMEM::
;src\testWYZ.c:408: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX) ;source memory address
	ld	E,6(IX)
	ld	D,7(IX) ;Destination RAM address
	ld	C,8(IX)
	ld	B,9(IX) ;length
	ldir
	pop	IX
	ret
;src\testWYZ.c:414: char VPEEK(uint address)
;	---------------------------------
; Function VPEEK
; ---------------------------------
_VPEEK::
;src\testWYZ.c:429: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX)
	call	0x004A
	ld	L,A
	pop	IX
	ret
;src\testWYZ.c:437: char INKEY(){
;	---------------------------------
; Function INKEY
; ---------------------------------
_INKEY::
;src\testWYZ.c:441: __endasm;
	call	0x009F
	ld	L,A
	ret
;src\testWYZ.c:453: void WAIT(uint cicles)
;	---------------------------------
; Function WAIT
; ---------------------------------
_WAIT::
;src\testWYZ.c:456: for(i=0;i<cicles;i++) HALT;
	ld	bc,#0x0000
00103$:
	ld	hl,#2
	add	hl,sp
	ld	a,c
	sub	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	ret	NC
	halt	
	inc	bc
;src\testWYZ.c:457: return;
	jr	00103$
;src\testWYZ.c:472: char GetKeyMatrix(char line)
;	---------------------------------
; Function GetKeyMatrix
; ---------------------------------
_GetKeyMatrix::
;src\testWYZ.c:487: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX)
	call	0x0141
	ld	L,A
	pop	IX
	ret
;src\testWYZ.c:527: void ShowVumeter(char channel, char value)
;	---------------------------------
; Function ShowVumeter
; ---------------------------------
_ShowVumeter::
;src\testWYZ.c:602: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	C,4(IX)
	ld	A,5(IX)
;C	= num channel
;A	= value
;showVumeter:
	ld	(_VALUE),A
	SLA	C
	SLA	C
	ld	B,#0
	L00107:
	ld	a,c
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl,hl
	add	hl,hl
	ld	DE,#_SPRBUFFER
	ADD	HL,DE
	ex	DE,HL
	inc	DE
	inc	DE
	ld	A,(_VALUE)
	cp	#0
	jr	NZ,L00102
	xor	A
	ld	(DE),A
	jr	L00105
	L00102:
	ld	A,(_VALUE)
	cp	#4
	jr	C,L00104
	ld	A,#16
	ld	(DE),A
	ld	A,(_VALUE)
	sub	#4
	ld	(_VALUE),A
	jr	L00105
	L00104:
	ld	A,(_VALUE)
	add	a,a
	add	a,a
	ld	(DE),A
	xor	A
	ld	(_VALUE),A
	L00105:
	inc	C
	inc	B
	ld	A,B
	cp	#4
	jr	C,L00107
	pop	IX
;	ret
	ret
;src\testWYZ.c:607: void SetSPRITES() __naked
;	---------------------------------
; Function SetSPRITES
; ---------------------------------
_SetSPRITES::
;src\testWYZ.c:670: __endasm;
	ld	HL,#SPRITE_DATA
	ld	DE,#0x3800
	ld	BC,#32*5
	call	0x005C
	ld	DE,#_SPRBUFFER
	ld	HL,#VUMETER
	ld	BC,#64
	ldir
	ret
	SPRITE_DATA:
;	0-vum0
	.db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
;	1-vum1
	.db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x7F,0x7F,0x7F,0x00
	.db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFE,0xFE,0xFE,0x00
;	2-vum2
	.db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00
	.db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00
;	3-vum3
	.db	0x00,0x00,0x00,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00
	.db	0x00,0x00,0x00,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00
;	4-vum4
	.db	0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00
	.db	0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00
;SPRITE	ATRIBUTE DATAS #########################################################
;	for adjust colors, changue the last valor in line
;Y,X,SPR,COLOR
	VUMETER:
	.db	167,8,0,2
	.db	151,8,0,2
	.db	135,8,0,10
	.db	119,8,0,8
	.db	167,24,0,2
	.db	151,24,0,2
	.db	135,24,0,10
	.db	119,24,0,8
	.db	167,40,0,2
	.db	151,40,0,2
	.db	135,40,0,10
	.db	119,40,0,8
	.db	167,56,0,2
	.db	151,56,0,2
	.db	135,56,0,10
	.db	119,56,0,8
;END	SPRITE ATRIBUTE DATAS #####################################################
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
