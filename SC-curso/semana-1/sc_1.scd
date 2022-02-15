/* Esta sesión cubre:

- descripción general del IDE

- conceptos básicos lenguaje / intérprete

- clases/instancias

- métodos

- código de evaluación

- otros conceptos fundamentales.
*/

{SinOsc.ar(440)!2}.play;


//conceptos básicos lenguaje

//tipos de datos


Integer
4
38
-45


Float

4.6
0.0004
-3.0004
4.0


String

"hello"
"I ' am a SuperCollider user'"

Char

$6
$r

Array

c = [23,4,56,32,1, $y, "string"]
[1,2,3,4]

Symbol //sirven para demoninar cosas y a difertencia de los string no tienen tamaño

\symbol
'symbol'


Boolean

true
false

Function //son útiles para encapsular fragmentos de código, que no necesariamente se va a utilizar de inmediato sino almacenarlos y luego usarlo. Es una forma de modularizar el código. Encaspsulando una pequeña fracción de código dándole un nombre para luego usar.

{34 + 78}


//SC existe como una colección de muchas clases y estas son algunas de ellas, clases básicas llamadas "literales" porque la apariencia de lo que vemos es el dato en sí que representa. Es decir, puede verse literalmente.

//p ej algo más abstracto sería la clase  Window que es la representación abstracta de una vemntana gráfica.

w = Window.new;
w.front;


//en Sc se interactua con los datos psándoles mensajes que se llaman 'metodos'. La sintaxis es añadir'.' al objeto que se le quiera pasar un método, es decir al receptor.

receiver.method;

6.squared;

//sintaxis alternativa de metodo es:
method(receiver)


squared(6);


//para correr el fragmento de código de una línea teclea shift-enter




//esto, lo hasta aquí visto es lo más básico de trabajar con datos en SC

//tenemos datos que existen como instancias de clases de objetos y les pasamos métodos para operar o para realizar comportamientos.

//ej de método que se define para el objeto, por tanto se define para todas sus subclases es el método 'class'..por lo que si decimos '4.class'' nos devolverá la consola que es un entero etc...

3.class
4.5.class

\symbol.class
class(\symbol)



//una clase es una especie de representacion global de algún objeto y una instancia concreta  es un tipo especial de esa clase


///////////

//operadores

suma 1+2
resta 2-1
multiplicación
2*3
potencia
2**2
división
1/2

//otros métodos
3.squared;
6.009.round;

//algunos métodos no funcionan sólos como los que acabamos de ver y necesitan información adicional

3.pow(2); //potencia de 2
pow(2,3);

-4.abs;

400/100
400.3.div(100)//div solo toma la parte entera del resultado

div(400.3,100)



500.mod(100)//da como resultado el reso
345.mod(3.4)
mod(345,3.4)
3.cubed;
//strings

"helo world".size;

"helo world".reverse;

"helo world".scramble;

"helo world" ++ "good bye world";




//aclarar que algunos  métodos son específicos para un tipo de datos

"dato".reverse;
234.reverse;//dará como resultado un 'ERROR: Message 'reverse' not understood.'
//consultar errores en la 'postwindow'

//hablar sobre variables




value = 9;
value = value*2;
value = value + 1;

value

//estas declaraciones deveulven errores porque no está declarada el tipò de variable

//variable local
var value; //solo tienen alcance dentro de la evaluación, la evaluación del código del cual forman parte.
//lo que tenemos que hacer es correr elbloque de código todo junto. Seleccionandolo y luego tecla shift+enter y nios dara el resultado deseado
var value;
value = 9;
value = value*2;
value = value + 1;

//pero la manera más correcta de correr un bloque de código es encerrandolo entre paréntesis

(
var value;
value = 9;
value = value*2;
value = value+1;
);

//para correr este código simplemente poner elcursor en algún lugar dentro del bloque y pulsar enter

//alternativamente si deseamos una variable de alcance global tenemos dos opciones

(
~value = 90;
~value = ~value*2;
~value = ~value -1;


)

~value

variable

//otra opcion es usar un único caracter minúscula p ej

(
c = 9;
c = c*4;
c = c-3;
)

c

//reglas para los nombres de variables no puede empezar por mayuscula
~Casa =3 //error
//Hay que empezar con letra minúscula y luego serán válidas las letras mayusculas, guión bajo, números

~s34=3
~s_34=3
//etc..

//cuando utiklicemos letras minusculas como variables globales evitar el uso de "s" esta asignada al servidor por defecto

//operadores comparativos


2 > 1;

2 < 1;

2 == 2;

3>=2;
3<=4;



//para busqueda en el navegador de ayuda seleccionar la palabra y cmd + d

//estructuras de control
if//estructura booleana

(
x = 10.rand.postln;//postln imprime en la consola
if(
	x> 5,
	{"greater than 5"},
	{"not greater than 5"}
)
)

//prioridad de operadores

6*5+3;
2+4*5;

//opera de izquierda a derecha pero podemos recurrir a paréntesis para agrupar los datos

6* (5+3);
2+ (4*5;)

//operador && = "y"



(
x = 10.rand.postln;//postln imprime en la consola
y = 10.rand.postln;
if(
	(x>5) && (y>5),
	{"both grater 5"},
	{"not both greater than 5"}
)
)

// operador || = "o"
(
x = 10.rand.postln;//postln imprime en la consola
y = 10.rand.postln;
if(
	(x>5) || (y>5),
	{"at least one grater"},
	{"neither greater than 5"}
)
)


//las funciones se escriben dentro de llaves {}
(
~func = {
	var val;
	val = 5;
	val = val + 5;
}

)

~func.value;

//La funcio del "arg"  es ligeramente diferente a la de la "var"nos permite ingresar un valor en esta funcion



(
~func = {
	arg input;
	var output;
	output = input +2 ;

}

)

//Se adjunta en la carpeta ejercicios

//final de la sesión





