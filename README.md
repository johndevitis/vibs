# vibs

vibs is a collection of structural dynamics and signal processing tools and examples.

Run the `init.m` function (from anywhere) to add all the project contents to the Matlab search path.

# Contents

## Franks Notes
Class notes from CIVE801 and CIVE802 taught by Frank Moon at Drexel University. Note that the PDF's are linked here, but there is also interactive spreadsheets within the repository which demonstrate the theory.

### SDOF
[Lecture 1 - Introduction to Structural Dynamics](docs/franks-notes/sdof/Lecture 1 - Introduction to Structural Dynamics.pdf)

[Lecture 2 - Dynamic Modeling (Point Mass)](docs/franks-notes/sdof/Lecture 2 - Dynamic Modeling (Point Mass).pdf)

[Lecture 3 - Dynamic Modeling (Distributed Mass)](docs/franks-notes/sdof/Lecture 3 - Dynamic Modeling (Distributed Mass).pdf)

[Lecture 4 - EOM and Undamped Free Vibration](docs/franks-notes/sdof/Lecture 4 - EOM and Undamped Free Vibration.pdf)

[Lecture 5 - Damped Free Vibration](docs/franks-notes/sdof/Lecture 5 - Damped Free Vibration.pdf)

[Lecture 6 - Forced Harmonic Vibration](docs/franks-notes/sdof/Lecture 6 - Forced Harmonic Vibration.pdf)

[Lecture 7 - Forced Harmonic and General Loading](docs/franks-notes/sdof/Lecture 7 - Forced Harmonic and General Loading.pdf)

[Lecture 8 - General Loading and Numerical Methods](docs/franks-notes/sdof/Lecture 8 - General Loading and Numerical Methods.pdf)


### MDOF (from CIVE802)




## Examples

Example files are located in the vibs/examples/ directory. Any data files referenced in the examples are located in the vibs/data/ directory.

The following example descriptions are paraphrased from the comments in each example.m file. Refer to the specific example for more details.

### FFT Scaling

`fft_example1.m` shows the basics of forming time signals based on the amplitude and frequency of two sinusoids. The frequency content is found via the FFT and the proper scaling is recovered.

### Usable Frequency Content of Impulse Signal

`impulse_example1.m` loads an impact record (force and driving point) from a file.

![impulse_time](data/impulse_time.png)

The usable frequency content of the impulse signal is found and plotted with the driving point frequency content.

![impulse_freq](data/impulse_freq.png)
