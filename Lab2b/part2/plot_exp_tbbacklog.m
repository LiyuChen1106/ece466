clc; clear all;

[time_p2, packetsize_p2, bufferSize, noToken] = textread('bucket.txt', '%f %f %f %f');
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
title('Content of token bucket and buffer backlog for experiment');
xlabel('Time (in microseconds)');
ylabel('Content in token bucket / buffer (in Bytes)');
%xlim([0,2.1e6]);
%legend 
legend('Number of token(s)','Backlog in the buffer');