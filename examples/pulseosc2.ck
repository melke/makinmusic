// Listing 6.3 Sci-fi techno dance bass line using the PulseOsc UGen

//PulsOsc for techno-bass, by ChucK Programmer, 2014
PulseOsc p => dac; // connect a new PulseOsc to dac

0.01 => float width;

// infinite loop of sci-fi techno!
while (true)
{
    if (width > 0.8) {
        0.01 => width;
    }
    
    width + 0.03 => width;
    width => p.width; // random pulse width
    if (Math.random2(0,1)) {
        84.0 => p.freq;
    } else {
        100.0 => p.freq;
    }

    1 => p.gain;                        // turn on oscillator
    0.06 :: second => now;              // hang out a bit

    0.0 => p.gain;                      // turn off oscillator
    0.04 :: second => now;              // hang out a bit
}
