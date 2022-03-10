// Covering the basics of the audio server, UGens, and making sound.

2+3

//Lo primero que vamos a hacer es poner en funcionamiento el servidor

s.boot;

//Lo primero que vemos es la ventana pequeña inferior izquierda con los número verdes que indica que ya está el servidor encendido.
//La ventana postwindow así nos lo indica:
-> localhost
Booting server 'localhost' on address 127.0.0.1:57110.

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

//otra herramienta es "scope"
s.scope;















