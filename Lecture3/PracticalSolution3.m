%% Lecture 3 Practical Exercise from the UCL Institute of Cognitive 
%  Neuroscience Matlab Course. All course details and content - including 
%  pre-recorded lectures, slides, practical exercises and solutions - can 
%  be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

%  Problem [1]: Enter the following commands into the Matlab command 
%  window:

load handel
sound(y,Fs)

%  Next, generate a Matlab data file in your current folder called music 
%  that contains the variable y; clear the variable y from your workspace; 
%  generate a variable called z which is the same size as y but is 
%  comprised of random numbers with a mean of zero and a standard deviation
%  of one; add this new variable to the music data file; and, finally, 
%  execute the following command: sound(z,Fs)

%  As described in the lecture, there are several different commands that
%  can be used to save the variable y in a file called music, each of which
%  is functionally equivalent:

save music y
save music.mat y
save('music','y')
save('music.mat','y')

%  Next, we need to clear the variable y, but first, we can extract the
%  size of that variable to help us with the next part of the problem. The
%  'size' command will return the size of the variable y along each
%  dimension - i.e. it will return two values, stored within a single
%  output in this case, corresponding to the number of rows and the number
%  of columns:

sizeY = size(y); 
clear y

%  Now, we can used the randn function to generate normally distributed
%  random numbers with a mean of zero and a standard deviation of one, and
%  specify the size of the output we want by providing the sizeY variable
%  from above as an input to that function:

z = randn(sizeY); 

%  Alternatively, we could have just noted down the number of rows (73113)
%  and number of columns (1) in the variable y before we cleared that, and
%  use these as two inputs to the randn function to specify the number of
%  rows and columns of random numbers we wished to generate:

z = randn(73113,1);

%  Now, we can add this new variable to the existing data file using the
%  '-append' command, when we call the save function. Again, there are a
%  few different ways of doing this, all of which are functionally
%  equivalent, for example:

save music z -append
save('music.mat','z','-append')

%  Finally, we can listen to our stream of random numbers (which should
%  sound like white noise) by entering the final command:

sound(z,Fs)

%  Problem [2] Generate a 50 row x four column matrix of random integers 
%  between one and 20; export this variable to the first worksheet in an 
%  Excel spreadsheet called DataSheet, with the first entry (i.e. the top 
%  left corner of the matrix) appearing in entry C3; generate a *.csv file
%  called CSVFile that contains the same data; generate a cell array with 
%  one row and four columns, containing text entries of Score1, Score2, 
%  Score3 and Score4, respectively; add this text to the Excel spreadsheet 
%  you created above, with the first entry (i.e. the left hand side of the 
%  cell array) appearing in entry B3

%  So, by now we should be pretty familiar with how to generate arrays of
%  random numbers. In this case, we wish to generate random integers, so we
%  will use the randi function. As the corresponding help information will
%  tell you, we can give randi three inputs, corresponding to the maximum
%  integer value we wish to generate, the number of rows and the number of
%  columns of data, like so:

myData = randi(20,50,4);

%  Now, as described in the lecture, we can export this variable to an
%  Excel spreadsheet using the xlswrite function. In this case, we can give
%  the function four inputs, corresponding to the output filename
%  (DataSheet), the variable we wish to write to that file (myData), the
%  worksheet index or name we wish to write to (1 or 'Sheet1'), and the
%  range of entries within that worksheet where we want that data to
%  appear. As the corresponding help information will tell you, for this
%  last input, we can either specify the whole range (which we could work
%  out, from the size of myData, would be C3 : F52), or we can simply
%  specify the start entry (i.e. where the top left corner of the matrix
%  should be placed, which is C3):

xlswrite('DataSheet',myData,'Sheet1','C3:F52')
xlswrite('DataSheet',myData,1,'C3')

%  To generate a CSV file containing the same data, we use the csvwrite
%  function, with very similar syntax, but omitting the sheet index or name
%  and the range of entries we wish the data to be placed in:

csvwrite('CSVFile.csv',myData)

%  In this case, however, note that it is important to specify a file
%  extension (i.e. to add '.csv' after your file name), otherwise Matlab
%  may generate a file with no file extension

%  Finally, you should remember from earlier lectures that we generate a
%  cell array using curly brackets, so we can produce the header
%  information like so (remembering that we use spaces or commas to place
%  items in the same row, in different columns):

header = {'Score1','Score2','Score3','Score4'};

%  ...and then we can add this text to the Excel spreadsheet we generated 
%  earlier using the same syntax again, but specifying a new starting 
%  location (C2) or range of values (C2:F2):

xlswrite('DataSheet',header,'Sheet1','C2:F2')
xlswrite('DataSheet',header,1,'C2')

