%% Lecture 1 Practical Exercise from the  UCL Institute of Cognitive 
%  Neuroscience Matlab Course. All course details and content - including 
%  pre-recorded lectures, slides, practical exercises and solutions - can 
%  be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

%  Problem [1]: Generate three numeric variables - a, b and c - with values 
%  of 2, 3 and 4, respectively. Then compute a series of sums using those
%  variables

a = 2;
b = 3;
c = 4;

x = (a + c) ^ b;

y = (b * (a + sqrt(c))) / a;

z = x / (a * b);

%  Problem [2]: Generate two 3 x 3 matrices (i.e. each with three rows and
%  three columns) named mat1 and mat2, each containing arbitrary integer
%  values (i.e. any set of whole numbers that you choose). Then  compute 
%  both their element wise and matrix product, and store the output in
%  variables called product1 and product2, respectively

mat1 = [9 3 7 ; 2 5 4 ; 1 6 8];
mat2 = [1 3 5 ; 2 4 6 ; 7 8 9];

product1 = mat1 .* mat2;
product2 = mat1 * mat2;

%  Problem [3]: Generate a sequence of numbers from 60 to 3600 in steps of 
%  60; generate a sequence of numbers from 10 to 1 in steps of -1; generate
%  a sequence of numbers from 1 to 365 in steps of 7; generate a sequence 
%  of numbers from 365 in steps of 365 to 3650

seq1 = 60 : 60 : 3600;
seq2 = 10 : -1 : 1;
seq3 = 1 : 7 : 365;
seq4 = 365 : 365 : 3650;

%  Problem [4]: Change the first row of mat1 so that all entries are 5; 
%  change the first column of mat2 so that the entries are the numbers 1, 2
%  and 3; change the entry in the third row, third column of mat2 so that 
%  the entry is NaN

mat1(1,:) = 5;
mat2(:,1) = 1 : 3;
mat2(3,3) = nan;

%  Problem [5]: Generate a cell array with your name, age, and place of 
%  birth as three separate entries in the first column. Generate a 
%  structure called 'myData' with the same information placed in fields 
%  called name, age and place_of_birth, respectively

myDataCell{1,1} = 'Daniel Bush';
myDataCell{2,1} = 38;
myDataCell{3,1} = 'Dagenham';

myData.name = 'Daniel Bush';
myData.age = 38;
myData.place_of_birth = 'Dagenham';

%  Problem [6]: Compute the mean of each row and column in mat1, and place 
%  the results in new variables called row_mean and col_mean, respectively;
%  compute the standard deviation of all entries (i.e. from all rows and 
%  all columns) in mat1; compute the mean of all entries (i.e. from all 
%  rows and all columns) in mat2, ignoring the NaN value

row_mean = mean(mat1,2);
col_mean = mean(mat1);

mat1_std = std(mat1(:));

mat2_mean = nanmean(mat2(:));

%  Problem [7]: Generate a 10 x 5 matrix (i.e. one with ten rows and five 
%  columns) of random numbers, uniformly distributed between 0 and 1; 
%  generate another matrix of the same size, but in this case containing 
%  random numbers that are normally distributed with a mean of 0 and a 
%  standard deviation of 1; generate another matrix of the same size, but 
%  in this case containing random numbers that are normally distributed 
%  with a mean of 0 and a standard deviation of 2

rand_numbers1 = rand(10,5);
rand_numbers2 = randn(10,5);
rand_numbers3 = randn(10,5)*2;