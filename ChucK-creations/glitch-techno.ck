<<<"Author: Akshay Mahimtura">>>;
//sound chain
Gain master=>dac; //master gain
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;
SndBuf cowbell => Pan2 p => master;
SinOsc k => master;

//array declaration
[41,40,33,38] @=> int A[]; //A-Minor MIDI note numbers


//load sound files into SndBuf
me.dir() + "audio/kick_05.wav" => kick.read;
me.dir() + "audio/hihat_02.wav" => hihat.read;
me.dir() + "audio/snare_03.wav" => snare.read;
me.dir() + "audio/cowbell_01.wav" => cowbell.read;

//set all playheads to end so no sound is made
kick.samples()=>kick.pos;
hihat.samples()=>hihat.pos;
snare.samples()=>snare.pos;
cowbell.samples()=>cowbell.pos;
0=>k.gain; //k is 0 volume


//setting time 'later'
now + 30::second=>time later;

//initialize counter variable
0=>int counter;


//loop
while (now<later)
{
    //Sine Wave (bassline)
    for (0=>int i; i<A.cap(); i++){
        <<<i,A[i]>>>; //print index and value
        Std.mtof(A[i]) => k.freq; // MIDI to frequency
        0.4=>k.gain; //setting gain
    }

    //beat goes from 0 to 7 (8 positions)
    counter%8=>int beat;
    
    //bass drum on 0 and 4
    if ((beat == 0) || (beat==4)) {
        0=>kick.pos;
        1=>kick.gain;
    }
    
    //hihat
    1=>hihat.pos;
    Math.random2f(-0.5,1.3)=>hihat.rate; //manipulating hi-hat rate
    
    //snare drum on 4
    if (beat==4)
    {
        0=>snare.pos;
        Math.random2f(0.1,0.3)=>snare.rate; //manipulating snare rate
    }
    
    //cowbell on 2
    if (beat==2)
    {
        0=>cowbell.pos;
        Math.random2f(0.5,1.75)=>cowbell.rate; //manipulating cowbell rate
        Math.random2f(-0.8,0.8)=>p.pan; //set panning
    }    
   
   
    <<<"Counter:",counter,"Beat:",beat>>>; //counting beats
    counter++; //counter + 1
    0.1::second=>now;  //advance time
    
}    
