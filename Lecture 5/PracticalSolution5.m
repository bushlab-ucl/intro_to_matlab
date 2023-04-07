%% Lecture 5 Practical Exercise from the UCL Institute of Cognitive 
%  Neuroscience Matlab Course. All course details and content - including 
%  pre-recorded lectures, slides, practical exercises and solutions - can 
%  be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

%  [1] Import the SeqMemData.mat file into Matlab. This contains sequence
%  and source memory accuracy data for two conditions (successive objects
%  in the sequence either being located in the same room or a different 
%  room) from 38 participants that each completed two experim ental blocks 
%  of the experiment, as well as the average time between viewing 
%  successive objects in the sequence for each participant and condition

%  As you will hopefully remember from the third lecture, and previous 
%  practical exercises, loading a Matlab format data file into the
%  workspace is straightforward to achieve using the 'load' function:
load('SeqMemData')

%  Average the SequenceMemory, SourceMemory and AverageTime values across
%  blocks for each condition (the condition labels are provided in ‘Key’) to
%  obtain mean performance values for each participant in each condition

%  The 'Key' variable indicates that the first and second columns of each
%  variable contain data from the first block, and the third and fourth 
%  columns contain data from the second block, of this experiment.
%  More importantly, the first and third columns contain data for the
%  'same' room condition and the second and fourth columns for the
%  'different' room condition, so we'll need to average the data in each of
%  those columns, across each row - this can be achieved using the 'mean'
%  function, indicating that we wish to average data in all rows, using a 
%  colon as the first index, and the corresponding pair of columns (i.e. 1 
%  and 3 or 2 and 4) as the second index, then providing a second input
%  which tells the 'mean' function that we wish to take the average in the
%  second dimension, i.e. across rows, rather than down each column

seqMem.SameDat  = mean(SequenceMemory(:,[1 3]),2);
seqMem.DiffDat  = mean(SequenceMemory(:,[2 4]),2);
srcMem.SameDat  = mean(SourceMemory(:,[1 3]),2);
srcMem.DiffDat  = mean(SourceMemory(:,[2 4]),2);
avgTime.SameDat = mean(AverageTime(:,[1 3]),2);
avgTime.DiffDat	= mean(AverageTime(:,[2 4]),2);
clear SequenceMemory SourceMemory AverageTime Key

%  Next, assess whether there is any significant difference in mean 
%  sequence memory accuracy between conditions across participants, and in
%  mean source memory accuracy between conditions across participants

%  So, the first thing we need to do is ascertain which statistical test we
%  should use, and this will be determined by whether or not the data is
%  normally distributed - so first we'll run the Lilliefors test...
[seqMem.SameNrmH,seqMem.SameNrmP,seqMem.SameNrmStat]    = lillietest(seqMem.SameDat);
[seqMem.DiffNrmH,seqMem.DiffNrmP,seqMem.DiffNrmStat]    = lillietest(seqMem.DiffDat);

%  ...which shows that the data is NOT normally distributed (i.e. the null
%  hypothesis can be rejected, h = 1 and p < 0.05), in which case, we can
%  compare the median values in each condition using the Wilcoxon signed
%  rank test, implemented using the 'signrank' function:
[seqMem.condP,seqMem.condH,seqMem.condStats]            = signrank(seqMem.SameDat,seqMem.DiffDat);

%  Now we can follow the same procedure for the source memory data which,
%  again, is not normally distributed in the 'different' room condition, so
%  should be assessed using the signrank function, as described above:
[srcMem.SameNrmH,srcMem.SameNrmP,srcMem.SameNrmStat]    = lillietest(srcMem.SameDat);
[srcMem.DiffNrmH,srcMem.DiffNrmP,srcMem.DiffNrmStat]    = lillietest(srcMem.DiffDat);
[srcMem.condP,srcMem.condH,srcMem.condStats]            = signrank(srcMem.SameDat,srcMem.DiffDat);

%  Assess whether there is a significant correlation between average time
%  and sequence memory accuracy, and between average time and source memory
%  within each condition across participants

%  This is fairly straightforward to implement, using the 'corr' function
%  described in the lecture:
[seqMem.SameTimeAccR,seqMem.SameTimeAccP]   = corr(avgTime.SameDat,seqMem.SameDat);
[seqMem.DiffTimeAccR,seqMem.DiffTimeAccP]   = corr(avgTime.DiffDat,seqMem.DiffDat);

[srcMem.SameTimeAccR,srcMem.SameTimeAccP]   = corr(avgTime.SameDat,srcMem.SameDat);
[srcMem.DiffTimeAccR,srcMem.DiffTimeAccP]   = corr(avgTime.DiffDat,srcMem.DiffDat);

%  Finally, assess whether there is a significant correlation between 
%  sequence and source memory scores in each condition across participants
[seqMem.SameSrcAccR,seqMem.SameSrcAccP]     = corr(seqMem.SameDat,srcMem.SameDat);
[seqMem.DiffSrcAccR,seqMem.DiffSrcAccP]     = corr(seqMem.DiffDat,srcMem.DiffDat);

%  Save the test statistics and p-values from each analysis, as well as the
%  averaged data, in a *.mat file named ‘SeqMemAnalysis.mat’

