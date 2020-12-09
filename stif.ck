<<<"Author: Akshay Mahimtura">>>;

StifKarp stif => NRev rev => dac; //sound chain
stif => Delay d => d => Chorus c => c => rev; //feedback loop

//stif parameters
//reverb
0.1=>rev.mix;
0.5::second=>d.max=>d.delay;
0.5=>d.gain;

//chorus
0.2=>c.modFreq;
0.2=>c.modDepth;
0.1=>c.mix;
0.3=>c.gain;

//scale data
[47,49,51,52,54,56,58,59] @=> int scale[]; //B-major

//loop
while(true)
{
    (Math.random2(1,4)*0.2)::second=>now; //timing
    
    //play
    if (Math.random2(0,3)>1) //adds rests
    {
        Math.random2(0,scale.cap()-1)=>int note; //picks random note
        Math.mtof(12 + scale[note]) => stif.freq; //1 octave higher
        Math.random2f(0.5,0.8)=>stif.noteOn; //play level
    }
    else
    {
        1=>stif.noteOff;
    }
}