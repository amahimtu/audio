<<<"Author: Akshay Mahimtura">>>;

//kick.ck
//sound chain
SndBuf kick => dac;
me.dir(-1) + "audio/kick_03.wav" => kick.read; 

//create BPM object
BPM tempo; //see BPM.ck
//tempo will be in score file; i.e, tempo.tempo(100);

Math.random2f(0.8,1.0)=>kick.gain;

while (true)
{
    tempo.sixteenthNote => dur sixteenth; //see BPM.ck
    
    //play a loop 
    for (0=>int beat; beat < 16; beat ++)
    {
        0=>kick.pos; //start at 0 so sample is quiet
        sixteenth => now;
    }
}
