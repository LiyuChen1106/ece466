clc;clear all;
[index, time_p, type_f, framesize_f, dummy1, dymmy2, dymmy3 ] = textread('movietrace.data', '%f %f %c %f %f %f %f');

figure(2);
for i=1:length(index)
    frame(index(i)+1)=framesize_f(i);
end

i=1;
time1(i)=0;
arrival1(i)=frame(i);
i=2;
while i<=length(frame)
    time1(i)=time1(i-1)+33000;
    arrival1(i)=arrival1(i-1)+frame(i);
    i=i+1;
end

[time_p2, packetsize_p2, d1,d2] = textread('bucket_video.data', '%f %f %f %f');
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

[packet_no_p3, time_p3, packetsize_p3] = textread('sink_video.txt', '%f %f %f');

i=1;
time3(i)=0;
arrival3(i)=packetsize_p3(i);
i=2;
while i<=length(packetsize_p3)
    time3(i)=time3(i-1)+time_p3(i);
    arrival3(i)=arrival3(i-1)+packetsize_p3(i);
    i=i+1;
end

plot(time1,arrival1,'r',time2,arrival2,'g',time3,arrival3,'b');
title('Cumulative arrival function for video traffic');
xlabel('time (in microseconds)');
ylabel('Cumulative arrivals (in bytes)');
%legend 
legend('Trace file data', 'Arrivals at token bucket', 'Arrivals at traffic sink');
