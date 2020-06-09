start_fft:
	./bin/fourier
compile_fft:
	g++ fourier_transform/* -o bin/fourier -lm -std=c++11 -I headers/
start_vad:
	./bin/vad audio_webm/Джентльмены\ Удачи.\'Лошадью\ ходи\,\ лошадью\'-sd_KfEdQdic.webm 0.1 0.01
compile_vad:
	g++ trim/* -o bin/vad -std=c++11
