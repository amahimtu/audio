<<<"Author: Akshay Mahimtura">>>;

//kalimba.ck

SndBuf kal => dac;
me.dir(-1) + "audio/kalimba.wav" => kal.read;

BPM tempo; //calling class

while (true)
{
    tempo.thirtysecondNote => dur thirtysecond;
    
    for (0=>int beat; beat < 32; beat++)
    {
        if (beat==28)
        {
            0=>kal.pos; //playhead at start position so no sound
        }
        thirtysecond => now;
    }
}
    
