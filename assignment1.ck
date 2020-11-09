//sound network

SinOsc s=> dac;
SawOsc t=> dac;
SqrOsc u=> dac;

//first sound
0.5 => s.gain;
0=>t.gain;
0=>u.gain;

for (0=> int i; i<=400; i++){
    i=>s.freq;
    .01::second=>now;
}

//second sound
0=>s.gain;
0=>t.gain;
0.3=>u.gain;

for (300=>int i; i>=0; i--){
    i=>u.freq;
    .011::second=>now;
}

//third sound
0=>s.gain;
0.3=>t.gain;
0=>u.gain;

for (250=>int i; i>=20; i--){
    i=>t.freq;
    .01::second=>now;
}

//setting time 'later' (10 second)
now + 10::second=> time later;

//setting gain for this part of composition
0.4=>s.gain;
0=>t.gain;
0.2 =>u.gain;

//making this loop play for 10 seconds
//how to set seed to get same set of randomly generated sounds every time: Math.srandom(150);

while (now<later){
    Math.random2f(30,1000)=>s.freq;
    
    0.1::second=>now;
    Math.random2f(20,80)=>u.freq;
}

//setting time 'much_later'
now + 10::second=> time much_later;

//setting gain for next part
0.2=>s.gain;
0.2=>t.gain;
0=>u.gain;

//another 10 seconds, another 2 loops

while (now<much_later){
    for(60=>int i; i<=127; i++){
        Std.mtof(i)=>float Hz;
        <<<i,Hz>>>;
        Hz=>s.freq;
        Math.random2f(25,65)=>t.freq;
        100::ms=>now;
        
    }
    for(127=>int i; i>=60; i--){
        Std.mtof(i)=>float Hz;
        <<<i,Hz>>>;
        Hz=>t.freq;
        Math.random2f(25,65)=>s.freq;
        100::ms=>now;
    }
}
    