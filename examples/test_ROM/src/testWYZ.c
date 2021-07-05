/* =============================================================================
  Test SDCC WYZplayer Lib
  Version: 1.5 (14/6/2021)
  Author: mvac7 <mvac7303b@gmail.com>
  Architecture: MSX
  Format: C Object (SDCC .rel)
  Programming language: C
   
  Description:
  Test the different functionalities of the SDCC adaptation of the WYZ player.
    
  History of versions:
  - 1.5 (14/6/2021) New GFX design. Song End viewer. 
  - 1.4 (11/6/2021) Changes in the AY definitions and added SC1 Tileset
  - 1.3 (15/2/2021) Adaptation to WYZ_Player v1.2 (function names)
  - 1.2 (18/1/2021) adapted to v1.1 from SDCC WYZ Player
  - 1.1 (9/7/2019)
  - 1.0 (28/5/2019)
============================================================================= */

#include "../include/newTypes.h"
#include "../include/msxSystemVariables.h"
#include "../include/msxBIOS.h"

#include "../include/interruptM1_Hooks.h"
#include "../include/memory.h"
#include "../include/keyboard.h"
#include "../include/VDP_TMS9918A_MSXROM.h"
#include "../include/VDP_PRINT.h"
#include "../include/unRLEWBtoVRAM.h"

#include "../include/WYZplayer.h"
#include "../include/WYZsongdata.h"

#include "../include/testWYZ_GFX.h"



#define  HALT __asm halt __endasm   //wait for the next interrupt





// Function Declarations -------------------------------------------------------
void my_TIMI(void);

void WAIT(uint cicles);

void ShowVumeter(char channel, char value);

void SetSPRITES();

void PlaySong(char number);
void Play_SoundEffect(char FXnumber);
void PauseSong();
void SwapLoop();

void ShowPlayback();
void ShowLoop();
void ShowENDsong();

void ShowState(uint vaddr, boolean state);




// constants  ------------------------------------------------------------------
const char text01[] = "TEST WYZplayer Lib";
const char text02[] = "v1.5 (14/6/2021)";

//const char presskey[] = "Press a key to Play";

const char songName[2][22]={"Pentacour's Nayade 01","Pentacour's Nayade 02"};




// global variable definition --------------------------------------------------

char VALUE;

char SPRBUFFER[72];  //20*4 =72B

boolean Row0pressed;
boolean Row6pressed;
boolean Row7pressed;

boolean _loopState;

//char _isPlay;

uint firstPATaddr;




// Functions -------------------------------------------------------------------



void main(void)
{
  char keyPressed;
     
  uint conta = 0;

  Row0pressed=false;
  Row6pressed=false;
  Row7pressed=false;
  
  _loopState = false;
  
  
  COLOR(WHITE,DARK_BLUE,LIGHT_BLUE);
          
  SCREEN(1);    
  SetSpritesSize(1);
  
  unRLEWBtoVRAM((uint) SC1_TSET, BASE7);
  unRLEWBtoVRAM((uint) SC1_TSET_COLOR, BASE6);
  unRLEWBtoVRAM((uint) mainSCR, BASE5);
     
  VPRINT(1,2,text02);
  
  Player_Init((unsigned int) WYZ_songs, 
              (unsigned int) WYZ_instruments, 
              (unsigned int) WYZ_FXs, 
              (unsigned int) WYZ_notes);   
        

  ShowLoop();
    
  SetSPRITES();
  
  Install_TIMI(my_TIMI);;
  
  while(1)
  {
    HALT;
        
    ShowVumeter(0,AYREGS[AY_AmpA]);
    ShowVumeter(1,AYREGS[AY_AmpB]);
    ShowVumeter(2,AYREGS[AY_AmpC]);
    
    
    keyPressed = GetKeyMatrix(0);  
    if (keyPressed!=0xFF)  //pressure control of the keys
    {
      if(Row0pressed==false)
      {
        if (!(keyPressed & Bit1)) Play_SoundEffect(0);
        if (!(keyPressed & Bit2)) Play_SoundEffect(1);
        if (!(keyPressed & Bit3)) Play_SoundEffect(2);
        if (!(keyPressed & Bit4)) Play_SoundEffect(3);
        if (!(keyPressed & Bit5)) Play_SoundEffect(4);
        if (!(keyPressed & Bit6)) Play_SoundEffect(5);
        if (!(keyPressed & Bit7)) Play_SoundEffect(6);
      }      
    }else{
      Row0pressed=false;        
    }
    
    
    // Keyboard row 6
    keyPressed = GetKeyMatrix(6);  
    if (keyPressed!=0xFF)  //pressure control of the keys
    {
      if(Row6pressed==false)
      {
        if (!(keyPressed & Bit5)){Row6pressed=true;PlaySong(0);} //F1 Key
        if (!(keyPressed & Bit6)){Row6pressed=true;PlaySong(1);} //F2 Key
        //if (!(keyPressed & Bit7)){keyB6pressStatus=true;PlaySong(3);} //F3 Key        
      }      
    }else{
      Row6pressed=false;        
    }    

   
    // Keyboard row 7
    keyPressed = GetKeyMatrix(7);
    if (keyPressed!=0xFF)
    {
      if(Row7pressed==false)
      {
        //if (!(keyPressed&Bit0)) {Row7pressed=true;}; // [F4]
        //if (!(keyPressed&Bit1)) {Row7pressed=true;}; // [F5]
        //if (!(keyPressed&Bit2)) {Row7pressed=true;}; // [ESC]
        if (!(keyPressed&Bit3)) {Row7pressed=true;SwapLoop();};  // [TAB]
        if (!(keyPressed&Bit4)) {Row7pressed=true;PauseSong();}; // [STOP]
        //if (!(keyPressed&Bit5)) {Row7pressed=true;}; // [BS]
        //if (!(keyPressed&Bit6)) {Row7pressed=true;}; // [SELECT]
        //if (!(keyPressed&Bit7)) {Row7pressed=true;PlaySong(0);}; // [RETURN]
      }      
    }else Row7pressed=false;
    
   
    
    Player_Decode();
    
    ShowPlayback();
    ShowENDsong();
    
  }

}



