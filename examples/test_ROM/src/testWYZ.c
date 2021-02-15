/* =============================================================================
  Test SDCC WYZplayer Lib
  Version: 1.3 (15/2/2021)
  Author: mvac7 <mvac7303b@gmail.com>
  Architecture: MSX
  Format: C Object (SDCC .rel)
  Programming language: C
   
  Description:
  Test the different functionalities of the SDCC adaptation of the WYZ player.
    
  History of versions:
  - 1.3 (15/2/2021) Adaptation to WYZ_Player v1.2 (function names)
  - 1.2 (18/1/2021) adapted to v1.1 from SDCC WYZ Player
  - 1.1 (9/7/2019)
  - 1.0 (28/5/2019)
============================================================================= */

#include "../include/newTypes.h"
#include "../include/msxSystemVariables.h"
#include "../include/msxBIOS.h"

#include "../include/interrupt.h"
#include "../include/textmode.h"
#include "../include/keyboard.h"

#include "../include/WYZplayer.h"
#include "../include/WYZsongdata.h"




#define  HALT __asm halt __endasm   //wait for the next interrupt


#define BASE13 0x1B00 // base 13 sprite attribute table
#define BASE14 0x3800 // base 14 sprite pattern table

#define VDPVRAM   0x98 //VRAM Data (Read/Write)
#define VDPSTATUS 0x99 //VDP Status Registers

 
 











// Function Declarations -------------------------------------------------------
void SetSpritesSize(char size);

char PEEK(uint address);
void POKE(uint address, char value);

void CopyMEM(unsigned int source, unsigned int destination, unsigned int length);

char VPEEK(uint address);

void WAIT(uint cicles);

void ShowVumeter(char channel, char value);

void SetSPRITES();

void PlaySong();
void Play_SoundEffect(char FXnumber);
void PauseSong();
void ChangeLoop();
void showLoopStatus();


// constants  ------------------------------------------------------------------
const char text01[] = "Test v1.3 (15/2/2021)";
const char text02[] = "WYZ Player Lib v1.2";

//const char presskey[] = "Press a key to Play";

const char songName[2][22]={"Pentacour's Nayade 01","Pentacour's Nayade 02"};

// global variable definition --------------------------------------------------

char VALUE;

char SPRBUFFER[72];  //20*4 =72B

boolean keyB0pressStatus;
boolean keyB6pressStatus;
boolean keyB7pressStatus;

boolean _loopState;

//char _isPlay;

uint firstPATaddr;

char _songNumber;

// Functions -------------------------------------------------------------------


void my_isr0(void) __interrupt 
{
//	DI;
//	READ_VDP_STATUS;     <<---- It is not necessary as the ISR in the BIOS does.

__asm push  AF __endasm;

    
  PlayAY();

__asm  
  ;vuelca a VRAM buffer atributos sprites
  ld   HL,#_SPRBUFFER
  ld   DE,#BASE13  
  ld   BC,#20*4
  call 0x005C  
__endasm;

__asm pop   AF __endasm;     
//  EI;
}