%  Problem [3]: Write a script that first generates a 100 row x 101 column 
%  matrix named ‘Data’ containing random numbers that are normally 
%  distributed with a mean of 700 and a standard deviation of 100, and then
%  completes the following steps (listed below)

%  So, first, we need to generate our Data matrix, again using the randn
%  function to obtain normally distributed random numbers, but in this
%  case, we need to adjust the mean and standard deviation of that
%  distribution, which we can do (as described in the help information) by
%  adding and multiplying by constant values, respectively:

Data = 700 + randn(100,101)*100;

%  Next, we are asked to replace any values that are less than 500 with a 
%  value of 500. There are two ways to achieve this, either using the find
%  function to generate a list of numeric indices for values less than 500,
%  and then using those numeric indices to adjust the relevant values in
%  Data, or by using logical indexing to achieve the same result in one
%  line of code:

smallVals = find(Data<500);
Data(smallVals) = 500;
clear smallVals

Data(Data<500) = 500;

%  Next, we are asked to add 100 to the 20th, 25th, 30th and 35th rows.
%  Again, we can achieve this either by generating a separate variable to 
%  store the numeric row indices, or by using those numeric indices
%  directly:

addRows = 20 : 5 : 35;
Data(addRows,:) = Data(addRows,:) + 100;
clear addRows

Data(20:5:35,:) = Data(20:5:35,:) + 100; 

%  Next, we are asked to multiply the 90th to 100th rows by 1.5, which we
%  can achieve using much the same syntax:

Data(90:100,:) = Data(90:100,:) .* 1.5;

% Next, we are asked to change the first column to the numbers 1 to 100:

Data(:,1) = 1 : 100;

%  Next, we are asked to compute the mean of each row, excluding the first 
%  column, and store it as a variable called MeanRT. Note that we can use a
%  second input to the mean function, as described in the corresponding 
%  help information, to obtain the mean of each row of a matrix, rather 
%  than the mean of each column (which is the default output, if only a 
%  single input is provided to the function), and also remember that we
%  wish to examine all rows, but only the second to 101st columns:

MeanRT = mean(Data(:,2:101),2);

%  Next, we are asked to generate a variable called Conditions which 
%  consists of 100 randomintegers between 1 and 2 in a single column. This
%  should be fairly straightforward by now:

Conditions = randi(2,100,1);

%  Next we are asked to compute the standard error (i.e. the standard 
%  deviation, divided by the square root of the number of samples) for each
%  condition. Again, there are two ways to do this, either step by step, by
%  extracting the number of samples in each condition, then the set of mean
%  RT values for each condition separately, then computing the standard
%  error using those variables, before clearing them:

nCond1 = sum(Conditions==1);            % How many samples are in condition 1?
nCond2 = sum(Conditions==2);            % How many samples are in condition 2?
MeanRT1 = MeanRT(Conditions==1);        % What are the mean RTs from condition 1?
MeanRT2 = MeanRT(Conditions==2);        % What are the mean RTs from condition 2?
StdErr1 = std(MeanRT1) ./ sqrt(nCond1); % Compute the standard error for condition 1
StdErr2 = std(MeanRT2) ./ sqrt(nCond2); % Compute the standard error for condition 2
clear nCond1 nCond2 MeanRT1 MeanRT2     % Clear the unwanted variables from memory

%  ...or, we can collapse all of that code into a single line, like so:

StdErr1 = std(MeanRT(Conditions==1)) ./ sqrt(sum(Conditions==1));
StdErr2 = std(MeanRT(Conditions==2)) ./ sqrt(sum(Conditions==2));

%  Finally, we are asked to perform a two sample t-test to compare the mean
%  reaction times for participants in each condition. A quick Google search
%  will tell us that ttest2 is the function we need to accomplish this, and
%  the help information for that function will describe the inputs that it
%  requires (the two distributions of values, plus the optional parameters 
%  that you can set: the p value threshold (or significance level), what
%  tail test you wish to perform, whether we expect the variance to be
%  equal or unequal, and which dimension of the data we wish to perform the
%  test along); and the outputs it provides (whether or not we can reject 
%  the null hypothesis, the p value, the confidence intervals, and other 
%  statistical details). In this case, we only need to provide the data 
%  inputs, and use default values for the other parameters (i.e. not 
%  specify those), but we may as well have a look at all four outputs:

[h,p,ci,stats] = ttest2(MeanRT(Conditions==1),MeanRT(Conditions==2));

%  I would expect this to tell you that there is no difference between
%  conditions (i.e. h = 0, because the null hypothesis can not be
%  rejected), but if not, then you have found your first false positive 
%  result!