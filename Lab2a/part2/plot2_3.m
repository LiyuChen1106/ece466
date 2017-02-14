clc; clear all;

[packet_no_p, time_p, packetsize_p] = textread('poisson3.data', '%f %f %f');

figure(1);

time1(1)=0;
arrival(1)=packetsize_p(1);

time_p=time_p-time_p(1);

i=2;
while i<125000
    time1(i)=time_p(i);
    arrival(i) = arrival(i-1)+packetsize_p(i);
    i=i+1;
end

%subplot(3,1,1)
%plot(time1,arrival);


[packet_no_p3, time_p3, packetsize_p3] = textread('sink.txt', '%f %f %f');

i=1;
time3(i)=0;
arrival3(i)=packetsize_p3(i);
i=2;
while i<=length(packetsize_p3)
    time3(i)=time3(i-1)+time_p3(i);
    arrival3(i)=arrival3(i-1)+packetsize_p3(i);
    i=i+1;
end
%subplot(3,1,3);
%plot(time3,arrival3);

plot(time1,arrival,'r',time3,arrival3,'g');
title('Cumulative arrival function for Poisson traffic');
xlabel('time (in microseconds)');
ylabel('Cumulative arrivals (in bytes)');
%legend 
legend('Trace file','Sink');

