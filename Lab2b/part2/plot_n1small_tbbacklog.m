clc; clear all;

[time_p2, packetsize_p2, bufferSize, noToken] = textread('bucket_n1small.txt', '%f %f %f %f');
i=1;
time2(i)=0;
%buffer(i)=bufferSize(i);
%noToken(i)=noToken(i);
i=2;
while i<=length(packetsize_p2)
    time2(i)=time2(i-1)+time_p2(i);
    %buffer(i)=bufferSize(i);
    %noToken(i)=noToken(i);
    i=i+1;
end




plot(time2,noToken,'r',time2,bufferSize,'b');
title('Content of token bucket and buffer backlog for case1');
xlabel('Time (in microseconds)');
ylabel('Content in token bucket / buffer (in Bytes)');
%xlim([0,2.1e6]);
%legend 
legend('Content of token bucket','Backlog in the buffer','Location','northeast');

set(1,'OuterPosition',[1 1 1060 664]);
saveas(1,'plot_n1small_tbbalcklog','png');