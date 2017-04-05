clc;clear all;

[packet_no_p, packetsize_p, arrival_time] = textread('sink_wd.txt', '%f %f %f');

%plot number of packet transmissions on a time scale of 10 ms per data
%point
%for number of packet transmissions, we don't care about the packet size
%just the fact that a packet comes in at arrival_time(i)
figure(1);
subplot(2,1,1);
time = arrival_time(1:length(packet_no_p));
packet = packet_no_p (1:length(packet_no_p));
plot(cumsum(time), packet);
title('Packet Tranmissions for different weighted senario (N=8)');
xlabel('time (in microseconds)');
ylabel('number of packets');
%plot number of transmitted bytes on a time scale of 10 ms per data point
subplot(2,1,2);
packet2 = packetsize_p(1:length(packet_no_p));
plot(cumsum(time), cumsum(packet2));
title('Number of Bytes Transmitted for different weighted senario (N=8)');
ylabel('number of bytes');
xlabel('time (in microseconds)');

set(figure(1),'OuterPosition',[1 1 900 600]);
saveas(figure(1),'plot_n8_wd','png');


[packet_no_p, packetsize_p, arrival_time] = textread('sink1_wd.txt', '%f %f %f');

%plot number of packet transmissions on a time scale of 10 ms per data
%point
%for number of packet transmissions, we don't care about the packet size
%just the fact that a packet comes in at arrival_time(i)
figure(2);
subplot(2,1,1);
time = arrival_time(1:length(packet_no_p));
packet = packet_no_p (1:length(packet_no_p));
plot(cumsum(time), packet);
title('Packet Tranmissions for different weighted senario (N=6)');
xlabel('time (in microseconds)');
ylabel('number of packets');
%plot number of transmitted bytes on a time scale of 10 ms per data point
subplot(2,1,2);
packet2 = packetsize_p(1:length(packet_no_p));
plot(cumsum(time), cumsum(packet2));
title('Number of Bytes Transmitted for different weighted senario (N=6)');
ylabel('number of bytes');
xlabel('time (in microseconds)');

set(figure(2),'OuterPosition',[1 1 900 600]);
saveas(figure(2),'plot_n6_wd','png');



[packet_no_p, packetsize_p, arrival_time] = textread('sink2_wd.txt', '%f %f %f');

%plot number of packet transmissions on a time scale of 10 ms per data
%point
%for number of packet transmissions, we don't care about the packet size
%just the fact that a packet comes in at arrival_time(i)
figure(3);
subplot(2,1,1);
time = arrival_time(1:length(packet_no_p));
packet = packet_no_p (1:length(packet_no_p));
plot(cumsum(time), packet);
title('Packet Tranmissions for different weighted senario (N=2)');
xlabel('time (in microseconds)');
ylabel('number of packets');
%plot number of transmitted bytes on a time scale of 10 ms per data point
subplot(2,1,2);
packet2 = packetsize_p(1:length(packet_no_p));
plot(cumsum(time), cumsum(packet2));
title('Number of Bytes Transmitted for different weighted senario (N=2)');
ylabel('number of bytes');
xlabel('time (in microseconds)');

set(figure(3),'OuterPosition',[1 1 900 600]);
saveas(figure(3),'plot_n2_wd','png');