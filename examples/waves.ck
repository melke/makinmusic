// SawOsc
// TriOsc
// SqrOsc

SinOsc t => dac;
0.5 => t.gain; // volym

while (true)
{
    // randomly choose frequency from 30 to 1000
    Math.random2(30,1000) => t.freq;
    
    // randomly choose duration from 30 to 1000 ms
    Math.random2f(30,1000) :: ms => now;
}
