// Listing 6.4 Simple clarinet synthesis with Envelope applied to SqrOsc

// Simple Clarinet Synthesis

// Envelope applied to SqrOsc
SqrOsc clar => ADSR env => dac; // (1) Square wave mimics Clarinet waveform.

// initial note frequency (musical A)
55.0 => clar.freq;                  // (2) Sets initial pitch.

// Setup ADSR
env.set(0.1 :: second, 0.1 :: second, 0.5, 0.2 :: second);

// play up the overtone series
while (clar.freq() < 441.0)         // (3) Loops over three octaves of pitches.
{
    // trigger envelope
    1 => env.keyOn;                 // (4) Envelope.keyOn starts note.

    // hang out a bit
    0.2 :: second => now;

    // tell envelope to ramp down
    1 => env.keyOff;               // (5) Envelope.keyOff ends note.

    // hang out some more
    0.2 :: second => now;

    // next note up the overtone series
    clar.freq() + 55.0 => clar.freq; // (6) Increases pitch, climbing up harmonic series.
}
