
SinOsc vibrato => SawOsc viol => ADSR env => dac; 

// initial note frequency (musical A)
385.0 => viol.freq;                  // (2) Sets initial pitch.

// Setup ADSR
env.set(0.2 :: second, 0.2 :: second, 0.5, 0.2 :: second);

// Tell the oscillator to interpret input as frequency modulation
2 => viol.sync;

// set vibrato frequency to 6 Hz
6.0 => vibrato.freq;

// play up the overtone series
while (viol.freq() < 800.0)         // (3) Loops over three octaves of pitches.
{
    // trigger envelope
    1 => env.keyOn;                 // (4) Envelope.keyOn starts note.

    // hang out a bit
    1.0 :: second => now;

    // tell envelope to ramp down
    1 => env.keyOff;               // (5) Envelope.keyOff ends note.

    // hang out some more
    0.2 :: second => now;

    // next note up the overtone series
    viol.freq() + 55.0 => viol.freq; // (6) Increases pitch, climbing up harmonic series.
}
