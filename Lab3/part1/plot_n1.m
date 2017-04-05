clc; clear all;

[time_p2, packetsize_p2, bufferSize, bufferSize0] = textread('ps_n1.txt', '%f %f %f %f');

i=1;
time2(i)=0;
buffer(i)=bufferSize(i);
%disp(buffer(i));

i=2;
while i<=length(packetsize_p2)
    time2(i)=time2(i-1)+time_p2(i);
    buffer(i)=bufferSize(i);

    %disp(buffer(i));
    i=i+1;
end

%time2/1e6;
fig1 = figure(1);
plot(time2,buffer,'-b');
title('Backlog in the buffer (N=1)');
xlabel('Time (in microseconds)');
ylabel('Content in buffer (in Bytes)');
%ylim([-1,200]);
xlim([0,9e6]);
%legend 
%legend('Backlog in the buffer (N=1)','Location','northeast');

set(figure(1),'OuterPosition',[1 1 1060 664]);
saveas(figure(1),'plot_n1_backlog','png');


[packet_no_p, time_p, packetsize_p] = textread('generator_n1.txt', '%f %f %f');
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

[packet_no_p3, time_p3, packetsize_p3] = textread('sink_n1.txt', '%f %f %f');
i=1;
time3(i)=0;
arrival3(i)=packetsize_p3(i);
i=2;
while i<=length(packetsize_p3)
    time3(i)=time3(i-1)+time_p3(i);
    arrival3(i)=arrival3(i-1)+packetsize_p3(i);
    i=i+1;
end

waiting_time = zeros(1,length(packetsize_p3)); 
i=1;
while i<=length(packetsize_p3)
    j=i;
    while (((buffer(i) + packetsize_p2(i)) > 102400) && j< length(packetsize_p3) )
        j = j+1;
    end
    waiting_time(i) = time3(i) - time1(j); %microseconds!!!
    if waiting_time(i) < 0
        waiting_time(i) = 0;
    end
    i = i+1;
end

fig2=figure(2);
plot(time3,waiting_time,'-b');
title('Waiting time (N=1)');
xlabel('Time (in microseconds)');
ylabel('Waiting time (in microseconds)');
%ylim([-1,200]);
xlim([0,9e6]);
%legend 
%legend('Backlog in the buffer (N=1)','Location','northeast');

set(fig2,'OuterPosition',[1 1 1060 664]);
saveas(fig2,'plot_n1_waitingtime','png');


discard_p = zeros(1, length(packetsize_p3));
i=1;
while i<=length(packetsize_p3)
    if ((buffer(i) + packetsize_p2(i)) > 102400)
        discard_p(i) = 1;
    end
    i=i+1;
end

fig3=figure(3);
plot(time3,cumsum(discard_p),'-b');
title('Number of Discarded packets (N=1)');
xlabel('Time (in microseconds)');
ylabel('Total discarded packets');
%ylim([-1,200]);
xlim([0,9e6]);
%legend 
%legend('Backlog in the buffer (N=1)','Location','northeast');

set(fig3,'OuterPosition',[1 1 1060 664]);
saveas(fig3,'plot_n1_discard','png');