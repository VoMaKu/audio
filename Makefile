WAV ?=
SEGMENT ?= 0.1
THRESHOLD ?= 0.01

start_fft:
	./bin/fourier
compile_fft:
	mkdir -p bin
	g++ fourier_transform/* -o bin/fourier -lm -std=c++11 -I headers/
start_vad:
	@test -n "$(WAV)" || { echo "Set WAV to a 16-bit mono pcm file: make start_vad WAV=speech.wav"; exit 1; }
	./bin/vad $(WAV) $(SEGMENT) $(THRESHOLD)
compile_vad:
	mkdir -p bin
	g++ trim/* -o bin/vad -std=c++11
