<<<"Author: Akshay Mahimtura">>>;

//ride.ck
SndBuf ride => dac;
me.dir(-1) + "audio/OS_SCS_Raw_Ride_Single_Hit_17.wav" => ride.read; 

BPM tempo; //calling class

Math.random2f(0.2,1.0)=>ride.gain;

while (1)
{
    tempo.sixteenthNote => dur sixteenth;
   
    for (0=>int beat; beat < 4; beat++)
    {
        if ((beat == 1) || (beat == 3))
        {
            0=>ride.pos; //playhead at start position so no sound
            sixteenth => now;
        }
        else
        {
            ride.samples() => ride.pos;
            sixteenth=>now;
        }
    }
}

