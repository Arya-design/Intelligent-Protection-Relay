
clc;
clear;
close all;

% Time
t = 0:0.001:1;

% Normal current
I_normal = 5*sin(2*pi*50*t);

% Fault current (sudden increase)
I_fault = I_normal;
I_fault(t > 0.5) = 20*sin(2*pi*50*t(t > 0.5));

% Voltage
V = 230*sin(2*pi*50*t);

% Threshold
threshold = 10;

% Relay logic
trip_signal = zeros(size(t));
trip_signal(abs(I_fault) > threshold) = 1;

% Plot 1: Normal Current
figure;
plot(t, I_normal);
title('Normal Current');
xlabel('Time'); ylabel('Current');
grid on;

% Plot 2: Fault Current
figure;
plot(t, I_fault);
title('Fault Current');
xlabel('Time'); ylabel('Current');
grid on;

% Plot 3: Voltage
figure;
plot(t, V);
title('Voltage Response');
xlabel('Time'); ylabel('Voltage');
grid on;

% Plot 4: Trip Signal
figure;
plot(t, trip_signal, 'LineWidth', 2);
title('Trip Signal');
xlabel('Time'); ylabel('Trip (0/1)');
grid on;