//
void main(void)
{
  char keyPressed;
     
  uint conta = 0;

  keyB0pressStatus=false;
  keyB6pressStatus=false;
  keyB7pressStatus=false;
  
  _loopState = false;
  
  _songNumber=0;
  
  COLOR(WHITE,DARK_BLUE,LIGHT_BLUE);
          
  WIDTH(32);
  SCREEN1();    
  SetSpritesSize(1);  
  
  LOCATE(0,0);
  PRINT(text01);
  PRINT("\n");
  PRINT(text02);
     
  
  Player_Init((unsigned int) WYZ_songs, 
              (unsigned int) WYZ_instruments, 
              (unsigned int) WYZ_FXs, 
              (unsigned int) WYZ_notes);   
        
   
  LOCATE(0,3);
  PRINT("F1 or F2 for play a song\n");
  PRINT("1 to 7 for play a FX\n"); 
  PRINT("STOP for Mute the song\n");
  PRINT("RETURN for Restore song\n");
  PRINT("SELECT for change Loop mode\n");
    
  SetSPRITES();
  
  install_isr(my_isr0);
  
  while(1)
  {
    HALT;
    
/*    
    LOCATE(0,10);
    PRINT("Channel A:");
    PrintFNumber((AYREGS[AY_ToneA+1]*0xFF)+AYREGS[AY_ToneA],32,5);
    PrintFNumber(AYREGS[AY_AmplA],32,4);
    LOCATE(0,11);
    PRINT("Channel B:");
    PrintFNumber((AYREGS[AY_ToneB+1]*0xFF)+AYREGS[AY_ToneB],32,5);
    PrintFNumber(AYREGS[AY_AmplB],32,4);
    LOCATE(0,12);
    PRINT("Channel C:");
    PrintFNumber((AYREGS[AY_ToneC+1]*0xFF)+AYREGS[AY_ToneC],32,5);
    PrintFNumber(AYREGS[AY_AmplC],32,4);
    
    LOCATE(0,13);
    PRINT("Noise :");
    PrintFNumber(AYREGS[AY_Noise],32,5);
   
    LOCATE(0,14);
    PRINT("WYZstate :");
    PrintFNumber(WYZstate,32,5);
*/
    
    
        
    ShowVumeter(0,AYREGS[AY_AmplA]);
    ShowVumeter(1,AYREGS[AY_AmplB]);
    ShowVumeter(2,AYREGS[AY_AmplC]);
    
    
    keyPressed = GetKeyMatrix(0);  
    if (keyPressed!=0xFF)  //pressure control of the keys
    {
      if(keyB0pressStatus==false)
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
      keyB0pressStatus=false;        
    }
    
    
    keyPressed = GetKeyMatrix(6);  
    if (keyPressed!=0xFF)  //pressure control of the keys
    {
      if(keyB6pressStatus==false)
      {
        if (!(keyPressed & Bit5))    //F1 Key
        {
          keyB6pressStatus=true;
          _songNumber=0;
          PlaySong(); 
        }
        if (!(keyPressed & Bit6))    //F2 Key
        {
          keyB6pressStatus=true;
          _songNumber=1;
          PlaySong(); 
        }
        /*if (!(keyPressed & Bit7))    //F3 Key
        {
          keyB6pressStatus=true;
          PlaySong(); 
        }*/          
      }      
    }else{
      keyB6pressStatus=false;        
    }
    

    keyPressed = GetKeyMatrix(7);  
    if (keyPressed!=0xFF)  //pressure control of the keys
    {
      if(keyB7pressStatus==false)
      {
        if (!(keyPressed & Bit4))    //STOP Key
        {
          keyB7pressStatus=true;
          PauseSong(); 
        }
        if (!(keyPressed & Bit6))    //SELECT Key
        {
          keyB7pressStatus=true;
          ChangeLoop(); 
        }
        if (!(keyPressed & Bit7))    //RETURN Key
        {
          keyB7pressStatus=true;
          PlaySong();
        }          
      }      
    }else{
      keyB7pressStatus=false;        
    }
    
   
    
    Player_Decode();
    
  }

/*  
  uninstall_isr();
  
  CLS();
  PRINT("END");
  WAIT(30*5);
*/  
}



void PlaySong()
{ 
  Player_InitSong(_songNumber, _loopState);
  
  LOCATE(0,10);
  
  PRINT("Song  : ");
  PrintFNumber(_songNumber+1,32,2);
  
  PRINT("\nName  : ");  //  Pentacour's Nayade 01");
  PRINT(songName[_songNumber]);
  
  PRINT("\nAuthor: aorante");
  
  PRINT("\nTempo : ");
  PrintFNumber(TEMPO,32,2);
  
  showLoopStatus();
}



