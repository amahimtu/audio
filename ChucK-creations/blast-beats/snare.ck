<<<"Author: Akshay Mahimtura">>>;

//snare.ck
//sound chain
SndBuf snare => dac;
me.dir(-1) + "audio/snare_01.wav" => snare.read; 
0.5=>snare.gain; //gain
Math.random2f(0.8,1.1)=>snare.rate;

//create BPM object
BPM tempo; //see BPM.ck

while (1)
{
    tempo.sixteenthNote => dur sixteenth; //see BPM.ck
    
    //play a loop 
    for (0=>int beat; beat < 16; beat ++)
    {
        0=>snare.pos; //start at 0 so sample is quiet
        sixteenth => now;
    }
}
