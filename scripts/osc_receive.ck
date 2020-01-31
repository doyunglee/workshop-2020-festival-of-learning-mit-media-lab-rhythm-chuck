// (launch with OSC_send.ck)
// // example adapted from
// https://learn.adafruit.com/raspberry-pi-open-sound-control/setting-up-your-workstation

// create our OSC receiver
OscRecv recv;
// use port 6449
6449 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/sndbuf/buf/rate, f" ) @=> OscEvent oe;

// infinite event loop
while ( true )
{
    // wait for event to arrive
    oe => now;
    
    // grab the next message from the queue. 
    while ( oe.nextMsg() != 0 )
    {
        // print
        <<< "got (via OSC):", oe.getFloat() >>>;
    }
}
