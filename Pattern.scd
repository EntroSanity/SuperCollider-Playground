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





