<<<"Author: Akshay Mahimtura">>>;
//score.ck

//paths to chuck files
me.dir() + "/stif.ck"=>string stifPath;
me.dir() + "/drums.ck"=>string drumsPath;
me.dir() + "/modalbar.ck"=>string modalPath;
me.dir() + "/synth.ck"=>string synthPath;

//start stif 
Machine.add(stifPath)=>int stifID;
5.4::second=>now;

//start drums
Machine.add(drumsPath)=>int drumsID;
4.8::second=>now;

//start modal & bass
Machine.add(modalPath)=>int modalID;
Machine.add(synthPath)=>int synthID;
20.4::second=>now;

//remove synth
Machine.remove(synthID);
5.4::second=>now;

//remove drums
Machine.remove(drumsID);
5.4::second=>now;

//add drums & synth again
Machine.add(drumsPath)=>drumsID;
Machine.add(synthPath)=>synthID;
5.4::second=>now;

//score.ck