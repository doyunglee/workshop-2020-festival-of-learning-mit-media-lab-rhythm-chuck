// ex06-volca.ck
// example of loading samples
// runs on chuck 1.4.0.0
// written by by aaron montoya-moraga & manaswi mishra
// for mit media lab festival of learning 2020 

// print file name
<<< "ex06-volca.ck" >>>;

// declare new MidiOut variable
MidiOut myOutput;

// declare new midi message
MidiMsg myMsg;

// declare new variable for midi port
// check number on menu:
// window -> device browser -> midi
0 => myPort;

// try to open the midi port, exit if fail
if (!myOutput.open(myPort)) {
    <<< "could not open MIDI port" >>>;
    me.exit();
}

// fill the message with data
// a midi messsage has three bytes
// we will use noteOn messages, where
// byte1: note on message, channel
// byte2: note number
// byte3: note velocity

// in korg volca, we use 

// infinite loop
while (true) {
    
    // iterate through the sequence
    for (0 => int i; i < hihatClosedSequence.cap(); i++) {
        
        // default, all buffers fast forward
        hihatClosed.samples() - 1 => hihatClosed.pos;
        congaLow.samples() - 1 => congaLow.pos;
        clap.samples() - 1 => clap.pos;
        
        // define buffer playback rate
        -1.0 + Std.rand2f(-1.5, -1.0) => hihatClosed.rate;
        0.2 + Std.rand2f(0.2, 0.7) => congaLow.rate;
        -2.0 + Std.rand2f(0.2, 0.6) => clap.rate;        
        
        // define buffer gain
        Std.rand2f(minGain, maxGain) => hihatClosed.gain;
        Std.rand2f(minGain, maxGain) => congaLow.gain;
        0.5 * Std.rand2f(minGain, maxGain) => clap.gain;
        
        // rewind if sequencer is 1
        if (hihatClosedSequence[i] == 1) {
            0 => hihatClosed.pos;
        }
        
        // rewind if sequencer is 1
        if (congaLowSequence[i] == 1) {
            0 => congaLow.pos;
        }
        
        // rewind clap if probability
        if (Std.rand2f(0.0, 1.0) < clapProbability) {
            0 => clap.pos;
        }

        // let time flow
        (timeStep + Std.rand2f(-timeMaxDelta, timeMaxDelta)) :: ms => now;
    }
}