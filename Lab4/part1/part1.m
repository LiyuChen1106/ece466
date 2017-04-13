
clc; clear all;

[seq_no, send, receive] = textread('sink_r10.txt', '%f %f %f');

figure(1);
plot(seq_no,send,'r',seq_no,receive,'g');
title('Packet train: N=100, L=400, r=10');
xlabel('Sequence Number');
ylabel('Timestamps (in microseconds)');
%xlim([0,2.1e8]);
%legend 
legend('Send Timestamps','Receive Timestamps','Location','northeast');

set(1,'OuterPosition',[1 1 1060 664]);
saveas(1,'plot_r10','png');

[seq_no, send, receive] = textread('sink_1000.txt', '%f %f %f');

figure(2);
plot(seq_no,send,'r',seq_no,receive,'g');
title('Packet train: N=100, L=400, r=1000');
xlabel('Sequence Number');
ylabel('Timestamps (in microseconds)');
%xlim([0,2.1e8]);
%legend 
legend('Send Timestamps','Receive Timestamps','Location','northeast');

set(2,'OuterPosition',[1 1 1060 664]);
saveas(2,'plot_r1000','png');

[seq_no, send, receive] = textread('sink_r10000.txt', '%f %f %f');

figure(3);
plot(seq_no,send,'r',seq_no,receive,'g');
title('Packet train: N=100, L=400, r=10000');
xlabel('Sequence Number');
ylabel('Timestamps (in microseconds)');
%xlim([0,2.1e8]);
%legend 
legend('Send Timestamps','Receive Timestamps','Location','northeast');

set(3,'OuterPosition',[1 1 1060 664]);
saveas(3,'plot_r10000','png');