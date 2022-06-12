2>3
2>= 34
2>=2

(
if(
	[0,1].choose == 0,
	{"0 es elegido".postln;},
	{"1 fue elegido".postln;}
);
)


(
~func = {
	arg input;
	if(
		input < 5,
		{"sine".postln;},
		{"noise".postln;}

	)
}
)

~func.value(2);


(
var i, x, z;
z = [0, 1, 1.1, 1.3, 1.5, 2];
i = z.choose;
x = case
    { i == 1 }   { \no }
    { i == 1.1 } { \wrong }
    { i == 1.3 } { \wrong }
    { i == 1.5 } { \wrong }
    { i == 2 }   { \wrong }
    { i == 0 }   { \true };
x.postln;
)


(
~func = {
	arg input;
	case

	    {input < 0}	{"sine".postln;}
	   {input > 10}	{"noise".postln;}
	           {true} 		{"sawtooth".postln;};


}
)

~func.value(6);



rrand(10,30 )
exprand(30,40).asInteger.neg
exprand(1,100).round
exprand(30,40)


exprand(-4,-100)


s.boot;

x = {PinkNoise.ar(0.4)!2};
x.play;



(
~mySound ={
	|freq = 400|
	var sig;
	sig = SinOsc.ar(freq,0, 0.02, 0); //metodo de llamada asistente Mayu-cmd-space bar
	sig = [sig, sig]

};
)

~mySound.plot(0.015);

x = ~mySound.play(args:[\freq,440]);
x.set(\freq,220);
x.set(\freq,120);
x.free;


"hello world".dup(4)

(
~mySound ={
	|freq = 400|
	var sig;
	sig = SinOsc.ar(freq,0, 0.2, 0)!2; //metodo de llamada asistente Mayu-cmd-space bar
	sig = sig + SinOsc.ar(freq*2,0,0.2,0);
	sig = sig * 0.01;

}.play;
)


x = ~mySound.play(args:[\freq]);


(
~mySound ={
	|freq = 400|
	var sig, mod;
	sig = WhiteNoise.ar(0.1);
	mod = SinOsc.ar(0.2).range(0.1,0.7).poll;
	sig = sig * mod;
	sig!2;
}.play;
)


(
~mySound ={
	|freq = 400|
	var sig, mod;
	sig = WhiteNoise.ar(0.1);
	mod = LFPulse.ar(0.2).range(0.1,0.7);
	sig = sig * mod;
	sig!2;
}.play;
)


(
~mySound ={
	|freq = 400|
	var sig, mod;
	sig = WhiteNoise.ar(0.1);
	mod = LFPulse.ar(8).range(0.1,0.7);
	sig = sig * mod;
	sig!2;
}.play;
)

//syth and synthdef

(
~fn = {
	arg freq = 200 , offset= 2, lpf=1500, amp=0.2;
	var sig;
	sig = Saw.ar(freq + [0, offset]);
	sig = LPF.ar(sig, lpf);
	sig = sig * amp;
};
)
x = ~fn.play(args: [\freq,150]);
x.free;

(
SynthDef.new(\saw, {

	arg freq = 200 ,offset= 2, lpf=1500, amp=0.2, out=0;
	var sig;
	sig = Saw.ar(freq+ [0, offset]);
	sig = LPF.ar(sig, lpf);
	sig = sig * amp;
	Out.ar(out,sig);
}).add;
)


x = Synth.new(\saw, [\freq, 150, \lpf, 3000]);
x.free;


--------------------------------------------------------

//Envelopes

(
e = Env.new(
	[0,1,0.5,0.5,0],
	[1,1,2,1],
	[0,0,0,0]
)
)

(
~e1 = Env.new(
	[0,1,0.5,0.5,0],
	[1,1,2,1],
	[1,2,-2,0]
)
)
e.plot;
~e1.plot;


Window.closeAll;


//Implementación de envelope en un Synthdef

(
SynthDef.new(\saw, {

	arg freq = 200 ,offset= 2, lpf=1500, amp=0.2, out=0;
	var sig, env;
	env = EnvGen.ar(
		Env.new(
	[0,1,0.5,0.5,0],
	[1,1,2,1],
	[1,-2,0,-3]
),
		doneAction:2;
	);
	sig = Saw.ar(freq+ [0, offset]);
	sig = LPF.ar(sig, lpf);
	sig = sig * amp;
	sig = sig * env;
	Out.ar(out,sig);
}).add;
)

