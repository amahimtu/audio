<<<"Author: Akshay Mahimtura">>>;

//score.ck
//"On the fly drumming with global BPM conducting"

BPM tempo;
tempo.tempo(100);

//section1

Machine.add(me.dir() + "kick.ck") => int kickID;
4.0 * tempo.quarterNote => now;

Machine.add(me.dir() + "snare.ck") => int snareID;
Machine.add(me.dir() + "hihat.ck") => int hihatID;
8.0 * tempo.quarterNote => now;

Machine.remove(snareID);
Machine.add(me.dir() + "snare2.ck") => int snare2ID;
4.0 * tempo.quarterNote => now;

Machine.remove(kickID);
Machine.add(me.dir() + "kick2.ck") => int kick2ID;
Machine.remove(snare2ID);
Machine.add(me.dir() + "snare.ck") => snareID;
4.0 * tempo.quarterNote=>now;

Machine.remove(hihatID);
Machine.add(me.dir() + "ride.ck") => int rideID;
4.0 * tempo.quarterNote=>now;

//section2

//changing BPM to 80
80 => float newtempo;
tempo.tempo(newtempo);
<<<"tempo: ", newtempo>>>;

Machine.remove(kick2ID);
Machine.remove(rideID);
Machine.remove(snareID);

Machine.add(me.dir() + "kick.ck") => kickID;
Machine.add(me.dir() + "clap.ck") => int clapID;
Machine.add(me.dir() + "kalimba.ck") => int kalID;

8.0 * tempo.quarterNote=>now; 

//section3

//BPM back to 100
//changing BPM to 80
100 => newtempo;
tempo.tempo(newtempo);
<<<"tempo: ", newtempo>>>;

Machine.remove(clapID);
Machine.remove(kalID);

Machine.add(me.dir() + "snare2.ck") => snare2ID;
Machine.add(me.dir() + "hihat.ck") => hihatID;

4.0* tempo.quarterNote =>now;

Machine.remove(kickID);
Machine.add(me.dir() + "kick2.ck") => kick2ID;

//section 4

Machine.remove(snare2ID);
Machine.add(me.dir() + "snare.ck") => snareID;

while (newtempo > 55)
{
    newtempo - 25 => newtempo;
    tempo.tempo(newtempo);
    <<<"tempo: ", newtempo>>>;
    8 * tempo.quarterNote => now;
}

Machine.remove(kick2ID);
Machine.remove(hihatID);
Machine.remove(snareID);
