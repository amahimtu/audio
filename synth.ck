<<<"Author: Akshay Mahimtura">>>;

BeeThree bee => dac; //sound chain

//scale data
[47,49,51,52,54,56,58,59] @=> int scale[]; //B-major

4=>int walkPos; 

//loop
while(true)
{
    Math.random2(-1,1) +=> walkPos; //variable will go either up or down randomly
    if (walkPos < 0)
    {
        1=>walkPos;
    }
    if (walkPos >= scale.cap())
    {
        scale.cap() - 2 => walkPos;
    }
    Std.mtof(scale[walkPos]-24)=>bee.freq; //taking it down 2 octaves since it's bee
   
    
    0.7=>bee.noteOn;
    //wait
    0.2::second=>now;
    1=>bee.noteOff;
    0::second=>now;
}
