# SDCC WYZ Player Library for MSX

#### Version: 
1.0

#### Date: 
??

#### Architecture: 
MSX

#### Programming language: 
C

#### Authors: 
- MSX PSG proPLAYER V 0.3 by WYZ/Iggy Rock 09.03.2016
 
- Adapted to SDCC: mvac7/303bcn > <mvac7303b@gmail.com>

https://sites.google.com/site/wyzplayer/home
http://www.cpcwiki.eu/index.php/WYZTracker
  


## Sorry!: This text is pending correction of the English translation. <<<<<<<<




## 1. Introduction

Adaptation of the WYZ Player for MSX to be used in software development in C 
(SDCC). 

Allows access to player variables.

Include an example application for testing and learning purposes.




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



## 6. How to use

### 6.1 Introduction 




### 6.2 How to create a Song Data Object

### 6.3 Control music playback