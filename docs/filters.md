# Filters

A circuit can be seen as device that on an input function respondes
with a certain output function; since the main scope of the digital circuit
is to handle signals, the study of response is in the frequency space.

A way to study the response is by the **Bode plot** that shows


## Low pass filter/RC Integrator

Are composed of a resistor with a capacitor

![low pass filter](Images/low-pass-filter.png)

$$f = {1\over 2\pi RC}$$

$${V_O(s)\over V_I(s)} = {1\over RC\cdot s + 1}$$

### Links

 - [tutorial](http://www.electronics-tutorials.ws/filter/filter_2.html)
 - [lowpass filter in scipy](http://stackoverflow.com/questions/25191620/creating-lowpass-filter-in-scipy-understanding-methods-and-units)

## High pass filter/RC Differentiator

 - [tutorial](http://www.electronics-tutorials.ws/filter/filter_3.html)

## Links

 - [Fundamentals of Power Electronics (slides)](http://ecee.colorado.edu/copec/book/slides/slidedir.html)
