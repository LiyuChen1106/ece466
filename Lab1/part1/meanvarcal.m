clc;clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reading data from a file
%Note that time is in micro seconds and packetsize is in Bytes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[packet_no_p, time_p, packetsize_p] = textread('poisson1.data', '%f %f %f');

maxsize=size(packet_no_p);
timeinterval=zeros(1,maxsize(1,1)-1);
i=1;
while i<maxsize(1,1)
    timeinterval(i)=time_p(i+1)-time_p(i);
    i=i+1;
end

i=1;
mean=0;
while i<maxsize(1,1)
    mean=timeinterval(i)+mean;
    i=i+1;
end

mean=mean/(maxsize(1,1)-1);

varience=0;
i=1;
while i<maxsize(1,1)
    varience= varience + (timeinterval(i)-mean)^2;
    i=i+1;
end

varience=varience/(maxsize(1,1)-1);

fprintf('poisson1.data organization for mean value(in microseconds): %d\n',mean);
fprintf('poisson1.data organization for varoemce value(in microseconds): %d\n',varience);
bitrate=100*8*10^6/mean;
fprintf('poisson1.data organization for bit rate(in mbps): %d\n',bitrate);

[packet_no_p, time_p, packetsize_p] = textread('poisson3.data', '%f %f %f');

maxsize=size(packet_no_p);
timeinterval=zeros(1,maxsize(1,1)-1);
i=1;
while i<maxsize(1,1)
    timeinterval(i)=time_p(i+1)-time_p(i);
    i=i+1;
end

i=1;
mean=0;
while i<maxsize(1,1)
    mean=timeinterval(i)+mean;
    i=i+1;
end

mean=mean/(maxsize(1,1)-1);

varience=0;
i=1;
while i<maxsize(1,1)
    varience= varience + (timeinterval(i)-mean)^2;
    i=i+1;
end

varience=varience/(maxsize(1,1)-1);

fprintf('poisson3.data organization for mean value(in microseconds): %d\n',mean);
fprintf('poisson3.data organization for varoemce value(in microseconds): %d\n',varience);
bitrate=100*8*10^6/mean;
fprintf('poisson3.data organization for bit rate(in mbps): %d\n',bitrate);