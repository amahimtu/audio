//kick2.ck; thirtysecond instead of sixteenth
//sound chain
SndBuf kick2 => dac;
me.dir(-1) + "audio/kick_03.wav" => kick2.read; 

//create BPM object
BPM tempo; //see BPM.ck

Math.random2f(0.8,1.0)=>kick2.gain;

while (1)
{
    tempo.thirtysecondNote => dur thirtysecond; //see BPM.ck
    
    //play a loop 
    for (0=>int beat; beat < 16; beat ++)
    {
        0=>kick2.pos; //start at 0 so sample is quiet
        thirtysecond => now;
    }
}