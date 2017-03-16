clc; clear all;

[time_p2, packetsize_p2, bufferSize, noToken] = textread('bucket_n10small.txt', '%f %f %f %f');
i=1;
time2(i)=0;
buffer(i)=bufferSize(i);
%disp(buffer(i));
token(i)=noToken(i);
i=2;
while i<=100%length(packetsize_p2)
    time2(i)=time2(i-1)+time_p2(i);
    buffer(i)=bufferSize(i);
    token(i)=noToken(i);
    %disp(buffer(i));
    i=i+1;
end

%time2/1e6;



plot(time2,token,'-r',time2,buffer,'-b');
title('Content of token bucket and buffer backlog for case2');
xlabel('Time (in microseconds)');
ylabel('Content in token bucket / buffer (in Bytes)');
%xlim([0,2.1e6]);
%legend 
legend('Content of token bucket','Backlog in the buffer','Location','northeast');

set(1,'OuterPosition',[1 1 1060 664]);
saveas(1,'plot_n10small_tbbacklog','png');