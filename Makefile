start_fft:
	./bin/fourier
compile_fft:
	g++ fourier_transform/* -o bin/fourier -lm -std=c++11 -I headers/
bot_dataset:
	python3 telegrambot/audio_digits_dataset_bot.py
