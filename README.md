# MATLAB Files for Electrical Circuit Calculations

This repository contains MATLAB `.m` files developed for the course *Modeling of Electromechanical Systems*. These scripts are designed to perform various electrical circuit calculations, illustrating key concepts and techniques in the field.

## Contents

- `circuit1.m`: This script calculates the current in a simple AC circuit with predefined resistances, inductance, and capacitance. It also computes the magnitude and phase of the currents, as well as the error in the voltage calculation.
- `circuit2.m`: This script performs the same calculations as circuit1.m, but it prompts the user to input the values for resistances, inductance, capacitance, and phase angles. It calculates the currents, their magnitudes, phases, and checks for errors in the voltage calculation.
- `circuit3.m`: This script performs AC circuit calculations similar to circuit2.m, with user input for component values. It includes enhanced error checking and computes the time-domain response of the circuit, plotting the currents over time using the current.m function.
- `circuit4.m`: This script analyzes an RLC circuit with three resistors, one inductor, and one capacitor. The user inputs the component values, and the script calculates the currents and capacitor voltage over time using a time-stepping approach. The results are plotted, showing the time-domain behavior of the circuit.
- `circuit5.m`: This script extends the analysis to a more complex circuit. It calculates the time-domain response for the currents through the resistors and the voltage across the capacitor, using a matrix-based approach for solving the circuit equations. The results are plotted in two subplots: one for the currents and one for the capacitor voltage.
- `current.m`: This function calculates the instantaneous current in an AC circuit, given the current magnitude, frequency, phase angle, and time.
- `circuit.m`: This script extends the analysis to a more complex circuit with five resistances, one inductance, and one capacitance. It calculates the currents, checks for multiple error conditions, and plots the time-domain response of the currents through all circuit elements using the current.m function.

## Usage

To use any of the scripts, simply open them in MATLAB and run them. Ensure that any required inputs are provided as described in the comments within each file.

```bash
% Example usage in MATLAB
run('filename1.m')
