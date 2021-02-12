
// Tabla de instrumentos
const unsigned int TABLA_PAUTAS[]={0,(unsigned int) PAUTA_1,(unsigned int) PAUTA_2,(unsigned int) PAUTA_3,(unsigned int) PAUTA_4,(unsigned int) PAUTA_5,(unsigned int) PAUTA_6,(unsigned int) PAUTA_7,(unsigned int) PAUTA_8};

// Tabla de efectos
const unsigned int TABLA_SONIDOS[]={(unsigned int) SONIDO0,(unsigned int) SONIDO1,(unsigned int) SONIDO2,(unsigned int) SONIDO3};

//Pautas (instrumentos)
//Instrumento 'piano'
const signed char PAUTA_1[]={77,0,13,2,13,4,12,2,12,0,11,-2,10,-4,9,-2,8,0,7,2,7,4,6,2,6,0,6,-2,5,-4,5,-2,5,0,5,2,5,4,5,2,5,0,5,-2,5,-4,5,-2,136};
//Instrumento 'Bass'
const signed char PAUTA_2[]={47,0,15,0,13,0,11,0,8,0,129};
//Instrumento 'MegaBass'
const signed char PAUTA_3[]={45,0,13,0,12,0,75,0,10,2,10,4,10,6,10,8,10,6,10,4,10,2,10,0,10,-2,10,-4,10,-6,10,-8,10,-6,10,-4,10,-2,10,0,144};
//Instrumento 'miniBass'
const signed char PAUTA_4[]={44,0,11,0,11,0,10,0,9,4,9,8,9,4,9,0,9,-4,9,-8,9,-4,9,0,136};
//Instrumento 'Note4'
const signed char PAUTA_5[]={4,0,4,0,4,0,4,0,4,0,133};
//Instrumento 'Note6'
const signed char PAUTA_6[]={6,0,6,0,6,0,6,0,6,0,133};
//Instrumento 'Note8'
const signed char PAUTA_7[]={8,0,8,0,8,0,8,0,8,0,133};
//Instrumento 'Note9'
const signed char PAUTA_8[]={9,0,9,0,9,0,9,0,9,0,133};

//Efectos
//Efecto 'bass drum'
const char SONIDO0[]={232,63,0,15,124,0,255};
//Efecto 'snare'
const char SONIDO1[]={188,47,0,0,12,4,255};
//Efecto 'hithat'
const char SONIDO2[]={0,10,1,255};
//Efecto 'LongSnare'
const char SONIDO3[]={188,47,0,188,44,1,188,45,1,188,43,1,188,44,1,188,42,1,188,43,1,188,41,1,188,42,1,188,40,1,188,41,1,188,39,1,188,40,1,188,38,1,188,39,1,188,37,1,188,38,1,188,36,1,188,37,1,188,35,1,188,36,1,188,34,1,188,35,1,188,33,1,255};


//Frecuencias para las notas
const unsigned int DATOS_NOTAS[]={0,0,
1711,1614,1524,1438,1358,1281,1210,1142,1078,1017,
960,906,855,807,762,719,679,641,605,571,
539,509,480,453,428,404,381,360,339,320,
302,285,269,254,240,227,214,202,190,180,
170,160,151,143,135,127,120,113,107,101,
95,90,85,80,76,71,67,64,60,57};