%% SYDE 372 Pattern Recognition 
%% Lab 3: Image Classification
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906

clear all;
close all;
clc;

%% Part 3

load('feat.mat')

[confusion_matrix_f2, percent_correct_f2] = get_confusion_matrix(f2, f2t);

[confusion_matrix_f8, percent_correct_f8] = get_confusion_matrix(f8, f8t);    

[confusion_matrix_f32, percent_correct_f32] = get_confusion_matrix(f32, f32t);    