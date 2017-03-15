clc;clear all;
[packet_no_p, time_p, packetsize_p] = textread('poisson2.data', '%f %f %f');

a=max(packetsize_p);

[index, time1, type_f, framesize_f, dummy1, dymmy2, dymmy3 ] = textread('movietrace.data', '%f %f %c %f %f %f %f');

b=max(framesize_f);

[time, framesize] = textread('Bel.data', '%f %f');
c=max(framesize);