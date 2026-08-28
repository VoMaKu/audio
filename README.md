# audio

Two audio-processing exercises from a second-year systems programming course, 2020:

* a discrete Fourier transform and a radix-2 FFT, written from scratch on top of a small
  complex-number class;
* a voice activity detector that measures the energy of a recording segment by segment and
  writes out the parts where somebody is speaking.

Both build with any C++11 compiler.

## Fast Fourier transform

Background reading: [Fast Fourier transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform).

    make compile_fft
    make start_fft

The demo transforms a fixed input, `1 6 2 5 3 4`, three ways and prints all of them.

`f2s` is the direct transform, summed term by term in O(n^2) and scaled by 1/n. `s2f` is its
inverse. `fft` is the recursive radix-2 version: it zero-pads the input to the next power of
two and applies no 1/n factor. That is why the two tables below are scaled differently and
have different lengths — six points against eight.

**Direct transform, `f2s`**

data | number
-----|---------------
s[0] | 3.500 +0.000i
s[1] | -0.250 -0.144i
s[2] | -0.250 -0.433i
s[3] | -1.500 -0.000i
s[4] | -0.250 +0.433i
s[5] | -0.250 +0.144i

**Fast transform, `fft`**

data | number
-----|-----------------
FFT[0] | 21.000 +0.000i
FFT[1] | -4.121 -6.950i
FFT[2] | 2.000 -5.000i
FFT[3] | 0.121 -2.950i
FFT[4] | -9.000 +0.000i
FFT[5] | 0.121 +2.950i
FFT[6] | 2.000 +5.000i
FFT[7] | -4.121 +6.950i

## Voice activity detection

The detector splits a recording into fixed-length segments, computes the RMS energy of each
one, and calls a segment "voice" when that energy exceeds a threshold. Neighbouring voiced
segments are merged into a single interval. It then prints the mask, an energy timeline with
the voiced part highlighted, a table of the intervals it found, and writes each interval to
its own file — `0.wav`, `1.wav`, and so on — in the current directory.

    make compile_vad
    make start_vad WAV=speech.wav

`SEGMENT` (segment length in seconds, default 0.1) and `THRESHOLD` (energy threshold in the
range 0..1, default 0.01) can be overridden the same way:

    make start_vad WAV=speech.wav SEGMENT=0.05 THRESHOLD=0.02

Or call the binary directly:

    ./bin/vad speech.wav 0.1 0.01

### Input format

The reader is deliberately minimal: it expects a canonical 44-byte WAV header followed by
sample data, so the input has to be **16-bit mono PCM**, with no extra chunks between the
header and the audio. Anything else is rejected with a message rather than misread.

The repository ships no `.wav` to run this on. `audio_webm/` holds the clip the program was
tested against in 2020, but it is Opus in a WebM container and has to be converted first:

    ffmpeg -i audio_webm/*.webm -ac 1 -ar 16000 -acodec pcm_s16le speech.wav
