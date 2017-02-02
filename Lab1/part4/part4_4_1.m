clc;clear all;


[packet_no_p, time_p, packetsize_p] = textread('poisson2.data', '%f %f %f');    

mean1 = mean(packetsize_p);
var1=var(packetsize_p);
for i=1:5000
    cross=zeros(length(packetsize_p)-i,1);
    cross=0*cross;
    for t= (i+1):length(packetsize_p)
        cross(t)=(packetsize_p(t)-mean1)*(packetsize_p(t-i)-mean1);
    end
    autocorrelation(i)=sum(cross)/(var1*(length(packetsize_p)-i));
end



figure(1);
subplot(3,1,1);
bar(autocorrelation);
title('autocorrelation function');
xlabel('LAG');
ylabel('autocorrelation');
[index, time, type_f, framesize_f, dummy1, dymmy2, dymmy3 ] = textread('movietrace.data', '%f %f %c %f %f %f %f');

mean1 = mean(framesize_f);
var1=var(framesize_f);
for i=1:5000
    cross=zeros(length(framesize_f)-i,1);
    for t= (i+1):length(framesize_f)
        cross(t)=(framesize_f(t)-mean1)*(framesize_f(t-i)-mean1);
    end
    
    autocorrelation(i)=sum(cross)/(var1*(length(framesize_f)-i));
end

subplot(3,1,2);
bar(autocorrelation);
title('autocorrelation function');
xlabel('LAG');
ylabel('autocorrelation');

[time1, framesize1] = textread('Bel.data', '%f %f');
mean1 = mean(framesize1);
var1=var(framesize1);
for i=1:5000
    cross=zeros(length(framesize1)-i,1);
    for t= (i+1):length(framesize1)
        cross(t)=(framesize1(t)-mean1)*(framesize1(t-i)-mean1);
    end
    autocorrelation(i)=sum(cross)/(var1*(length(framesize1)-i));
end
subplot(3,1,3);
bar(autocorrelation);
title('autocorrelation function');
xlabel('LAG');
ylabel('autocorrelation');
