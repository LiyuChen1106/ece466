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

[time_p2, packetsize_p2, d1,d2] = textread('bucket_p.data', '%f %f %f %f');
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

[packet_no_p3, time_p3, packetsize_p3] = textread('sink_p.data', '%f %f %f');

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

plot(time1,arrival,'r',time2,arrival2,'b',time3,arrival3,'g');


figure(2);
plot(time2,d1,'r',time2,d2,'g');






