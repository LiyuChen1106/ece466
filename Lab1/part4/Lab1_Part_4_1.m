clc;clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reading data from a file
%Note that time is in micro seconds and packetsize is in Bytes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[packet_no_p, time_p, packetsize_p] = textread('poisson1.data', '%f %f %f');

% Calculate the mean and the variance of the times 
% between consecutive arrival eventsclc;clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reading data from a file
%Note that time is in micro seconds and packetsize is in Bytes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[packet_no_p, time_p, packetsize_p] = textread('poisson1.data', '%f %f %f');

% Calculate the mean and the variance of the times 
% between consecutive arrival events

arr_size = numel(packet_no_p) - 1;

time_interval = zeros(1, arr_size); 

for i = 1 : arr_size
    time_interval(i) = time_p(i+1) - time_p(i);
end

time_mean = mean(time_interval); %mean time interval in microseconds
time_variance = var(time_interval);

bit_rate_mean = 100 * 8 / (time_mean * 1e-6);
bit_rate_variance = 100 * 8 / (time_variance * 1e-6);
 
disp(1/time_mean);



arr_size = numel(packet_no_p) - 1;

time_interval = zeros(1, arr_size); 

for i = 1 : arr_size
    time_interval(i) = time_p(i+1) - time_p(i);
end

time_mean = mean(time_interval); %mean time interval in microseconds
time_variance = var(time_interval);

bit_rate_mean = 100 * 8 / (time_mean * 1e-6);
bit_rate_variance = 100 * 8 / (time_variance * 1e-6);
 
disp(1/time_mean);

