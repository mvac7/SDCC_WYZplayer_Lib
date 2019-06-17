/* =============================================================================
                                                                            
   MSX PSG proPLAYER V0.3 - WYZ 09.03.2016                                                
                                                                            
   Description                                                              
   library for acces to WYZ Player                                          
============================================================================= */
#ifndef  __WYZ_PLAYER_H__
#define  __WYZ_PLAYER_H__


//AY registers
#define AY_ToneA 0  //Channel A Tone Period (12 bits)
#define AY_ToneB 2  //Channel B Tone Period (12 bits)
#define AY_ToneC 4  //Channel C Tone Period (12 bits)
#define AY_Noise 6  //Noise Period (5 bits)
#define AY_Mixer 7  //Mixer
#define AY_AmplA 8  //Channel Volume A (4 bits + B5 active Envelope)
#define AY_AmplB 9  //Channel Volume B (4 bits + B5 active Envelope)
#define AY_AmplC 10 //Channel Volume C (4 bits + B5 active Envelope)
#define AY_Env   11 //Envelope Period (12 bits)
#define AY_EnvTp 13 //Envelope Type



//------------------------------------------------------------------------------
/*
const unsigned int DATOS_NOTAS[]={0,0,
1711,1614,1524,1438,1358,1281,1210,1142,1078,1017,
960,906,855,807,762,719,679,641,605,571,
539,509,480,453,428,404,381,360,339,320,
302,285,269,254,240,227,214,202,190,180,
170,160,151,143,135,127,120,113,107,101,
95,90,85,80,76,71,67,64,60,57};
*/

//------------------------------------------------------------------------------

/*
WYZstate = INTERR            
INTERRUPTORES 1=ON 0=OFF
- BIT 0=CARGA CANCION ON/OFF
- BIT 1=PLAYER ON/OFF
- BIT 2=EFECTOS ON/OFF
- BIT 3=SFX ON/OFF
- BIT 4=LOOP
*/
extern char WYZstate;

extern char SONG;   //number of song playing
extern char TEMPO;  //TEMPO

extern char PSG_REG[16];
extern char PSG_REG_SEC[16];

//songs index
extern unsigned int TABLA_SONG;  

//instruments index
extern unsigned int TABLA_PAUTAS; 

//FXs index 
extern unsigned int TABLA_SONIDOS;

//Data of the frequencies of the notes
extern unsigned int DATOS_NOTAS;



//------------------------------------------------------------------------------

// Init player
void WYZinit(unsigned int addrSONGs, unsigned int addrInstruments, unsigned int addrFXs, unsigned int addrFreqs) __naked;

void WYZloadSong(char numSong); //Init song

void WYZdecode(); // Decode a frame from WYZ song

void WYZplayAY();   // Send data to AY registers. Execute on each interruption of VBLANK

void WYZsetLoop(char mode);  // Change loop mode. false = 0, true = 1

void WYZpause();  // Pause song playback

void WYZresume(); // Resume song playback



void WYZplayFX(char numSound); //Play FX



// mute functions, 0=off, other=on
//void muteChannelA(char value);
//void muteChannelB(char value);
//void muteChannelC(char value);
//void muteChannelFX(char value);


#endif