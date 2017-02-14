clc;clear all;

no_entries=1000000;
[time, framesize] = textread('Bel.data', '%f %f');
time12=time(1:no_entries);
framesize1=framesize(1:no_entries);

figure(1);

time1(1)=0;
arrival(1)=framesize(1);

time12=time12-time12(1);

i=2;
while i<1000000
    time1(i)=time12(i)*1000000;
    arrival(i) = arrival(i-1)+framesize(i);
    i=i+1;
end

%subplot(3,1,1)
%plot(time1,arrival);

[time_p2, packetsize_p2, d1,d2] = textread('bucket_eth.data', '%f %f %f %f');
%in this case d1,d2 have no sense
i=1;
time2(i)=0;
arrival2(i)=packetsize_p2(i);
i=2;
while i<=length(packetsize_p2)
    time2(i)=time2(i-1)+time_p2(i);
    arrival2(i)=arrival2(i-1)+packetsize_p2(i);
    i=i+1;
end
%subplot(3,1,2);
%plot(time2,arrival2);

[packet_no_p3, time_p3, packetsize_p3] = textread('sink_eth.data', '%f %f %f');

i=1;
time3(i)=0;
arrival3(i)=packetsize_p3(i);
i=2;
while i<=length(packetsize_p3)
    time3(i)=time3(i-1)+time_p3(i);
    arrival3(i)=arrival3(i-1)+packetsize_p3(i);
    i=i+1;
end

plot(time1,arrival,'r',time2,arrival2,'b',time3,arrival3,'g');
title('Cumulative arrival function for Ethernet traffic');
xlabel('time (in microseconds)');
ylabel('Cumulative arrivals (in bytes)');
%legend 
legend('Trace file data', 'Arrivals at traffic sink', 'Arrivals at token bucket');
