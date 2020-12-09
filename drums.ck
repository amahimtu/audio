<<<"Author: Akshay Mahimtura">>>;

//sound chain
SndBuf click => dac;
SndBuf kick => dac;
SndBuf hihat=>dac;
Shakers shak=> Pan2 p => dac;

10=>shak.preset; //27 in total

//open sound files
me.dir(-1) + "audio/kick_02.wav" => kick.read;
me.dir(-1) + "audio/snare_01.wav" => click.read;
me.dir(-1) + "audio/hihat_02.wav" => hihat.read;

//take away initial playback
kick.samples() => kick.pos;
click.samples() => click.pos;
hihat.samples()=>hihat.pos;

//global variables
[1,0,0,0,1,0,0,0] @=> int kick1[];
[0,1,1,0,0,0,1,0] @=> int kick2[];
[0,0,1,0,0,0,1,0] @=> int click1[];
[0,1,1,0,1,0,0,1] @=> int click2[];
[1,1,1,1,1,1,1,1] @=> int hihat1[];
[0,1,0,1,0,1,0,1] @=> int hihat2[];

function void section (int kickArray[], int clickArray[], int hihatArray[],float beattime)
{
    //sequences for bass and snare
    for (0=>int i; i<kickArray.cap(); i++){
        //if 1 in array then play kick
        if (kickArray[i]==1) {
            0=>kick.pos;
            0.5=>kick.gain;
        }
        //if 1 in array then play click
        if (clickArray[i]==1) {
            0=>click.pos;
            0.5=>click.gain;
        }
        //if 1 in array then play hihat
        if (hihatArray[i]==1) {
            0=>hihat.pos;
            Math.random2f(0.1,0.2) => hihat.gain;
        }
        beattime::second=>now;
    }
    //parameters
    Math.random2f(1.1,1.8)=>click.rate;
    Math.random2f(0.1,0.2) => hihat.gain;
    Math.random2f(0.76,1.4) =>hihat.rate;
    0.5=>kick.gain;
    0.5=>click.gain;
}

function void main()
{
    while (true){
        //procedural: ABA' form
        section(kick1,click1,hihat1,0.1);
        section(kick2, click1,hihat2,0.2);
        section(kick1, click1,hihat1,0.3);
    }
}

function void shake(){
    while (true)
    { 
        Math.random2f(56,120)=>shak.objects; //# of objects
        Math.random2f(0.1,0.9)=>shak.decay; //decay
        1=>shak.energy; //turns on; imparts energy
        Math.random2f(-1.0,1.0)=>p.pan; //random panning
        0.2::second=>now;
    }
}

//sporking shreds
spork ~ main(); //sporking child shred for concurrency
spork ~ shake(); //sporking child shred for concurrency

//infinite loop to keep parent shred alive
while (true)
{
    1::second=>now;
}