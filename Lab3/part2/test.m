clc; clear all;

[time_p2, packetsize_p2, bufferSize1, bufferSize2, bufferType] = textread('ps_n1.txt', '%f %f %f %f %f');


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
        bkfrom_1(k)=bufferSize1(i);
        k=k+1;
    end
    %high
    if bufferType(i) == 2
        packetfrom_2(j)=packetsize_p2(i);
        timefrom_2(j)=time_p2(i);
        bkfrom_2(j)=bufferSize2(i);
        j=j+1;
    end
    
    %disp(buffer(i));
    i=i+1;
end

disp(length(packetsize_p2));
disp(length(timefrom_1));
disp(packetfrom_2(5000)+bkfrom_2(5000));
disp(length(packetfrom_1));
disp(length(packetfrom_2));