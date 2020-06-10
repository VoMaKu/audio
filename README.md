# audio(LINUX ONLY)

## Fast Fourier Transform(FFT)

About this ou can read in [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform)

exec.file is created by command:
	
	make compile_fft

exec.file with my examples is executed by command:  

	make start_fft


### my example

initial data - 1 , 6 , 2 , 5 , 3 , 4

#### the result 

**Fouier transform**

data | number
-----|---------------
s[0] | 3.500 +0.000i
s[1] | -0.250 -0.144i
s[2] | -0.250 -0.433i
s[3] | -1.500 -0.000i
s[4] | -0.250 +0.433i
s[5] | -0.250 +0.144i

**Fast Fouier tranform**

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


## Split by vad

this program cut human voice and save this audio by the bit

exec.file is created by command:  
	
	make compile_vad

exec.file is executed with my example by command:  

	make start_vad
