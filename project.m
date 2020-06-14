clc;
clear all;
close all;

file = uigetfile
signal= load(file);

M=max(signal);
disp(M);

scale_factor=1.5/M;
disp(scale_factor);
scaled_signal=signal.*scale_factor
disp(scaled_signal);

plot(scaled_signal);
xlabel('Samples');
ylabel('Voltage');
title('ECG signal, scaled');

count=0;
for k= 2:length(scaled_signal)-1;
    if (scaled_signal(k)> 0.6 & scaled_signal(k)>scaled_signal(k-1) & scaled_signal(k)>scaled_signal(k+1))
        count=count+1;
    end
end
disp(count);

Fs = 100;
N = length(scaled_signal);
duration=N/(Fs*60);
BPM=count/duration;
disp(BPM);

h = msgbox(sprintf('BPM: %d', BPM), 'Average BPM')

