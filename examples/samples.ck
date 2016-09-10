SndBuf mySound => dac;

// (1) Assembles file path/name and read file into SndBuf.
me.dir()+"../audio/hihat_01.wav" => mySound.read;

// (2) Asks the sound how long it is (in samples).
mySound.samples() => int numSamples;

// Play forward
1.0 => mySound.rate; 

while (true) {
    // Play forward from 0 to end of sample 
    0 => mySound.pos;
    numSamples :: samp => now;
    
    // Some silence
    0.0 => mySound.gain;
    numSamples :: samp /4 => now;
    1.0 => mySound.gain;    
}