void my_TIMI(void)
{
  PUSH_AF;

    
  PlayAY();

__asm  
  ;vuelca a VRAM buffer atributos sprites
  ld   HL,#_SPRBUFFER
  ld   DE,#BASE13  
  ld   BC,#20*4
  call 0x005C  
__endasm;

  POP_AF;  
}



void PlaySong(char number)
{ 
  Player_InitSong(number, _loopState);
  
  VPrintNumber(8,10,number+1,1);   
  VPRINT(8,11,songName[number]);
  VPRINT(8,12,"aorante");
  VPrintNumber(8,13,TEMPO,1);
  
  ShowLoop();
}




void ShowPlayback()
{   
  if ((WYZstate & Bit1)) ShowState(0x1AE7,true);  //7,23
  else ShowState(0x1AE7,false);
}



void ShowLoop()
{   
  if ((WYZstate & Bit4)) ShowState(0x1AF1,true);  //17,23
  else ShowState(0x1AF1,false);
}



void ShowENDsong()
{   
  if ((Player_IsEnd()==true)) ShowState(0x1AFA,true);  //26,23
  else ShowState(0x1AFA,false);
}



void ShowState(uint vaddr, boolean state)
{
    uint buttonADDR;
    
    if (state==true) buttonADDR = (uint) button_ON;
    else buttonADDR = (uint) button_OFF;
    
    CopyToVRAM(buttonADDR,vaddr,3);
}



void Play_SoundEffect(char FXnumber)
{
  PlayFX(FXnumber);
  Row0pressed=true;
}



void PauseSong()
{
  if(WYZstate & Bit1) Player_Pause();  //AND binario  
  else Player_Resume();  
}




void SwapLoop()
{
  _loopState=!_loopState;
  Player_Loop(_loopState);
  ShowLoop();  
}






/* =============================================================================
   WAIT
   Generates a pause in the execution of n interruptions.
   PAL: 50=1second. ; NTSC: 60=1second.
   Input    : [unsigned int] cicles 
   Output   : -
============================================================================= */ 
void WAIT(uint cicles)
{
  uint i;
  for(i=0;i<cicles;i++) HALT;
  return;
}




void ShowVumeter(char channel, char value) __naked
{
channel;value;
__asm

  push IX
  ld   IX,#0
  add  IX,SP
    
  ld   C,4(IX)
  ld   A,5(IX)


;C = num channel
;A = value  
;showVumeter:

  ld   (_VALUE),A
  
  SLA  C
  SLA  C
  
  ld	 B,#0
L00107:
  ld	a,c
  ld	l,a
  rla
  sbc	a, a
  ld	h,a
  add	hl,hl
  add	hl,hl
  
  ld   DE,#_SPRBUFFER
  ADD  HL,DE
  ex   DE,HL
  
  inc	 DE
  inc	 DE
  
  ld   A,(_VALUE)
  cp	 #0
  jr	 NZ,L00102
  xor  A
  ld	 (DE),A
  jr   L00105
  
L00102:                       
  ld   A,(_VALUE)
  cp   #4
  jr	 C,L00104
  ld	 A,#16
  ld	 (DE),A
  
  ld    A,(_VALUE)
  sub   #4
  ld   (_VALUE),A
  jr	 L00105
L00104:
  ld   A,(_VALUE)
  add	 a,a
  add	 a,a
  ld	(DE),A
  xor  A
  ld   (_VALUE),A
L00105:
  inc	 C
  inc	 B
  ld	 A,B
  cp   #4
  jr	C,L00107
  

  pop  IX
  ret
  
__endasm;
}



void SetSPRITES() __naked
{
__asm


  ld   HL,#SPRITE_DATA
  ld   DE,#BASE14  
  ld   BC,#32*5
  call 0x005C

  ld   DE,#_SPRBUFFER
  ld   HL,#VUMETER
  ld   BC,#64
  ldir
  
  ret
  

SPRITE_DATA:
; 0-vum0
.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
; 1-vum1
.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x7F,0x7F,0x7F,0x00
.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFE,0xFE,0xFE,0x00
; 2-vum2
.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00
.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00
; 3-vum3
.db 0x00,0x00,0x00,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00
.db 0x00,0x00,0x00,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00
; 4-vum4
.db 0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00,0x7F,0x7F,0x7F,0x00
.db 0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00,0xFE,0xFE,0xFE,0x00



;SPRITE ATRIBUTE DATAS #########################################################
; for adjust colors, changue the last valor in line


;Y,X,SPR,COLOR
VUMETER:
.db 167,8,0,2
.db 151,8,0,2
.db 135,8,0,10
.db 119,8,0,8

.db 167,24,0,2
.db 151,24,0,2
.db 135,24,0,10             
.db 119,24,0,8 

.db 167,40,0,2
.db 151,40,0,2
.db 135,40,0,10
.db 119,40,0,8
             
.db 167,56,0,2
.db 151,56,0,2
.db 135,56,0,10
.db 119,56,0,8
;END SPRITE ATRIBUTE DATAS #####################################################
__endasm;
}



