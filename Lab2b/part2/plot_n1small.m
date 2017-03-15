clc; clear all;

[packet_no_p, time_p, packetsize_p] = textread('generator_n1small.txt', '%f %f %f');
figure(1);
i=1;
time1(i)=0;
arrival(i)=packetsize_p(i);
i=2;
while i<=length(packet_no_p)
    time1(i)=time1(i-1)+time_p(i);
    arrival(i) = arrival(i-1)+packetsize_p(i);
    i=i+1;
end
%subplot(2,1,1)
%plot(time1,arrival);
%title('Cumulative arrival function of the trace file');
%xlabel('time (in microseconds)');
%ylabel('Cumulative arrivals (in bytes)');
%xlim([0,2.1e6]);

[time_p2, packetsize_p2, bufferSize, noToken] = textread('bucket_n1small.txt', '%f %f %f %f');
i=1;
time2(i)=0;
arrival2(i)=packetsize_p2(i);
i=2;
while i<=length(packetsize_p2)
    time2(i)=time2(i-1)+time_p2(i);
    arrival2(i)=arrival2(i-1)+packetsize_p2(i);
    i=i+1;
end

[packet_no_p3, time_p3, packetsize_p3] = textread('sink_n1small.txt', '%f %f %f');
i=1;
time3(i)=0;
arrival3(i)=packetsize_p3(i);
i=2;
while i<=length(packetsize_p3)
    time3(i)=time3(i-1)+time_p3(i);
    arrival3(i)=arrival3(i-1)+packetsize_p3(i);
    i=i+1;
end
%subplot(2,1,2);
%plot(time3,arrival3);
%title('Cumulative arrival function of output file');
%xlabel('time (in microseconds)');
%ylabel('Cumulative arrivals (in bytes)');
%xlim([0,2.1e6]);




plot(time3,arrival3,'r',time2,arrival2,'g',time1,arrival,'b');
title('Cumulative arrival function of the generator, token bucket and sink for case1');
xlabel('time (in microseconds)');
ylabel('Cumulative arrivals (in bytes)');
%xlim([0,2.1e6]);
%legend 
legend('Generator','Token bucket','Sink');