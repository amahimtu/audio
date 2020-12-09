<<<"Author: Akshay Mahimtura">>>;

//modal bar
ModalBar m=> NRev r=> dac; //rigid system

//scale data
[47,49,51,52,54,56,58,59] @=> int scale[]; //B-major

while (true)
{
    Math.random2(0,8)=>m.preset; //selecting random bars
    Math.random2(0,scale.cap()-1)=>int note; //picks random note
    Math.mtof(12 + scale[note]) => m.freq; //1 octave higher 
    0.12=>r.mix; //reverb wet/dry
    0.7=>m.noteOn; //on
    0.2::second=>now;
}

