
%  Cheng-Ming Chen, Andrea P. Guevara 2019
%
%  ------------
%  Instructions
%  ------------
%
% Process the data in a single 3D matrix H as folows:
% CPLXCHANT[Number of Antennas, Number of Realizations, Number of UE].


function [CPLXCHANT] = CHProcessing(CHResponseReal,CHResponseImag,NumUE,AntNum,SubNum)
close all

[m,n] = size(CHResponseReal);
CPLEXCH = zeros(m,n); 

% remove realization from the beginning of the captures
removeIdx = 0;

% total remove number of samples
TalRmvStartIdx = removeIdx*AntNum*SubNum;
RealNum = 30; % force a limited realization number as there is a memory limitation 35
CHNUM = RealNum*SubNum;
CPLXCHANT = zeros(AntNum,CHNUM,NumUE);
for USERID = 1:NumUE
    CPLEXCH(:,USERID) = CHResponseReal(:,USERID)+1i.*CHResponseImag(:,USERID);
    for ant = 1:AntNum       
        for p = 1:RealNum
            % not assign unit gain for all antennas
            OrigStartIdx = (p-1)*AntNum*SubNum+(ant-1)*SubNum;
            if OrigStartIdx > TalRmvStartIdx
                OrigStartIdx = OrigStartIdx+TalRmvStartIdx;
            end
            FixIdx   = OrigStartIdx;%+(p-1)*AntNum*SubNum+(ant-1)*SubNum;
            StartIdx = FixIdx+1;
            EndIdx   = FixIdx+SubNum;
            CPLXCHANT(ant,(p-1)*SubNum+1:p*SubNum,USERID) = CPLEXCH(StartIdx:EndIdx,USERID).';
        end
    end        
end
end
