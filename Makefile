start_fft:
	./bin/fourier
compile_fft:
	g++ fourier_transform/* -o bin/fourier -lm -std=c++11 -I headers/
start_vad:
	./bin/vad
compile_vad:
	g++ trim/* -o bin/vad -std=c++11