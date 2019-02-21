%  Cheng-Ming Chen, Andrea P. Guevara 2019
%
%  ------------
%  Instructions
%  ------------
% 
%  This file  is used only for loading the channel, and keep all the variables in the workspace
%  we want to save time not keep loading the same data everytime
% 
%  we have 100 subcarriers as one subcarrier per RB
%  we have 64, 32 and 16 channels versions
%  we have collocated and distributed versions
%
function [CHResponseReal,CHResponseImag] = LoadMeasCH(GeoCase,AntNum)
% load only once, so we don't have to reload and waste time there

switch GeoCase
    case {'collocated'}
        filenameReal   = ['NumAnt ',num2str(AntNum),' Scenario collocated_0801 run 0 Real.csv'];
        filenameImag   = ['NumAnt ',num2str(AntNum),' Scenario collocated_0801 run 0 Imag.csv'];
    case {'distributed'}
        filenameReal   = ['NumAnt ',num2str(AntNum),' Scenario distributed_0801 run 0 Real.csv'];
        filenameImag   = ['NumAnt ',num2str(AntNum),' Scenario distributed_0801 run 0 Imag.csv'];
end

CHResponseReal = dlmread(filenameReal);
CHResponseImag = dlmread(filenameImag);


end