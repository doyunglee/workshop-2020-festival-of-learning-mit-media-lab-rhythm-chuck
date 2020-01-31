// ex06-receive.ck
// example of loading samples
// runs on chuck 1.4.0.0
// written by by aaron montoya-moraga & manaswi mishra
// for mit media lab festival of learning 2020 

// print file name
<<< "ex07-receive.ck" >>>;

// declare Open Sound Control receiver
OscRecv myReceiver;

// declare port 
1440 => myReceiver.port;

// open port
myReceiver.listen();

// declare new OSC events for noteOn
myReceiver.event("/volcaBeats/noteOn") @=> OscEvent noteOn;

// infinite loop
while (true) {
    
    // wait until new event
    noteOn => now;
    
    // grab the next message from the queue.
    while (noteOn.nextMsg() != 0) {
        <<< "received", noteOn.getInt() >>>;
    }
}