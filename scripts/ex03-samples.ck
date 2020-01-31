// ex03-samples.ck
// example of loading samples
// runs on chuck 1.4.0.0
// written by by aaron montoya-moraga & manaswi mishra
// for mit media lab festival of learning 2020 

// print file name
<<< "ex03-samples.ck" >>>;

// print current directory
// tip: it ends with "/" character
<<< me.sourceDir() >>>;

// create string variable for storing samples directory
me.sourceDir() + "/../samples/" => string dirSamples;

// print samples folder
<<< dirSamples >>>;

// create strings for storing samples names
"hihatClosed" => string nameHihatClosed;
"congaLow" => string nameCongaLow;

// create strings for storing file format
".wav" => string fileFormat;

// create buffers for storing samples
SndBuf hihatClosed;
SndBuf congaLow;

// read samples and store in buffers
dirSamples + nameHihatClosed + fileFormat => hihatClosed.read;
dirSamples + nameCongaLow + fileFormat => congaLow.read;

0.5 => hihatClosed.gain;
0.5 => congaLow.gain;

1.0 => hihatClosed.rate;
1.0 => congaLow.rate;

0 => hihatClosed.pos;
0 => congaLow.pos;

100 :: ms => now;
