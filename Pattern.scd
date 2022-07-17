// Pattern in Sclang

// \degree says scale
// Note Middle C, which can vary by changing the number from negative to positive
Pbind(\degree,0).play;

// \dur specify duration in seconds
Pbind(\degree,0,\dur,0.5).play;

// \Pseq(list of items,number of repetitions)
Pbind(\degree,Pseq([0,1,2,3,4,5,6,7],2),\dur,0.5).play;

// More Complex Duration Controls
// The second Pseq doesn't mean the sequence play indefinitely. It stops after the other one repeated 5 times
// provide sequences of different sizes like this, Pbind simply cycles through them as needed.
Pbind(\degree,Pseq([0,1,2,3,4,5,6,7],5),\dur,Pseq([0.2,0.1,0.1,0.2,0.2,0.35],1)).play;

// More readable code
(
Pbind(
	\degree,Pseq([0,1,2,3,4,5,6,7],5),
	\dur,Pseq([0.2,0.1,0.1,0.2,0.2,0.35],inf)
).play;
)

(
Pbind(
	\degree,Pseq([0,-1,2,-3,4,-3,7,11,4,2,0,-3],5),
	\dur,0.2,
	\amp,Pseq([0.7,0.5,0.3,0.2],inf),
	\legato,0.8
).play;
)

// Specifying Pitch
(
Pbind(\degree,5).play;
Pbind(\note,9).play;
Pbind(\midinote,69).play;
Pbind(\freq,440).play;
)

// Some Randomness
// Randomness from the list
(
Pbind(
	\degree,Prand([1,2,3,4,5,6],inf),
	\dur,0.15,
	\amp,0.2,
	\legato,0.1
).trace.play;
)

// Trace before play prints out argument for each sequence
// Randomness from the range but only integers
// For floatings write Pwhite(100,500.0)
(
Pbind(
	\freq,Pwhite(100,500),
	\dur,Prand([0.15,0.25,0.3],inf),
	\amp,0.2,
	\legato,0.3
).trace.play;
)

// Comparison
// 32 events
(
Pbind(
\note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], 4),
\dur, 0.15
).trace.play;
)
// 4 events
(
Pbind(
\note, Prand([0, 2, 3, 5, 7, 8, 11, 12], 4),
\dur,0.15
).trace.play;
)
// 32 events
(
Pbind(
\note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], 4),
\dur,Pwhite(0.15,0.5)
).trace.play;
)

// Pattern Vocabulary Expansion
(
Pbind(
	\note, Pser([0,2,3,5,7,8,11,12],11),
	\dur,0.15;
).trace.play;
)
// Like Prand but not generate same in a row
(
Pbind(
	\note, Pxrand([0,2,3,5,7,8,11,12],inf),
	\dur,0.15;
).trace.play;
)

(
Pbind(
	\note,Pseries(0,2,15),
	\dur,0.15
).trace.play;
)

(
Pbind(
	\note, Pseq([0,2,3,5,7,8,11,12],inf),
	\dur,Pgeom(0.1,1.1,25);
).trace.play;
)

(
Pbind(
	\note,Pseq([0,Pn(2,3),3,Pn(5,3),7,Pn(8,3),11,12],1),
	\dur,0.15
).trace.play;
)


// Chord and strum
(
Pbind(
	\note,Pseq([[2,5,8]],inf),
	\dur,0.15
).trace.play;
)

(
Pbind(
	\note,Pseq([[-7,3,7,10],[0,3,5,8]],2),
	\dur,1,
	\legato,0.4,
	\strum,0.5
).play;
)

// Scales
(
Pbind(
	\scale,Scale.harmonicMinor,
	\degree,Pseq([0,1,2,3,3.1],inf),
	\dur,0.15,
).trace.play
)

// Transposition
(
Pbind(
	\note, Pser([0,2,3,5,7,8,11,12],11),
	\ctranspose,12,
	\dur,0.15
).play;
)

// Tempo
// 120 BPM (beats per minute)
(
Pbind(
	\degree,Pseq([0,0.1,1,2,3,4,5,6,7],11),
	\dur,1
).play(TempoClock(120/60));
)

// Rest
(
Pbind(
	\degree,Pwhite(0,10),
	\dur,Pseq([0.1,0.1,0.3,0.6,Rest(0.3),0.25],inf)
).trace.play;
)

// Playing Pbinds Together
// Without time ordering
(
Pbind(
	\freq,Pn(Pseries(110,111,10)),
	\dur,0.5,
	\legato,Pwhite(0.1,1)
).trace.play;
Pbind(
	\freq,Pn(Pseries(220,222,10)),
	\dur,0.25,
	\legato,Pwhite(0.1,1)
).trace.play;
Pbind(
	\freq,Pn(Pseries(330,333,10)),
	\dur,1/6,
	\legato,Pwhite(0.1,1)
).trace.play;
)
// With time ordering
(
{
	"One thing".postln;
	2.wait;
	"Another thing".postln;
	1.5.wait;
	"Last thing".postln;
}.fork;
)

(
t=TempoClock(76/60);
{
	Pbind(
		\note,Pseq([[4,11],[6,9]],32),
		\dur,1/6,
		\amp,Pseq([0.05,0.03],inf)
	).play(t);
	2.wait;

	Pbind(
		\note,Pseq([[-25,-13,-1],[-20,-8,4],\rest],3),
		\dur,Pseq([1,1,Rest(1)],inf),
		\amp,0.1,
		\legato,Pseq([0.4,0.7,\rest],inf)
	).play(t);
	2.75.wait;

	Pbind(
		\note,Pseq([23, 21, 25, 23, 21, 20, 18, 16, 20, 21, 23, 21],inf),
		\dur,Pseq([0.25, 0.75, 0.25, 1.75, 0.125, 0.125, 0.80, 0.20, 0.125,
                     0.125, 1],1),
		\amp,0.1,
		\legato,0.5
	).play(t);
}.fork(t);
)

// Include Variables in Pbinds
~scale=[0,1,2,3,4,5,6,7];
~dur=[0.4,0.2,0.2,0.4,0.8,0.2,0.2,0.2];
(
Pbind(
	\degree,Pseq(~scale),
	\dur,Pseq(~dur)
).play;
Pbind(
	\degree,Pseq(~scale.reverse+7),
	\dur,Pseq(~dur)
).play;
)

// Pbind as a musical score
~note=[57,62,64,65,67,69];
(
p=Pbind(
	\midinote,Pseq(~note,inf),
	\dur,1/7
);
)
// p.stop won't work-->p stands for score, not the player
~myplayer=p.play;
~myplayer.stop;
currentEnvironment;

// Wrapped up example
(
var myDurs=Pseq([Pn(1,5),3,Pn(1,5),3,Pn(1,6),1/2,1/2,1,1,3,1,3],inf)*0.4;
~upperMelody=Pbind(
	\midinote,Pseq([69,74,76,77,79,81,Pseq([81,79,81,82,79,81],2),82,81,79,77,76,74,74],inf),
	\dur,myDurs
);
~lowerMelody=Pbind(
	\midinote,Pseq([57, 62, 61, 60, 59, 58, 57, 55, 53, 52, 50, 49, 50, 52, 50,
                55, 53, 52, 53, 55, 57, 58, 61, 62, 62],inf),
	\dur,myDurs
);
)
(
~player1=~upperMelody.play;
~player2=~lowerMelody.play;
)
~player1.stop;
~player2.stop;
~player1.resume;
~player2.resume;




