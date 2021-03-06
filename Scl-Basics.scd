// No operation precedence - Simply Left to right
3+4*7 // 49
3+(4*7) //31
5+2*2
5+(2*2)
5+2.squared

// Strings and Symbols
a="string";
b="string";
a==b; // Same Contentc -> True
a===b; // Different Location -> False

c='symbol';
d=\symbol;
c==d; // Same Content -> True
c===d; // Same Location -> False

// Global and Local Variables
// Variable names must start with lowercase letters
~envVar=5;
currentEnvironment;
~anotherVar=6;
currentEnvironment;
~envVar * ~anotherVar

c=Pbind(\note,Pwhite(0,10),\dur,0.1);
c.play;

~myFreq=[415,220,440,880,220,990];
~myOurs=[0.1,0.2,0.2,0.5,0.2,0.1];
Pbind(\freq,Pseq(~myFreq),\dur,Pseq(~myOurs)).play;

(
e=5;
f=6;
e+f;
)
e; // Accessible

(
var h=7;
var g=8;
h+g;
)
h; // Not accessible

// Conditionals and Functions
// if (<Boolean expression>, {true function}, {false function})  
~coolfunc={
	arg freq;
	if ((freq>=20) && (freq<=40),
	{(freq.asString+"within easy reach").postln;},
	{(freq.asString+"within difficult reach").postln;}
)
};
~coolfunc.value(35);

// Recursive and Functions
~factorial={
	arg n;
	if(n==0,{1},{n*~factorial.value(n-1)});
};
~factorial.value(4)

// Loops and Functions
// while({<test function>}, {<body function>})
// for(startValue, endValue, {<body function>})
i=0;
while({i<4},{i.postln;i=i+1});

for(3,6,{arg x;x.postln});

// Clean up Post Window
// command+shift+P
100.do({"Print this line over and over...".scramble.postln});

// Record Sounding
// Open with Audicity
s.record;
(Saw.ar(LFNoise0.kr([2,3]).range(100,2000),LFPulse.kr([4,5])*0.1)).play;
s.stopRecording;
s.makeWindow;