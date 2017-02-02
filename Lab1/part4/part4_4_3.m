clc;clear all;

[packet_no_p, time_p, packetsize_p] = textread('poisson2.data', '%f %f %f'); 

t=0;
g=1;
for i=1:100
    g=1;
    while t~=1
        if g == length(time_p)
            break;
        end
        if(time_p(g)<=i*1000000 && time_p(g+1)>i*1000000)
            break;
        else
            g=g+1;
        end
    end
    
    time2=time_p(1:g);
    frame2=packetsize_p(1:g);
    t1(1)=frame2(1);
    for j=2:g
        t1(j)=t1(j-1)+frame2(j);
    end
    mean1=mean(t1);
    var1=var(t1);

    disp1(i)=var1/mean1;
    

end

figure(1);
bar(disp1);
title('Index of dispersion for Poisson traffic');
xlabel('time intervel (in second)');
ylabel('Index of dispersion');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[index, time1, type_f, framesize_f, dummy1, dymmy2, dymmy3 ] = textread('movietrace.data', '%f %f %c %f %f %f %f');
for i=1:length(index)
    frame(index(i)+1) = framesize_f(i);
end

for i=1:100
   g=1;
   start=1;
   g=i*30;
   if g>length(index)
      g=length(index);
   end
   frame1=frame(1:g);
   t2(1)=frame1(1);
   for j=2:g
       t2(j)=t2(j-1)+frame1(j);
   end
   mean2=mean(t2);
   var2=var(t2);
   disp2(i)=var2/mean2;
   

end

figure(2);bar(disp2);
title('Index of dispersion for video traffic');
xlabel('time intervel (in second)');
ylabel('Index of dispersion');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[time2, framesize] = textread('Bel.data', '%f %f');   
t=0;
g=1;
start=1;

for i=1:100
    g=1;
    start=1;
    sum3=0;
    while t~=1
        if g == length(time2)
            sum3=framesize(g)+sum3;
            t3(g)=sum3;
            break;
        end
        if(time2(g)<=i && time2(g+1)>i)
            sum3 = framesize(g)+sum3;
            t3(g)=sum3;
            break;
        else
            sum3=sum3+framesize(g);
            t3(g)=sum3;
            g=g+1;
        end
    end
    
    mean5=t3(1)*time2(1);
    for j=2:g
            mean5=mean5+t3(j)*(time2(j)-time2(j-1));
    end
        
    var5 = ((t3(1)-mean5)^2)*time2(1)^2;
    for j=2:g
            var5=var5 +((t3(j)-mean5)^2)*(time2(j)-time2(j-1));
    end
    %var5=var5/i;
    disp3(i)=var5/mean5;    
        
end
figure(3); bar(disp3);    
title('Index of dispersion for Ethernet traffic');
xlabel('time intervel (in second)');
ylabel('Index of dispersion');