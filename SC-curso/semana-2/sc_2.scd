// Covering the basics of the audio server, UGens, and making sound.

2+3

//Lo primero que vamos a hacer es poner en funcionamiento el servidor

s.boot;

//Lo primero que vemos es la ventana pequeña inferior izquierda con los número verdes que indica que ya está el servidor encendido.
//La ventana postwindow así nos lo indica:
-> localhost
Booting server 'localhost' on address 127.0.0.1:57110.

Server.local.boot;

// y a continuación nos devuelve una lista de los disositivos de audio conectados a nuestra máquina que en mi caso son :

Number of Devices: 2
   0 : "Built-in Microph"
   1 : "Built-in Output"

//Seguramente en
// es importante recordar que el audio digital se representan por números de coma flotante. Especificamente 48000 por segundo y representa una forma de onda que luego se convierte en una sela analógica que se reproducirá a través de los altavoces u auriculares


//Para apagar el servidor

s.quit;

//////////

s.boot;

//Estas dos operaciones se pueden realizar a través de la opción "server" del menú desplegable /Entre "Languege" y ""Help"



// "s" actua como una variable local asignada al servidor, está reservada para la instancia del servidor local. Pero si quisieramos podríamos asignarle cualquier otro nombre. Pero esto no es aconsejable.

//Otra forma de hacer arrancar el servidor es:
Server.local.boot;
Server.local.quit;

// el método "makeWindow" es una representación del servidor en una  ventana

s.makeWindow;

// en esta ventana tendremos acceso a distintas opciones como arrancar o salir del servidor. Grabar. Mutear. Cambiar el volumen. Etc

//Herramiantas útiles del servidor
// "Meter"
s.meter;
//Abre una pequeña ventana donde se representan los medidores de volumen de las entradas y salida. SC asume que tenemos dos canales de salida del hardware, derecho e izquierdo así tb los mismos de entrada.
//Esta app es muy útil pues ayuda a tener siempre controlads ps rangos dinámicos de forma saludable puest que a veces el oído nos depara desagradables sorpresas cuando se dispara el volumen por un error en la codificacion del "mul".Es buena práctica no sólo fiarse de lo que se escucha y tener el medidor abierto para evitar distorsiones y entrecortamientos del sonido deagradables

//otra herramienta es "scope" u osciloscopio, nos permite ver las formas de onda y nos muestra los dos canales de salida
s.scope;

//La siguiente herramienta es FrekScope o analizador de frecuencia
//para que podamos ver el espectro, esto es siempre monofónico y puede que actualmente esté configurado en el bus 0 que es el canal izquierdo.Pero se puede cambiar a 1 si se quiere ver el otro
FreqScope.new;

// Otra herramienta interesante para mencionar es plotTree o nodetree. Es una visualizacion de todos los procesos que se están ejecutando actualmente en scsynth

s.plotTree;


// Empecemos a hacer un poco de sonido. La forma más fácil y rápida de hacerlo en SC es hacer un 'play' a la función (entre llaves visto en el capítulo anterior).

{  }.play;

//Luego en la parte interior lo que hay que hacer es llenarla de lo que se llaman Unidades Generadoras uGe (buscar en el Help Browser con el shortcut shift+cmd+d). Un Ugen es una clase de objetos que se ocupa de las señales de audio, podría generar una señal de audio, podría procesar una señal de audio, etc...Algunos de ellos serían: osciladores, generadores de ruido, filtros, ..
//La mejor manera de imaginar un ugen es pensar en una especie de sintetizador modular analógico enorme donde tenemos osciladores, filtros, etc..
//consultar el archivo essential Ugens.scd

//Vamos a hacer y reproducir uno de forma muy sencilla un SinOsc que rproduce una onda sinusoidal

{SinOsc.ar(434)}.play;













