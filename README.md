# SDCC WYZ Player Library for MSX

#### Version: 
1.0

#### Date: 
28 may 2019

#### Architecture: 
MSX

#### Programming language: 
Assembler and C (SDCC)

#### Authors: 
- MSX PSG proPLAYER V 0.3 by WYZ/Iggy Rock 09.03.2016
- Adapted to SDCC: mvac7/303bcn > <mvac7303b@gmail.com>

#### WEB:
https://sites.google.com/site/wyzplayer/home
http://www.cpcwiki.eu/index.php/WYZTracker
  
#### History of versions:
- v1.0 (28/4/2019) 
- v0.9 (27/4/2013)



## Sorry!: This text is pending correction of the English translation. <<<<<<<<




## 1. Introduction

Adaptation of the WYZ Player for MSX to be used in software development in C 
(SDCC). 

Allows access to player variables.

Include an example application for testing and learning purposes.

WYZ player is a music creation and playback system for computers based on Z80 
processors and the AY3-8910 or compatible sound processor.

It is mainly designed for the development of video games. It allows you to play 
music and launch sound effects.
 


## 2. License





## 3. Acknowledgments
  
Thanks for information, help or your contribution to the MSX community:

* Iggy Rock/WYZ > https://sites.google.com/site/wyzplayer/home
* Augusto Ruiz > https://github.com/AugustoRuiz/WYZTracker
* MSXKun/Paxanga soft > http://paxangasoft.retroinvaders.com/
* SapphiRe/Z80ST > http://www.z80st.es/
* Avelino Herrera > http://msx.atlantes.org/index_es.html
* Nerlaska > http://albertodehoyonebot.blogspot.com.es
* Fubu > http://www.gamerachan.org/fubu/
* Marq/Lieves!Tuore > http://www.kameli.net/lt/
* Pentacour > http://pentacour.com/
* JamQue/TPM > http://www.thepetsmode.com/
* Andrear > http://andrear.altervista.org/home/msxsoftware.php
* Konamiman > https://www.konamiman.com
* MSX Assembly Page > http://map.grauw.nl/resources/msxbios.php
* Portar MSX Tech Doc > http://nocash.emubase.de/portar.htm
* MSX Resource Center > http://www.msx.org/
* Karoshi MSX Community > http://karoshi.auic.es/
* BlueMSX Developers > http://www.bluemsx.com/
* OpenMSX Developers > http://openmsx.sourceforge.net/
* Meisei by hap > ?



## 4. Requirements

For C:

* Small Device C Compiler (SDCC) v3.6 > http://sdcc.sourceforge.net/
     
* Hex2bin v2.2 > http://hex2bin.sourceforge.net/

* WYZ Tracker by Augusto Ruiz > https://github.com/AugustoRuiz/WYZTracker
  (for create WYZ songs)
   
   
## 5. Functions

* **WYZInit**(many input data) - Init player
* **WYZloadSong**(char numSong) - Init song
* **WYZdecode**() - Decode a frame from WYZ song
* **WYZplayAY**() - Send data to AY registers. Execute on each interruption of VBLANK
* **WYZsetLoop**(char mode) - Change loop mode. false = 0, true = 1
* **WYZpause**() - Pause song playback
* **WYZresume**() - Resume song playback
* **WYZplayFX**(char numSound) - Play Sound Effect



## 6. How to use

### 6.1 Introduction 

The WYZ music system is designed for cross-developing:
1) The song composes with WYZtracker on a Windows OS-based computer,
2) It is exported to .mus
3) It is imported into the project together with the WYZplayer

To be able to use it in SDCC, it has been necessary to adapt the player (this 
object), and because the data of the song .mus is composed of an assembly source 
plus one or more binaries (as many songs as we have), it's necessary to 
convert them to a format that SDCC supports, so we will have to do some 
modifications and generate an object (.rel), which is explained in the 6.2 
point.

From our code in C we can access the features of the player, to which we have 
added some extra to facilitate control of the song.
     


### 6.2 How to create a Song Data Object

To attach the music data to our program, we will have to follow the following 
steps:

1) Open in WYZtracker a song and export to MUS file (File/Export).

2) Open a file with extension '.mus.asm' in a text editor.

3) Add a dot after 'DB' and 'DW'. Example:

   Before:
```  
     ;Instrumento 'Piano'
     PAUTA_0:  DB  13,0,11,0,9,0,5,0,129
     ;Instrumento 'blip'
     PAUTA_1:  DB  11,0,8,0,9,0,7,0,5,0,0,129
```
  
   After:
```  
     ;Instrumento 'Piano'
     PAUTA_0:  .DB  13,0,11,0,9,0,5,0,129
     ;Instrumento 'blip'
     PAUTA_1:  .DB  11,0,8,0,9,0,7,0,5,0,0,129
```


4) Rename labels:
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


5) Generate a assembly datas from binary file .mus with an extern aplication, 
and paste it at the end of the source with which we are working.
   
Repeat this process for all the songs that your program needs, adding the 
numbered label 'SONGnn'.
   
##Warning:## The WYZ player is designed to have several songs, thinking about t
he development of video games, but to work properly, they must be created with 
the same set of instruments.

   Example:
```   
     SONG00:
     .DB 0x03,0x31,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x42,0x7E
     .DB 0x3F,0x02,0x00,0x66,0x6A,0x6D,0x72,0x6D,0x6A,0x66,0x6A,0x6D,0x72,0x6D
     .DB n  
```


6) Add the index of songs width the name "_WYZ_songs::" at the beginning of the 
source, with the labels of all the songs that we have included:

Example:
```
     _WYZ_songs::  .DW SONG00,SONG01
```

7) Save the file with '.s' extension.

8) Create a script or execute on the command line, the sentence to compile the 
source that we have created:
```   
   sdasz80 -o song_name.s
```
       



### 6.3 Control music playback

The first step to make for the player to work is to initialize it.
To the **WYZInit** function, the directions of the indices must be passed to the 
instruments, FXs, Tones and the sequences of the songs.

The Init ruling should always be like this:
```
WYZinit((unsigned int) WYZ_songs, 
        (unsigned int) WYZ_instruments, 
        (unsigned int) WYZ_FXs, 
        (unsigned int) WYZ_notes);
```        

The next step is to tell the player which song to sound using **WYZloadSong(song number)**

From here, we will need that in each interruption of VBLANK, **WYZplayAY()** is 
executed to send the sound data to the PSG and **WYZdecode()** so that the 
player can process the steps of the song sequence.

From here, we can stop the song with **WYZpause()** and recover it with 
**WYZresume()** or **WYZloadSong(nSong)** to start from the beginning or to 
change the song.

You can also launch sound effects with the **WYZplayFX(FX number)** function at any time.