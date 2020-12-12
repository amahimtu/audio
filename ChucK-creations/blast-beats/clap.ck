<<<"Author: Akshay Mahimtura">>>;

//clap.ck 
//sound chain
SndBuf clap => dac;
me.dir(-1) + "audio/clap_01.wav" => clap.read; 

BPM tempo; //create BPM object

while (1)
{
    tempo.eighthNote => dur eighth; //see BPM.ck
    //play a loop 
    for (0=>int beat; beat < 8; beat ++)
    {
        if (Math.random2(0,5)>2)
        {  
            0=>clap.pos; 
        }
        eighth => now;
        
    }
}
