<<<"Author: Akshay Mahimtura">>>;

//raga jam — Dhanasri mode

//sound chain for sitar
Sitar sitar=> Gain sitarGain => Gain master=> dac;
sitarGain => Gain sitarFeedback => Delay delay => sitarGain; //feedback loop

//drums
Shakers shaker=> Pan2 p => master;

//oscillator
TriOsc s => ADSR env => master; //chuck TriOsc to ADSR envelope
(0.9::second, 0.3::second, 0.5, 0.76::second)=>env.set; //ADSR set

//drone
VoicForm singerDrones[4];
NRev droneRev=> master;
for (0=> int i; i<singerDrones.cap(); i++)
{
    singerDrones[i]=>droneRev;
    (0.3/singerDrones.cap())=>singerDrones[i].gain;
}

//global variables
[60,61,76,66,79,68,71,72] @=> int raga[]; //Dhanasri melodic mode (Mela)
[23,47,62,51] @=> int drones[];

//timing parameter
0.1=> float beattime;

//sitar feedback parameters
beattime::second=>delay.max;
beattime::second=>delay.delay;
0.6=>sitarFeedback.gain;

//singer/drone parameters
0.25=>droneRev.mix;
for (0 => int i; i<singerDrones.cap(); i++)
{
    0.03=>singerDrones[i].vibratoGain;
    "lll"=>singerDrones[i].phoneme;
    Std.mtof(drones[i]) =>singerDrones[i].freq;
}

//MAIN PROGRAM

//5-second intro 
now+5::second=>time later;

//TriOsc loop
while (now<later){
    for (0=>int i; i<raga.cap(); i++)
    {
        Std.mtof(raga[Math.random2(0,raga.cap()-1)]) => s.freq;
        1=>env.keyOn;
        beattime::second=>now;
        1=>env.keyOff;
        0.3=>s.gain;
    }
    
    //drone 
    for (0 => int i; i<singerDrones.cap(); i++)
    {
        0.04=>singerDrones[i].vibratoGain;
        "lll"=>singerDrones[i].phoneme;
        Std.mtof(drones[i]) =>singerDrones[i].freq;
    }
    
}
//main loop
now+15::second=>time muchlater;

//time variation
Math.random2(1,3)=>int factor; //to multiply beattime

while (now<muchlater)
{
    
    0=>s.gain; //silence TriOsc
    
    for (0=>int i; i<raga.cap(); i++)
    {
        //sitar control
        Std.mtof(raga[Math.random2(0,raga.cap()-1)]) => sitar.freq;
        sitar.noteOn(Math.randomf());
        
        //drum control
        0.53=>p.pan; //panning
        Math.random2(15,12)=>shaker.preset;
        Math.random2f(51,120)=>shaker.objects;
        Math.random2f(0.5,0.99)=>shaker.decay;
        shaker.noteOn(Math.random2f(0,3.8));
        
        //advance time
        beattime::second*factor=>now;
    }
}

now+7::second=>time vlate; //outro; no percussion

while (now<vlate)
{
    //turning off drone(s)
    for (0 => int i; i<singerDrones.cap(); i++)
    {
        0=>singerDrones[i].quiet;
    }
    
    PitShift pit => master; //applying PitShift 
    //time variation
    Math.random2(1,4)=>int factor; //to multiply beattime
    0=>s.gain; //silence TriOsc
    
    0.95=>pit.mix; //pitch mix
    1.46=>pit.shift; //pitch shift up
    
    for (0=>int i; i<raga.cap(); i++)
    {
        //sitar control
        Std.mtof(raga[Math.random2(0,raga.cap()-1)]) => sitar.freq;
        sitar.noteOn(Math.randomf());
        
        //advance time
        beattime::second*factor=>now;
    }
}