void showLoopStatus()
{
  LOCATE(0,14);
  if ((WYZstate & Bit4)) PRINT("Loop  : ON ");
  else PRINT("Loop  : OFF");
}



void Play_SoundEffect(char FXnumber)
{
  PlayFX(FXnumber);
  keyB0pressStatus=true;
}



void PauseSong()
{
  if((WYZstate & 0b00000010)==0) Player_Resume();  //AND binario  
  else Player_Pause();  
}



void ChangeLoop()
{
  _loopState=!_loopState;
  Player_Loop(_loopState);
  //if((WYZstate & 0b00010000)==0) Player_Loop(true); 
  //else Player_Loop(false);
  showLoopStatus();  
}



/* =============================================================================
 SetSpritesSize
 Description: Set size type for the sprites.
 Input:       [char] size: 0=8x8; 1=16x16
 Output:      -
============================================================================= */ 
void SetSpritesSize(char size) __naked
{
size;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   HL,#RG0SAV+1 ; --- read vdp(1) from mem
  ld   B,(HL)

  ld   A,4(ix)    
  cp   #1
  jr   NZ,size8
  
  set  1,B ; 16x16
  jr   setSize
  
size8:
  res  1,B  ; 8x8    

setSize:  
  ld   C,#0x01
  call writeVDP
  
  pop  IX
  ret
  
  
writeVDP:

  ld   IY,#RG0SAV
  ld   E,C
  ld   D,#0
  add  IY,DE
  ld   (IY),B ;save copy of vdp value in system var
  
  ld   A,B
  di
	out	 (#VDPSTATUS),A
	ld   A,C
  or   #0x80            ;add 128 to VDP reg value
  out	 (#VDPSTATUS),A
  ei
  ret

__endasm;
}






char PEEK(uint address) __naked
{
address;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
    
  ld   L,4(IX)
  ld   H,5(IX)
  ld   A,(HL)

  ld   L,A
  pop  IX
  ret
__endasm;
}



void POKE(uint address, char value) __naked
{
address;value;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
    
  ld   L,4(IX)
  ld   H,5(IX)
  ld   A,6(IX)
  ld   (HL),A

  pop  IX
  ret  
__endasm;
}



/* =============================================================================
   CopyMEM
 
   Function : Copy a block of memory to another address.
   Input    : [unsigned int] Source memory address
              [unsigned int] Destination RAM address
              [unsigned int] length 
   Output   : -
============================================================================= */
void CopyMEM(unsigned int source, unsigned int destination, unsigned int length) __naked
{
source;destination;length;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   L,4(IX)
  ld   H,5(IX) ;source memory address
  
  ld   E,6(IX)
  ld   D,7(IX) ;Destination RAM address
  
  ld   C,8(IX)
  ld   B,9(IX) ;length
  
  ldir
  
  pop  IX
  ret
__endasm;
}




char VPEEK(uint address) __naked
{
address;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
    
  ld   L,4(IX)
  ld   H,5(IX) 
   
  call RDVRM
  
  ld   L,A
  pop  IX
  ret
__endasm;
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

















/*void testPRINT()
{
  PRINT(">Test PRINT():\n");
  PRINT(testString);
  PRINT("\n\n>Test PRINT() with Escape Sequences:");
  PRINT("\n\tLine 1\n\tLine 2\n\tLine 3"); // \t Horizontal Tab
  PRINT("\r");  // Carriage Return
  PRINT(">\n");
  PRINT("\\");  // Backslash
  PRINT("\a");  // Beep
  PRINT("\n");  // Newline
  //PRINT("\f");  // Formfeed (CLS)
  //PRINT("\v");  // Place the cursor at the top of the screen
  PRINT("\'Single quotation mark\'\n");  // Single quotation mark
  PRINT("\"Double quotation mark\"\n");         // \" Double quotation mark
  PRINT("Question mark\?\n");  // Question mark
  
  LOCATE(0,22);
  PRINT(presskey);
  INKEY();
}*/




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



