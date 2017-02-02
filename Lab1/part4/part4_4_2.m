clc;clear all;


[packet_no_p, time_p, packetsize_p] = textread('poisson2.data', '%f %f %f');   

sum=0;
t=0;
g=1;
start=1;
for i=1:100
    sum=0;
    g=1;
    start=1;
    while t~=1
        if g == length(time_p)
            sum=packetsize_p(g)+sum;
            break;
        end
        if(time_p(g)<=i*1000000 && time_p(g+1)>i*1000000)
            sum = packetsize_p(g)+sum;
            break;
        else
            sum=sum+packetsize_p(g);
            g=g+1;
        end
    end
    
    th=sum;
    while t~=1
        if g== length(time_p)
            break;
        end
        th=th-packetsize_p(start);
        start=start+1;
        while t~=1
            if g==length(time_p)
                break;
            end
            if (time_p(g)-time_p(start))<=i*1000000 && (time_p(g+1)-time_p(start)>i*1000000)
                break;
            else
                th=th+packetsize_p(g+1);
                g=g+1;
            end
        end
        
        if th>=sum
            sum=th;
        end
    end
    burstiF(i)= sum/i;            
end
figure(1);
bar(burstiF);       
 
[index, time1, type_f, framesize_f, dummy1, dymmy2, dymmy3 ] = textread('movietrace.data', '%f %f %c %f %f %f %f');

for i=1:length(index)
    frame(index(i)+1) = framesize_f(i);
end

for i=1:1800
   sum=0;
   g=1;
   start=1;
   g=i*30;
   if g>length(index)
      g=length(index);
   end

   for j=1:g
      sum=sum+frame(j);
   end
   th=sum;

   while t~=1
       if g==length(index)
           break;
       end
       th=th-frame(start);
       start=start+1;
       g=g+1;
       th=th+frame(g);
       if th>=sum
           sum=th;
       end
   end
   burstiF(i)= sum/i;
end
figure(2);
bar(burstiF);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[time, framesize] = textread('Bel.data', '%f %f');
sum=0;
t=0;
g=1;
start=1;
for i=1:3143
    sum=0;
    g=1;
    start=1;
    while t~=1
        if g == length(time)
            sum=framesize(g)+sum;
            break;
        end
        if(time(g)<i && time(g+1)>=i)
            sum = framesize(g)+sum;
            break;
        else
            sum=sum+framesize(g);
            g=g+1;
        end
    end
    
    th=sum;
    while t~=1
        if g== length(time)
            break;
        end
        th=th-framesize(start);
        start=start+1;
        while t~=1
            if g==length(time)
                break;
            end
            if (time(g)-time(start))<i && (time(g+1)-time(start)>=i)
                break;
            else
                th=th+framesize(g+1);
                g=g+1;
            end
        end
        
        if th>=sum
            sum=th;
        end
    end
    burstiF(i)= sum/i;            
end        
figure(3);
bar(burstiF);
 