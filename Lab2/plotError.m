load('lab2_3.mat');
total = length(a) + length(b);
num_of_trials = 20;
J = 5;

misclassified_list1 = [
0   107;
0    74;
0    37;
0    19;
0    14];

misclassified_list2 = [
0   115;
0    57;
0    25;
0    16;
0     9];

misclassified_list3 = [
0   150;
0    73;
0    51;
0    27;
0     9];
 
misclassified_list4 = [
0   102;
0    48;
0    44;
0    18;
0     7];

misclassified_list5 = [
0   106;
0    37;
0    16;
0    10;
0     5];

misclassified_list6 = [
0   124;
0    42;
0    39;
0    21;
0     6];

misclassified_list7 = [
0   149;
0    71;
0    37;
0    13;
0     3];

misclassified_list8 = [
0   110;
0    58;
0    21;
0    12;
0     5];    

misclassified_list9 = [
0   126;
0    46;
0    10;
0     4;
0     1];

misclassified_list10 = [
0    97;
0    50;
0    20;
0     8;
0     1;
];

misclassified_list11 = [
0   108;
0    42;
0    18;
0     8;
0     3];

misclassified_list12 = [
0   106;
0    37;
0    16;
0    10;
0     5];

misclassified_list13 = [
0   104;
0    57;
0    26;
0    18;
0    10];

misclassified_list14 = [
0    128;
0    60;
0    12;
0     3;
0     1];

misclassified_list15 = [
0   107;
0    65;
0    32;
0    20;
0    1];

misclassified_list16 = [
0   111;
0    59;
0    11;
0    10;
0     2];

misclassified_list17 = [
0   122;
0    84;
0    30;
0    15;
0     8];

misclassified_list18 = [
0   118;
0    86;
0    32;
0    16;
0     3];

misclassified_list19 = [
0   112;
0    60;
0    20;
0     8;
0     2];

misclassified_list20 = [
0   123;
0    93;
0    36;
0    17;
0    15];

total_misclassified = [
misclassified_list1, misclassified_list2, misclassified_list3, misclassified_list4, misclassified_list5,...
misclassified_list6, misclassified_list7, misclassified_list8, misclassified_list9, misclassified_list10,...
misclassified_list11, misclassified_list12, misclassified_list13, misclassified_list14, misclassified_list15,...
misclassified_list16, misclassified_list17, misclassified_list18, misclassified_list19, misclassified_list20];

avg_error_rate = sum(total_misclassified, 2)/total/num_of_trials;
std_error_rate = std(total_misclassified, 0, 2)/total/3;

% remove zeros because total error is the sum of n_ab and n_ba
total_misclassified(total_misclassified==0) = [];
total_misclassified = reshape(total_misclassified, [5, 20]);
min_error_rate = min(total_misclassified, [], 2)/total;
max_error_rate = max(total_misclassified, [], 2)/total;

%% Plot
figure(1);
subplot(3,1,1);
plot(1:J, avg_error_rate, 'o-','linewidth',2,'markersize',3,'markerfacecolor', [0, 0.75, 0.75]);
title('Average Error Rate');
xlabel('J');
ylabel('Average Error Rate');

subplot(3,1,2);
plot(1:J, min_error_rate, 'o-','linewidth',2,'markersize',3,'markerfacecolor',[0, 0.75, 0.75]);
title('Min Error Rate');
xlabel('J');
ylabel('Min Error Rate');

subplot(3,1,3);
plot(1:J, max_error_rate, 'o-','linewidth',2,'markersize',3,'markerfacecolor',[0, 0.75, 0.75]);
title('Max Error Rate');
xlabel('J');
ylabel('Max Error Rate');

figure(2);
plot(1:J, std_error_rate, 'o-','linewidth',2,'markersize',3,'markerfacecolor',[0, 0.75, 0.75]);
title('Standard Deviation of Errors');
xlabel('J');
ylabel('Standard Deviation of Errors');