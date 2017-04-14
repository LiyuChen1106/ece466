
clc; clear all;

figure(1);

t=0:2.1e6;
y=4752+0.38*(t-100000);

for i=1:length(y)
    if y(i)<4752
        y(i)=0;
    end
end

plot(t,y);
title('Black box 1');
xlabel('Time (in microseconds)');
ylabel('');

%ylim([0,100000]);
xlim([0,2.1e5]);
set(1,'OuterPosition',[1 1 1060 664]);
saveas(1,'black_box_1','png');


figure(2);

t=0:2.1e6;
y=3000+0.06*(t-150);

for i=1:length(y)
    if y(i)<3000
        y(i)=0;
    end
end

plot(t,y);
title('Black box 2');
xlabel('Time (in microseconds)');
ylabel('');

%ylim([0,2e6]);
xlim([0,2.1e5]);
set(2,'OuterPosition',[1 1 1060 664]);
saveas(2,'black_box_2','png');



figure(3);

t=0:2.1e6;
y=2176+0.18*(t-76365);

for i=1:length(y)
    if y(i)<2176
        y(i)=0;
    end
end

plot(t,y);
title('Black box 3');
xlabel('Time (in microseconds)');
ylabel('');

xlim([0,2.1e5]);
set(3,'OuterPosition',[1 1 1060 664]);
saveas(3,'black_box_3','png');



