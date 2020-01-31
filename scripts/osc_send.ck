// launch with OSC_recv.ck
// example adapted from
// https://learn.adafruit.com/raspberry-pi-open-sound-control/setting-up-your-workstation

// host name and port
"18.21.142.93" => string hostOSC;
6449 => int portOSC;

// send object
OscSend mySender;

// point to host
mySender.setHost(hostname, port);

// infinite loop
while( true )
{
    // start the message...
    // the type string ',f' expects a single float argument
    mySender.startMsg( "/sndbuf/buf/rate", "f" );
    
    // a message is kicked as soon as it is complete 
    // - type string is satisfied and bundles are closed
    Math.random2f( .5, 2.0 ) => float temp; => mySender.addFloat;
    <<< "sent (via OSC):", temp >>>;
    
    // let time flow
    0.2 :: second => now;
}
