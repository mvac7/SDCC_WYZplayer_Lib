# VDP WYZ Player MSX SDCC Library (fR3eL Project)

```
Authors: 
- MSX PSG proPLAYER V 0.3 by WYZ/Iggy Rock 09.03.2016 https://sites.google.com/site/wyzplayer/home
- Adapted to SDCC: mvac7/303bcn > <mvac7303b@gmail.com>
Architecture: MSX
Format: C Object (SDCC .rel)
Programming language: C and Z80 assembler
```



## Sorry!: This text is pending correction of the English translation. <<<<<<<<


---
## History of versions:

- v1.2 (15/02/2021) same function names in music libraries
- v1.1 (18/01/2021) Same nomenclature for function names on WYZ and Vortex players #3
- v1.0 (28/4/2019) 
- v0.9 (27/4/2013)


---
## Index

- 1 Introduction
- 2 License
- 3 Requirements
- 4 Acknowledgments
- 5 Functions
- 6 Player values
- 7 Definitions
  - 7.1 AY Registers
- 8 How to use
  - 8.1 Introduction
  - 8.2 How to create a song data Object
  - 8.3 Control music playback
-  9 Examples 
 

---
## 1 Introduction

Adaptation of the WYZ Player for MSX to be used in software development in C (SDCC). 

Allows access to player variables.

Include an example application for testing and learning purposes.

WYZ player is a music creation and playback system for computers based on Z80 processors and the AY3-8910 or compatible sound processor.

It is mainly designed for the development of video games. It allows you to play music and launch sound effects.
 
In the source code (\examples), you can find applications for testing and learning purposes.

