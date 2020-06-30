% WIDER FACE Evaluation
% Conduct the evaluation on the WIDER FACE validation set. 
%
% Shuo Yang Dec 2015
%
clear;
close all;
addpath(genpath('./plot'));

%evaluate on different settings
setting_name_list = {'easy';'medium';'hard'};
setting_class = '';

legend_name = 'CXM';

fprintf('Plot pr curve under overall setting.\n');
dateset_class = 'Test';

dir_int = sprintf('./CXM');
wider_plot(setting_name_list,dir_int,setting_class,dateset_class);
