public class CScale
{
    [0,2,4,5,7,9,11] @=> int scale[];

    fun float freq(int index, int octave) {
        return Std.mtof(scale[index] + octave * 12);
    }
    
    fun float delayInSamps(int index, int octave) {
        return 44100.0 / freq(index, octave);
    }
}