%  Conveniently, as you can see above, we have stored the raw data and
%  statistical results pertaining to each different variable in structures
%  named 'seqMem', 'srcMem', and 'avgTime', so we can now use the 'save'
%  function, followed by the specified filename and then this list of
%  variable names, to save all of the relevant data:
save('SeqMemAnalysis.mat','seqMem','srcMem','avgTime')
clear seqMem srcMem avgTime

%  [2] Import all information from the Data1.xlsx file into Matlab. 

%  In this case, the raw data is stored in an Excel spreadsheet, so we will
%  use the 'xlsread' function (as described in the third lecture) to read
%  in the numeric data, ignore the text data, and read in all of the 'raw'
%  data to use as a reference. In this case, we'll then separate each 
%  variable into different fields of a structure called 'data':
[num,~,raw]     = xlsread('Data1.xlsx');
data.ages      	= num(:,3);
data.cond1acc   = num(:,5);
data.cond1RT    = num(:,6);
data.cond2acc   = num(:,7);
data.cond2RT    = num(:,8);
data.handed     = raw(2:25,2);
clear num raw

%  Compute the mean and standard error of accuracy and RT values for each 
%  condition across all participants

%  Computing the mean is straightforward enough - we don't need a second
%  input in this case, as we're taking the mean of each column (i.e. across
%  all participants), but to compute the standard error, we'll need to know
%  the size of the sample (i.e. the number of participants), which is the
%  same as the number of rows in any of the 'data' variables (i.e. ages):
nParts          = size(data.ages,1);
stats.meanAcc   = [mean(data.cond1acc) mean(data.cond2acc)];
stats.SE_Acc    = [std(data.cond1acc)  std(data.cond2acc)] ./ sqrt(nParts);
stats.meanRT    = [mean(data.cond1RT) mean(data.cond2RT)];
stats.SE_RT     = [std(data.cond1RT)  std(data.cond2RT)] ./ sqrt(nParts);
clear nParts

%  Assess whether there is any significant difference in accuracy and 
%  reaction times between conditions across all participants

%  As described above, the first thing we must do is test for normality,
%  and we'll use the Anderson-Darling test in this case (just to
%  demonstrate the use of a different function, there is no particular 
%  reason to choose either the Lilliefors, Anderson-Darling or Jarques-Bera
%  test for this purpose, as far as I am aware - all are equivalent):
[stats.normTest.cond1Acc_H,stats.normTest.cond1Acc_p,stats.normTest.cond1Acc_stat]	= adtest(data.cond1acc);
[stats.normTest.cond2Acc_H,stats.normTest.cond2Acc_p,stats.normTest.cond2Acc_stat]	= adtest(data.cond2acc);

[stats.normTest.cond1RT_H,stats.normTest.cond1RT_p,stats.normTest.cond1RT_stat]     = adtest(data.cond1RT);
[stats.normTest.cond2RT_H,stats.normTest.cond2RT_p,stats.normTest.cond2RT_stat]     = adtest(data.cond2RT);

%  This time, the data are normally distributed, so we can make out
%  subsequent comparisons using the Student's t-test:
[stats.diffTest.Acc_H,stats.diffTest.Acc_P,stats.diffTest.Acc_CI,stats.diffTest.Acc_stat]   = ttest(data.cond1acc,data.cond2acc);
[stats.diffTest.RT_H,stats.diffTest.RT_P,stats.diffTest.RT_CI,stats.diffTest.RT_stat]       = ttest(data.cond1RT,data.cond2RT);

%  Assess whether there is any difference in mean accuracy between 
%  participants that are left- and right- handed

%  Now, first of all, we need to extract numerical or logical indices
%  corresponding to left and right handed participants from the cell array
%  'data.handed' that we created above. One easy way to do this is using
%  the 'strcmp' function, which returns a value of true wherever the entry
%  in a cell array (provided as the first input) matches a particular 
%  string (provided as the second input). This way, we can extract logical
%  arrays with the indices of all right and left handed participants:
rightHanded     = strcmp(data.handed,'R');
leftHanded      = strcmp(data.handed,'L');

%  After that, we can use the 'ttest2' function to compare data between
%  these different groups of participants:
[stats.handTest.Acc1_H,stats.handTest.Acc1_P,stats.handTest.Acc1_CI,stats.handTest.Acc1_stat]	= ttest2(data.cond1acc(rightHanded),data.cond1acc(leftHanded));
[stats.handTest.Acc2_H,stats.handTest.Acc2_P,stats.handTest.Acc2_CI,stats.handTest.Acc2_stat]	= ttest2(data.cond2acc(rightHanded),data.cond2acc(leftHanded));
clear rightHanded leftHanded

%  Compute the correlation coefficient and p value for the relationship 
%  between age and mean accuracy across both conditions for each 
%  participant

%  Again, this is straightforward to achieve, using the 'corr' function:
[stats.ageAcc.Acc1_r,stats.ageAcc.Acc1_p] = corr(data.ages,data.cond1acc);
[stats.ageAcc.Acc2_r,stats.ageAcc.Acc2_p] = corr(data.ages,data.cond2acc);

%  Save the mean and standard error of accuracy and RT values for each 
%  condition, as well as the results of all statistical analyses, in a 
%  *.mat file named ‘Data1Analysis.mat’

%  Conveniently, we have stored all of the raw data in a structure called
%  'data' and all of the statistical results in a structure called 'stats',
%  which we can then save using the 'save' function:
save('Data1Analysis.mat','data','stats');
clear data stats