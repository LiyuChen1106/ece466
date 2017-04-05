clc; clear all;

[time_p2, packetsize_p2, bufferSize1, bufferSize2, bufferType] = textread('ps_n9.txt', '%f %f %f %f %f');

time2 = zeros(1,length(time_p2));
time2=cumsum(time_p2);
buffer1=bufferSize1;
buffer2=bufferSize2;

%time2/1e6;
fig1 = figure(1);
subplot(2,1,1);
plot(time2,buffer2,'-b');
title('Backlog for Poisson (N=9)');
xlabel('Time (in microseconds)');
ylabel('Content in buffer (in Bytes)');
xlim([0,14e7]);
subplot(2,1,2);
plot(time2,buffer1,'-b');
title('Backlog for Video (N=9)');
xlabel('Time (in microseconds)');
ylabel('Content in buffer (in Bytes)');
%ylim([-1,200]);
xlim([0,14e7]);
%legend 
%legend('Backlog in the buffer (N=1)','Location','northeast');

set(figure(1),'OuterPosition',[1 1 900 600]);
saveas(figure(1),'plot_n9_backlog','png');


%seperate two buffer flow
i=1;
j=1;
k=1;
packetfrom_1 = zeros(1,124816);
timefrom_1 = zeros(1,124816);
bkfrom_1 = zeros(1,124816);
packetfrom_2 = zeros(1,666086);
timefrom_2 = zeros(1,666086);
bkfrom_2 = zeros(1,666086);
%disp(buffer(i));

while i<=length(packetsize_p2)
    %disp(bufferType(i));
    %low
    if bufferType(i) == 1
        packetfrom_1(k)=packetsize_p2(i);
        timefrom_1(k)=time_p2(i);
        bkfrom_1(k)=bufferSize2(i);
        k=k+1;
    end
    %high
    if bufferType(i) == 2
        packetfrom_2(j)=packetsize_p2(i);
        timefrom_2(j)=time_p2(i);
        bkfrom_2(j)=bufferSize1(i);
        j=j+1;
    end
    
    %disp(buffer(i));
    i=i+1;
end

%Poisson
[packet_no_p, time_p, packetsize_p] = textread('generator_pos_n9.txt', '%f %f %f');
i=1;
time1p(i)=0;
arrivalp(i)=packetsize_p(i);
i=2;
while i<=length(packet_no_p)
    time1p(i)=time1p(i-1)+time_p(i);
    arrivalp(i) = arrivalp(i-1)+packetsize_p(i);
    i=i+1;
end

[packet_no_p3, time_p3, packetsize_p3] = textread('sink_pos_n9.txt', '%f %f %f');

time_temp3p = cumsum(time_p3);
time3p=zeros(1,length(time_p3));
i=2;
while i<=length(time_p3)
    time3p(i)=time_temp3p(i);
    i=i+1;
end
%time3(i)=0;
i=1;
arrival3p(i)=packetsize_p3(i);
i=2;
while i<=length(packetsize_p3)
    %time3(i)=time3(i-1)+time_p3(i);
    arrival3p(i)=arrival3p(i-1)+packetsize_p3(i);
    i=i+1;
end

waiting_time1 = zeros(1,length(time_p3)); 
i=1;
while i<=length(time_p3)
    j=i;
    while (((bkfrom_1(i) + packetfrom_1(i)) > 102400) && j< length(time_p3) )
        j = j+1;
    end
    waiting_time1(i) = time3p(i) - time1p(j); %microseconds!!!
    if waiting_time1(i) < 0
        waiting_time1(i) = 0;
    end
    i = i+1;
end

fig2=figure(2);
subplot(2,1,1);
plot(time3p,waiting_time1,'-b');
title('Waiting time for Poisson (N=9)');
xlabel('Time (in microseconds)');
ylabel('Waiting time (in microseconds)');
%ylim([-1,200]);
xlim([0,1e6]);
%legend 
%legend('Backlog in the buffer (N=1)','Location','northeast');

%set(fig2,'OuterPosition',[1 1 900 600]);
%saveas(fig2,'plot_n1_waitingtime','png');

%Video
[packet_no_p, time_p, packetsize_p] = textread('generator_vedio_n9.txt', '%f %f %f');
i=1;
time1(i)=0;
arrival(i)=packetsize_p(i);
i=2;
while i<=length(packet_no_p)
    time1(i)=time1(i-1)+time_p(i);
    arrival(i) = arrival(i-1)+packetsize_p(i);
    i=i+1;
end

[packet_no_p3, time_p3, packetsize_p3] = textread('sink_video_n9.txt', '%f %f %f');

time_temp3 = cumsum(time_p3);
time3=zeros(1,length(time_p));
i=2;
while i<=length(time_p)
    time3(i)=time_temp3(i);
    i=i+1;
end
%time3(i)=0;
i=1;
arrival3(i)=packetsize_p(i);
i=2;
while i<=length(packetsize_p)
    %time3(i)=time3(i-1)+time_p3(i);
    arrival3(i)=arrival3(i-1)+packetsize_p3(i);
    i=i+1;
end

waiting_time2 = zeros(1,length(time_p)); 
i=1;
while i<=length(time_p)
    j=i;
    while (((bkfrom_2(i) + packetfrom_2(i)) > 102400) && j< length(time_p) )
        j = j+1;
    end
    waiting_time2(i) = abs(time3(i) - time1(j)); %microseconds!!!
    if i < 10000
        waiting_time2(i) = 0;
    end
    i = i+1;
end
%disp(time3(5000)-time1(5000));
subplot(2,1,2);
plot(time3,waiting_time2,'-b');
title('Waiting time for video (N=9)');
xlabel('Time (in microseconds)');
ylabel('Waiting time (in microseconds)');
%ylim([-1,200]);
xlim([0,3e7]);
%legend 
%legend('Backlog in the buffer (N=1)','Location','northeast');

set(fig2,'OuterPosition',[1 1 900 600]);
saveas(fig2,'plot_n9_waitingtime','png');





discard_p1 = zeros(1, length(time3));
i=1;
time3_d1=zeros(1, length(time3));
while i<=length(time3)
   time3_d1(i)=time3(i);
   i=i+1
end
i=1;
while i<=length(time3)
    if ((bkfrom_1(i) + packetfrom_1(i)) > 102400)
        discard_p1(i) = 1;
    end
    i=i+1;
end

discard_p2 = zeros(1, length(time3));
i=1;
time3_d2=zeros(1, length(time3));
while i<=length(time3)
   time3_d2(i)=time3(i);
   i=i+1
end
i=1;
while i<=length(time3)
    if ((bkfrom_2(i) + packetfrom_2(i)) > 102400)
        discard_p2(i) = 1;
    end
    i=i+1;
end

fig3=figure(3);
subplot(2,1,1);
plot(time3_d1,cumsum(discard_p1),'-b');
title('Number of Discarded packets for Poisson (N=9)');
xlabel('Time (in microseconds)');
ylabel('Total discarded packets');
%ylim([-1,200]);
xlim([0,1e7]);
%legend 
%legend('Backlog in the buffer (N=1)','Location','northeast');
subplot(2,1,2);
plot(time3_d2,cumsum(discard_p2),'-b');
title('Number of Discarded packets for video (N=9)');
xlabel('Time (in microseconds)');
ylabel('Total discarded packets');
xlim([0,1e7]);




set(fig3,'OuterPosition',[1 1 900 600]);
saveas(fig3,'plot_n9_discard','png');