This library is part of the [MSX fR3eL Project](https://github.com/mvac7/SDCC_MSX_fR3eL).

Enjoy it!



## 2 License

MSX PSG proPLAYER by WYZ/Iggy Rock



## 3 Requirements

* Small Device C Compiler (SDCC) v3.9 http://sdcc.sourceforge.net/
* Hex2bin v2.5 http://hex2bin.sourceforge.net/ 
* WYZ Tracker by Augusto Ruiz > https://github.com/AugustoRuiz/WYZTracker (for create WYZ songs)
* A tool for convert export .MUS files from WYZ Tracker to SDCC Object File (.rel). For WinOS you have the [WYZtoSDCCobj Converter Tool](https://github.com/mvac7/mSXdevtools_WYZtoSDCCobj)  
  
  

---
## 4 Acknowledgments
  
I want to give a special thanks to all those who freely share their knowledge with the MSX developer community.

* Iggy Rock/WYZ [(WEB)](https://sites.google.com/site/wyzplayer/home)
* Augusto Ruiz [(gitHub Tracker Project)](https://github.com/AugustoRuiz/WYZTracker)
* Avelino Herrera > [(WEB)](http://msx.atlantes.org/index_es.html)
* Nerlaska > [(Blog)](http://albertodehoyonebot.blogspot.com.es)
* Marq/Lieves!Tuore > [(WEB)](http://www.kameli.net/marq/) [(Lieves!Tuore)](http://www.kameli.net/lt/)
* Fubukimaru [(gitHub)](https://github.com/Fubukimaru) > [(Blog)](http://www.gamerachan.org/fubu/)
* Andrear > [(Blog)](http://andrear.altervista.org/home/msxsoftware.php)
* Ramones > [(Articles published in MSXBlog)](https://www.msxblog.es/tutoriales-de-programacion-en-ensamblador-ramones/) - [(MSXbanzai)](http://msxbanzai.tni.nl/dev/faq.html)
* Sapphire/Z80ST > [(WEB)](http://z80st.auic.es/)
* Fernando García > [(youtube tutorials)](https://www.youtube.com/user/bitvision)
* Eric Boez > [(gitHub)](https://github.com/ericb59)
* MSX Assembly Page > [(WEB)](http://map.grauw.nl/resources/msxbios.php)
* Portar MSX Tech Doc > [(WEB)](http://nocash.emubase.de/portar.htm)
* MSX Resource Center > [(WEB)](http://www.msx.org/)
* Karoshi MSX Community (RIP 2007-2020)?
* BlueMSX emulator >> [(WEB)](http://www.bluemsx.com/)
* OpenMSX emulator >> [(WEB)](http://openmsx.sourceforge.net/)
* Meisei emulator >> ?



 
---
## 5 Functions

* **Player_Init**(many input data) - Initialize the Player
* **Player_InitSong**(char numSong, char loop) - Initialize song
* **Player_Decode**() - Process the next step in the song sequence
* **PlayAY**() - Send data from AYREGS buffer to AY registers. (Execute on each interruption of VBLANK)
* **Player_Loop**(char loop) - Change loop mode (false = 0, true = 1)
* **Player_Pause**() - Pause song playback
* **Player_Resume**() - Resume song playback
* **PlayFX**(char numSound) - Play Sound Effect


## 6 Player values

* WYZstate [char] - status of player  (1=ON;0=OFF)
  - BIT 0 = Load song
  - BIT 1 = Play? (0 for Pause song)
  - BIT 2 = FXs
  - BIT 3 = SFX
  - BIT 4 = LOOP

* SONG  [char]  - Number of song playing
* TEMPO [char]  - Tempo
* AYREGS [array] - PSG registers values (0 to 13)


## 7 Definitions

### 7.1 AY Registers

Label | Value | Description
-- | -- | -- 
AY_ToneA     |  0 | Channel A Tone Period (12 bits)
AY_ToneB     |  2 | Channel B Tone Period (12 bits)
AY_ToneC     |  4 | Channel C Tone Period (12 bits)
AY_Noise     |  6 | Noise Period (5 bits)
AY_Mixer     |  7 | Mixer
AY_AmpA      |  8 | Channel Volume A (4 bits + B5 active Envelope)
AY_AmpB      |  9 | Channel Volume B (4 bits + B5 active Envelope)
AY_AmpC      | 10 | Channel Volume C (4 bits + B5 active Envelope)
AY_EnvPeriod | 11 | Envelope Period (16 bits)
AY_EnvShape  | 13 | Envelope Shape



---
## 8 How to use

### 8.1 Introduction 

The WYZ music system is designed for cross-developing:

1) The song composes with WYZtracker on a Windows OS-based computer,
2) It is exported to .mus
3) It is imported into the assembler project together with the WYZplayer


To be able to use it in SDCC, it has been necessary to adapt the player (this object), and the .mus data files, so they can be imported into the project.

From our code in C we can access the features of the player, to which we have added some extra to facilitate control of the song.

The player is based on a decoder that collects the data of a song step (frame) and translates it into data from the AY-3-8910 that writes in the `AYREGS` buffer. 
These data should be transferred to PSG, at the beginning of the VBLANK interruption through the `PlayAY()` function.

We will have control of the final sound if between the `Player_Decode()` and `PlayAY()` we modify the buffer. 
In this way we can mute channels, generate fades or launch sound effects on the song that is playing.
     


### 8.2 How to create a song data Object

When exporting a song with WYZtracker, it generates two files:
- **.mus** > Binary with the sequence data.
- **.mus.asm** > Assembler source with the data of the instruments, effects and the note frequency table.

Since SDCC does not allow including binary files, these must be adapted to a C object (.rel), with a specific structure.

You can do it manually by following the steps I give in this document or you can use the [WYZtoSDCCobj Converter Tool](https://github.com/mvac7/mSXdevtools_WYZtoSDCCobj), designed for this purpose.



#### 1) Open a song in WYZtracker and export it to a MUS file (Menu: File/Export). Do it with all the songs you want to include in your program.

> **Warning:** The WYZ player is designed to have several songs, thinking about the development of video games, but to work properly, 
they must be created with the same set of instruments.


#### 2) Open a file with extension '.mus.asm' in a text editor.

#### 3) Add a dot after 'DB' and 'DW'.

Example Before:
```  
   ;Instrumento 'Piano'
   PAUTA_0:  DB  13,0,11,0,9,0,5,0,129
   ;Instrumento 'blip'
   PAUTA_1:  DB  11,0,8,0,9,0,7,0,5,0,0,129
```
  
Example After:
```  
   ;Instrumento 'Piano'
   PAUTA_0:  .DB  13,0,11,0,9,0,5,0,129
   ;Instrumento 'blip'
   PAUTA_1:  .DB  11,0,8,0,9,0,7,0,5,0,0,129
```


#### 4) Rename labels:
- "TABLA_PAUTAS:"  for "_WYZ_instruments::"
- "TABLA_SONIDOS:" for "_WYZ_FXs::" 
- "DATOS_NOTAS:"   for "_WYZ_notes::"
   
Example Before:
```
   ; Tabla de instrumentos
   TABLA_PAUTAS: DW PAUTA_0,PAUTA_1,PAUTA_2
```

Example After:
```
   ; Tabla de instrumentos
   _WYZ_instruments:: .DW PAUTA_0,PAUTA_1,PAUTA_2
```


#### 5) Generate a assembly datas from binary file .mus with an extern aplication, and paste it at the end of the source with which we are working.
   
Repeat this process for all the songs that your program needs, adding the numbered label 'SONGnn'.

**Example:**
```   
   SONG00:
   .DB 0x03,0x31,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x42,0x7E
   .DB 0x3F,0x02,0x00,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D
   .DB n  
```


#### 6) Add the index of songs width the name "_WYZ_songs::" at the beginning of the source, with the labels of all the songs that we have included:

**Example:**
```
   _WYZ_songs::  .DW SONG00,SONG01
```


#### 7) Save the file with '.s' extension.

#### 8) Create a script or execute on the command line, the sentence to compile the source that we have created:

```   
   sdasz80 -o song_name.s
```

This will generate a .rel file that you should include along with WYZplayer.rel in the compilation of your project.       

**Example:**
```   
   sdcc -mz80 -o build\ --code-loc 0x4020 --data-loc 0xC000 --use-stdout --no-std-crt0 crt0msx.16k.4000.rel WYZplayer.rel WYZ_songdata.rel example.c
```



### 8.3 Control music playback

The first step is to start the Player using the **Player_Init** function.
You will have to provide the addresses of the indexes of the instruments, FXs, the sequences of the songs and the address of the frequency table of the notes.
These addresses are collected from WYZsongdata.h, which you should include in your sources.

The initialization statement will always be the same:
```
Player_Init((unsigned int) WYZ_songs, (unsigned int) WYZ_instruments, (unsigned int) WYZ_FXs, (unsigned int) WYZ_notes);
```        

The next step is to tell the player which song to sound using **Player_InitSong(song_number, loop_status)**

From here, we will need that in each interruption of VBLANK, **PlayAY()** is 
executed to send the sound data to the PSG and **Player_Decode()** so that the player can process the steps of the song sequence.

From here, we can stop the song with **Player_Pause()** and recover it with **Player_Resume()** or **Player_InitSong** to start from the beginning or to change the song.

You can also launch sound effects with the **PlayFX(number)** function at any time.


**Example:**
```
  void main(void)
  {
    Player_Init((unsigned int) WYZ_songs, 
             (unsigned int) WYZ_instruments, 
             (unsigned int) WYZ_FXs, 
             (unsigned int) WYZ_notes);
            
    Player_InitSong(0,1);
    
    while(1)
    {
  __asm
    halt
  __endasm;
  
      PlayAY();
    
      Player_Decode();
      
    }
  } 
```


---
## 9 Examples

In example/test_ROM folder, there is a project included in SDCC to test all the features of the WYZplayer and that can help you learn how to use it.

![TEST WYZ screenshot](https://raw.githubusercontent.com/mvac7/SDCC_WYZplayer/master/examples/test_ROM/_GFX/TESTWYZ.png)

It uses two songs that I made for the game Nayade Resistance, developed by [@Pentacour](https://twitter.com/pentacour) for the [MSXdev'14 compo](https://www.msxdev.org/msxdev-archive/msxdev14/).
