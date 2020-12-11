//hihat.ck
//sound chain
SndBuf hihat => dac;
me.dir(-1) + "audio/hihat_custom1.wav" => hihat.read; 
0.2=>hihat.gain;
Math.random2f(0.8,1.0)=>hihat.rate;

//create BPM object
BPM tempo; //see BPM.ck

while (1)
{
    tempo.eighthNote => dur eighth; //see BPM.ck
    
    //play a loop 
    for (0=>int beat; beat < 8; beat ++)
    {
        0=>hihat.pos; //start at 0 so sample is quiet
        eighth => now;
    }
}
