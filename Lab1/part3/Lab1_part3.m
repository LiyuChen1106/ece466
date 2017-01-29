clc;clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reading the data and putting the first 100000 entries in variables 
%Note that time is in seconds and framesize is in Bytes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
no_entries=1000000;
[time1, framesize1] = textread('Bel.data', '%f %f');
time=time1(1:no_entries);
framesize=framesize1(1:no_entries);

num=length(time);
totalby=0;
for i=1:length(time)
    totalby=totalby+framesize(i);
end
fprintf('total %d packets contain total %d bytes \n\n',num, totalby);

meanSi= mean(framesize)*8;
timedif(1)=time(1);
for i=1:(length(time)-1)
    timedif(i+1)=time(i+1)-time(i);
end
meanTi=mean(timedif);
meanbitR= 8*meanSi/meanTi;
fprintf('average bit rate: %.2f \n\n',meanbitR);

for i=1:length(time)
    bitR(i)=8*framesize(i)/timedif(i);
end

peakb=max(bitR);
fprintf('peak bit rate: %.2f \n\n',peakb);

ptoaratio= peakb/meanbitR;
fprintf('the ratio of the peak rate and the average rate: %.2f\n',ptoaratio);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);
plot(time,framesize);
title('Packet size v.s. time');
xlabel('Time (seconds)');
ylabel('Packet size (bytes)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2);
I_dist=zeros(1,80);
for i=1:length(framesize)
    d=framesize(i);
    d=d/20;
    d=int32(d);
    I_dist(d+1)=I_dist(d+1)+1;
end
I_dist=I_dist/length(framesize);
xl=zeros(1,80);
for i=1:80
    xl(i)=i*20;
end
bar(xl,I_dist);
title('Distribution of packet sizes');
xlabel('Packet size (bytes)');
ylabel('Relative frequency');
%%%%%%%%%%%%%%%%%%%%%%%%%Exercise %%%3.2%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following code will generate Plot 1; You generate Plot2 , Plot3.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);
jj=1;
i=1;
initial_p=0;
ag_time=1;
bytes_p=zeros(1,100);
while time(jj)<=initial_p
    jj=jj+1;
end
while i<=100
while ((time(jj)-initial_p)<=ag_time*i && jj<no_entries)
bytes_p(i)=bytes_p(i)+framesize(jj);
jj=jj+1;
end
i=i+1;
end

subplot(3,1,1);bar(bytes_p);
title('Plot of Ethernet trace data, start at 0s');
xlabel('Elements (1 second each)');
ylabel('Number of bytes');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

jj=1;
i=1;
initial_p=rand * 3142.82;
ag_time=0.1;
bytes_p=zeros(1,100);
while time(jj)<=initial_p
    jj=jj+1;
end
while i<=100
while ((time(jj)-initial_p)<=ag_time*i && jj<no_entries)
bytes_p(i)=bytes_p(i)+framesize(jj);
jj=jj+1;
end
i=i+1;
end

subplot(3,1,2);bar(bytes_p);
str = sprintf('Plot of Ethernet trace data, random start at %.1fs', initial_p);
title(str);
xlabel('Elements (100 milliseconds each)');
ylabel('Number of bytes');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

jj=1;
i=1;
initial_p=rand * 3142.82;
ag_time=0.01;
bytes_p=zeros(1,100);
while time(jj)<=initial_p
    jj=jj+1;
end
while i<=100
while ((time(jj)-initial_p)<=ag_time*i && jj<no_entries)
bytes_p(i)=bytes_p(i)+framesize(jj);
jj=jj+1;
end
i=i+1;
end

subplot(3,1,3);bar(bytes_p);
str = sprintf('Plot of Ethernet trace data, random start at %.1fs', initial_p);
title(str);
xlabel('Elements (10 milliseconds each)');
ylabel('Number of bytes');