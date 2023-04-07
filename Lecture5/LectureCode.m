% Power calculation
meanSame    = 0.45;
meanDiff    = 0.35;
stdPooled   = 0.15;

nout        = sampsizepwr('t',[meanSame stdPooled],meanDiff);

% Excel data
num         = xlsread('Data1.xlsx');
age         = num(:,3);
cond1acc    = num(:,5);
cond2acc    = num(:,7);
cond1RT     = num(:,6);
cond2RT     = num(:,8);
clear num

% Test for normality
load('SeqMemData.mat')
SameRoomRT  = mean(AverageTime(:,[1 3]),2);
DiffRoomRT  = mean(AverageTime(:,[2 4]),2);
% Block1RT    = mean(AverageTime(:,[1 2]),2);
% Block2RT    = mean(AverageTime(:,[3 4]),2);

SameRoomSeq = mean(SequenceMemory(:,[1 3]),2);
DiffRoomSeq = mean(SequenceMemory(:,[2 4]),2);
% Block1Seq   = mean(SequenceMemory(:,[1 2]),2);
% Block2Seq   = mean(SequenceMemory(:,[3 4]),2);

SameRoomSrc = mean(SourceMemory(:,[1 3]),2);
DiffRoomSrc = mean(SourceMemory(:,[2 4]),2);
% Block1Src   = mean(SourceMemory(:,[1 2]),2);
% Block2Src   = mean(SourceMemory(:,[3 4]),2);