x = Synth.new(\saw, [\freq, 80, \lpf, 3000]);
x.free;

(
SynthDef.new(\saw, {

	arg freq = 200 ,offset= 2, lpf=1500, amp=0.2, out=0;
	var sig, env;
	env = Line.ar(1,0.01,2, doneAction:2)-0.01;
	sig = Saw.ar(freq+ [0, offset]);
	sig = LPF.ar(sig, lpf);
	sig = sig * amp;
	sig = sig * env;
	Out.ar(out,sig);
}).add;
)


(
SynthDef.new(\saw, {

	arg freq = 200 ,offset= 2, lpf=1500, amp=0.2, out=0;
	var sig, env;
	env = XLine.ar(1,0.01,2, doneAction:2)-0.01;
	sig = Saw.ar(freq+ [0, offset]);
	sig = LPF.ar(sig, lpf);
	sig = sig * amp;
	sig = sig * env;
	Out.ar(out,sig);
}).add;
)


(
SynthDef.new(\saw, {

	arg freq = 200 ,offset= 2, lpf=1500, amp=0.2, out=0, gate=1;
	var sig, env;
	env = EnvGen.ar(
		Env.new(
	[0,1,0.5,0],
	[1,1,1],
	[1,-2,-3],
			2

),
		gate,
		doneAction:2;
	);
	sig = Saw.ar(freq+ [0, offset]);
	sig = LPF.ar(sig, lpf);
	sig = sig * amp;
	sig = sig * env;
	Out.ar(out,sig);
}).add;
)

x = Synth.new(\saw, [\freq, 80, \lpf, 3000]);
x.set(\gate,0);

------------------------------------
//Hacer un acorde--Matrices

x = [];
(
x= x.add(x = Synth.new(\saw, [\freq, 45.midicps, \lpf, 3000,\amp,0.05]));
x= x.add(x = Synth.new(\saw, [\freq, 55.midicps, \lpf, 3000,\amp,0.05]));
x= x.add(x = Synth.new(\saw, [\freq, 59.midicps, \lpf, 3000,\amp,0.05]));
x= x.add(x = Synth.new(\saw, [\freq, 61.midicps, \lpf, 3000,\amp,0.05]));
x= x.add(x = Synth.new(\saw, [\freq, 62.midicps, \lpf, 3000,\amp,0.05]));
)

x[0].set(\gate,0);
x[1].set(\gate,0);
x[2].set(\gate,0);
x[3].set(\gate,0);
x[4].set(\gate,0);
x[5].set(\gate,0);

------------------------
//Iteracion
(
x = [34,45,56,67,78].collect({
	arg n;
	100+n;
	n.cubed;
})

)
x

Synth.new(\saw, [\freq, 45.midicps, \lpf, 3000,\amp,0.05])

(
~notes = [34,45,56,67,78];
~synth = ~notes.collect({
	arg n;

Synth.new(\saw, [\freq, n.midicps, \lpf, 3000,\amp,0.05]);
})

)

(
~synth.collect({
	arg n;
	n.set(\gate,0);
})
)
----------------------------

(
~synth.do({
	arg n;
	n.set(\gate,0);
})
)

(

(0..59).do({
	arg n,i;
	[i,"Hello W".postln];
});
)
(
(0..59).collect({
	arg n,i;
	[i,"Hello W".postln];
});
)





//TASAS DE CONTROL .ar .kr y .ir
(
f = {
	var sig;
	sig = [SinOsc.ar(320),
	SinOsc.kr(320)];
	sig = sig * 0.5;

}.plot(0.03);
)

(
f = {
	var sig;
	sig = SinOsc.kr(320);
	sig = sig * 0.5;

}.plot(0.03);
)

f.plot(0.03);

s.sampleRate;
s.options.blockSize/s.sampleRate;


(
f = {
	var sig, mod, modhz;
	modhz= MouseY.kr(1,4000,1);
	mod = SinOsc.ar(1).bipolar(400);//La señal fluctua entre 100 (500-400) y 900 (500+400)
	sig = SinOsc.ar(500+ mod);

	sig = sig * 0.15;

}.play;
)

//Filtros
(
f = {
	var sig;
	sig = Saw.ar([40,40.5]);
	sig = sig* 0.2;
}.play;


)

FreqScope.new;

(
f = {
	var sig;
	sig = Saw.ar([40,40.5]);
	sig = LPF.ar(sig, 10000);
	sig = sig * 0.2;
}.play;


)


















