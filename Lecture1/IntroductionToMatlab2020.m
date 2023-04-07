%% This script accompanies the "Introduction to Matlab" lecture from the
%  UCL Institute of Cognitive Neuroscience Matlab Course. All course 
%  details and content - including pre-recorded lectures, slides, practical
%  exercises and solutions - can be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk



%% 1. Computing a Sum in the Command Window
%  Try typing the following statements into the command window, one at a
%  time, and then pressing the 'return' key to execute each command:

2+2

2 * 2

4     /     2

2^2

%  This should demonstrate that Matlab ignores spaces between commands, and
%  will perform addition (+), subtraction (-), multiplication (*),
%  division (/), and exponentiation (^, i.e. 'to the power of') operations, 
%  just like a calculator



%% 2. Using Variables
%  Try typing the following statements into the command window, one at a
%  time, in the following order, and then pressing the 'return' key. Keep 
%  an eye on the values assigned to each variable in the workspace window:

a=2

b=2;

a+b

ans+2

ans+2

a

%  To get a list of all the variables currently in the workspace, try 
%  typing:

who

%  Now try entering the following statements into the command window, one
%  at a time, in the following order:

clear a

a

%  The last statement should produce an error, as you have 'cleared' the
%  variable 'a' from the workspace. This means that the variable no longer 
%  exists in Matlab's memory, and hence cannot be displayed on the screen, 
%  or have any operations performed on it. To get rid of all remaining 
%  variables in the workspace (i.e. 'b' and 'ans') type:

clear

%  Hopefully you can see that the workspace is now empty. Typing 'clear'
%  without the names of any specific variables after it will clear all
%  variables in the workspace. Note that once variables have been cleared,
%  there is no way of recovering them - Matlab does not have an 'undo'
%  function!



%% 3. Using Variables II
%  Try typing the following statements into the command window, one at a
%  time, in the following order, and then pressing the 'return' key. Keep 
%  an eye on the values assigned to each variable in the workspace window:

cakes = 1;
Cakes = 2;

cakes*2

Cakes*2

%  As you should be able to see, this creates two different variables in
%  the workspace, because Matlab is case sensitive, and so you must be 
%  careful not to get them confused in subsequent calculations. Also, 
%  notice that performing operations with those variables does not change 
%  their stored  value in the workspace. To do so, you need to include a 
%  full expression, with an equals sign, to 're-assign' the value of the 
%  corresponding variable:

cakes = cakes*2

%  As you can see, the value of the variable 'cakes' in the workspace has 
%  now been updated. Now try:

1cake = 1;

%  The last statement should produce an error, as Matlab variable names
%  cannot begin with a number. Now try:

end = 1;
    
%  The last statement should also produce an error, as 'end' is a reserved
%  word used when writing conditional statements or loops in Matlab (which 
%  you will learn how to do in a future lecture). Finally, try these 
%  statements:

cake.1 = 1;
cake_1 = 1;

%  The first of those statements should also produce an error, as you
%  cannot use punctuation in a variable name (although we will return to 
%  this point later), but the second statement is OK, as underscores are 
%  accepted as part of a variable name by Matlab. Now try:

Cakes*pi

%  Even though we have not assigned a value to the variable 'pi', and so it 
%  does not appear in the workspace, this will not produce an error, 
%  because a value for 'pi' is stored as a built in variable in Matlab 
%  (referring to the transcendental number that relates the circumference 
%  of a circle to its diameter).

%  One must take care, however, because these built in variables can be
%  manually overwritten. For example, try each of these commands in turn:

pi = 10;
Cakes*pi
clear pi
Cakes*pi

%  You should get two different results, depending on whether the
%  user-defined or built in value of 'pi' is being used.



%% 4. Vectors and Matrices
%  Try typing the following statements into the command window, one at a
%  time, and then pressing the 'return' key. Keep  an eye on the values 
%  assigned to each variable in the workspace.

my_first_vector = [1 5 9 4 3 7 9 10]

my_second_vector = [1 ; 5 ; 9 ; 4 ; 3 ; 7 ; 9 ; 10]

%  As you can see, entering several numbers within square brackets 
%  generates a vector (i.e. a list) of numbers. If the numbers within the 
%  square bracket are separated by semi-colons, then they are entered as a 
%  single column. Otherwise, they are entered as a single row. Now try the
%  following:

my_third_vector = 1 : 10

my_fourth_vector = 1 : 3 : 22

%  The colon notation tells Matlab that you wish to generate a sequence of
%  numbers defined by first_number : step_size : last_number. Note that if
%  you do not define a step size, i.e. if you just ask for first_number :
%  last_number, then the default step_size is always 1.

%  Also note how you do not need to use square brackets when you are 
%  defining a linear progression of numbers using the colon notation, 
%  although using square brackets will produce exactly the same result:

my_third_vector = [1 : 10]

my_fourth_vector = [1 : 3 : 22]

%  Now try:

my_first_vector.*2

my_second_vector.^2

%  Note how the last two operations were performed individually on each
%  element (i.e. entry) in the vector - this is known as an element-wise 
%  operation, due to the use of the '.' prefix. Also note how the output 
%  retains the same size as the original matrix (i.e. all one row or all 
%  one column). Now try:

my_first_matrix = [1 1 ; 1 1]

my_second_matrix = [2 2 ; 3 3]

my_third_matrix = [1 2 5 8 9 10 6 13 ; 4 3 2 7 8 5 0 10 ; 1 2 9 8 6 5 4 3];

my_first_matrix * my_second_matrix

my_first_matrix .* my_second_matrix

%  Notice how the output of the last two operations is different - the
%  first computes the matrix product, and the second computes the
%  element-wise product. At this stage, you will probably most often use 
%  the element-wise operation, so remember to include a '.' prefix when 
%  performing multiplication on vectors or matrices.

%  Next, let's have a look at how we access certain elements within a
%  matrix. Have a look at the output you get if you type:

my_third_matrix(11)

my_third_matrix(2,4)

my_third_matrix(20)

my_third_matrix(2,7)

%  As you can see, elements in the matrix can be accessed using a single
%  input index - whereby Matlab counts down each column in turn, starting 
%  from the top left - or by a row and column input. In the latter case, 
%  the row index always comes first, then the column index. Now try:

my_third_matrix(2,:)

my_third_matrix(:,2)

%  As you can see, using the colon notation means that an entire row or
%  column will be output. We can also use this notation to replace
%  individual elements in the matrix, for example, try typing the
%  following:

my_third_matrix

my_third_matrix(2,4) = 0;

my_third_matrix(2,7) = 7;

my_third_matrix

%  Hopefully, you can see that the '0' and '7' values in 'my_third_matrix'
%  have switched places, as each was re-assigned. Similarly, we can use:

my_third_matrix(1,:) = 0;

my_third_matrix

%  ...and now all of the elements in the first row have now been replaced 
%  by zeros. Now have a look at the output when you collapse the matrix:

my_third_matrix(:)

%  Matlab places each column of the matrix on top of the other in order to
%  output them. If you're not convinced by this, double click on
%  'my_third_matrix' in the workspace and compare the output on your screen
%  with the display in the Variable Editor window. Also, try clicking on
%  individual elements in the Variable Editor window and entering new
%  values. This should demonstrate how matrices can be directly adjusted
%  through the Variable Editor window. 



%% 5. Strings, Cells and Structures
%  String variables are text, rather than numeric, but can be assigned,
%  accessed and concatenated in much the same way as numeric arrays. For
%  example, try entering the following commands, one at a time:

words_and_letters = 'A nice long string of characters for us to store';

words_and_letters(8)
words_and_letters(9)

words_and_letters2 = ' and then demonstrate some concatenation with';

words_and_letters = [words_and_letters words_and_letters2]

%  Like numeric arrays, string matrices must have an equal number of 
%  elements in each row and column. Hence, if you want to have several 
%  lines of text in a single variable, they must be exactly equal in 
%  length, meaning you have to each the row with spaces, or face an error.
%  Hence, this should produce a concatenation error:

Names = ['Albert Einstein' ; 'Marilyn Monroe' ; 'Frank Sinatra']

%  ...but this should not:

Names = ['Albert Einstein' ; 'Marilyn Monroe ' ; 'Frank Sinatra  ']

%  The string array can be accessed exactly like a numeric one, for 
%  example:

Names(1,:)
Names(:,10)

%  Making each row of text an equal length can be a pain, so instead, we 
%  may want to use a cell structure, in which each element can differ in 
%  size. Cell array elements are assigned and accessed with curly brackets, 
%  i.e.:

Names2{1,1} = 'Albert Einstein';
Names2{2,1} = 'Marilyn Monroe';
Names2{3,1} = 'Frank Sinatra';

Names2{3,1}

% Individual elements within each entry of the cell array can be accessed
% with a combination of curly and normal brackets, like so:

Names2{2,1}(1,:)
Names2{2,1}(1,4)

%  It is also important to note that cell arrays do not have to contain
%  strings, they can also be used to store numeric arrays of different 
%  sizes, for example, try the following:

Numbers{1,1} = 1:10;
Numbers{2,1} = [1 2 3 ; 4 5 6 ; 7 8 9];
Numbers{3,1} = 100;

%  Indeed, cell arrays can contain a combination of different variable
%  types, such as both strings and numeric arrays:

Data{1,1} = 'Albert Einstein';
Data{2,1} = [10 8 7 12 15 18 6 5 9 11];

%  Next, structures can also be used to store different variable types 
%  within a single global variable. This may be useful for storing all the
%  information relating to a single participant in a behavioural study, for
%  example. Structures and the names of 'fields' within those structures
%  are assigned using full stops, as follows:

Participant1.Name = 'Albert Einstein';
Participant1.BirthYear = 1879;
Participant1.Gender = 'Male';
Participant1.Data = [10 8 7 12 15 18 6 5 9 11];
Participant1.Cities_of_Residence{1,1} = 'Ulm';
Participant1.Cities_of_Residence{2,1} = 'Berlin';
Participant1.Cities_of_Residence{3,1} = 'Pasadena';

%  Entering the name of the structure will then list all the variables
%  within that structure, and individual variables can be accessed using
%  the same syntax as above, i.e. try these one at a time:

Participant1
Participant1.BirthYear
Participant1.Data(7)
Participant1.Cities_of_Residence{3,1}(3:5)

%  Next, logical arrays are a special form of numeric variable that can be
%  very useful for programming (as we will find out in future lectures).
%  Entries in a logical array can only take values of 'true' or 'false',
%  often denoted by Matlab as 1 and 0. Otherwise, they are accessed and
%  indexed in exactly the same way as standard numeric variables. For 
%  example, try the following:

logical_array   = [true false ; false true ; true false];

logical_array(2,:)

logical_array(:,2)

logical_array(:,1)  = true;

logical_array(:,2)  = false;

logical_array(2,:)

%  Hopefully this demonstrates how to create a logical array, the fact that
%  true and false entries are denoted with values of 1 and 0, respectively;
%  and how we can view specific and edit specific entries within a logical
%  array in much the same way as the numeric variables above

%  Finally, try double clicking on the name of this structure in the
%  workspace - once again, this should open the Matlab 'Variable Editor', 
%  where you can inspect the contents of any variable. Importantly, you can
%  also edit the content of variables in the Variable Editor. For example, 
%  try typing:

Data = [];

%  ...and then clicking on 'Data' in the workspace, to open it in the
%  Variable Editor. You can then enter numbers in each element of the 
%  'Data' variable by hand, as you would in Excel. 



%% 6. The Command History
%  Now, try typing 'Ca' into the command window and then pressing up - this
%  should retrieve the 'Cakes*pi' operation from the command history. Hit 
%  return to execute the command - whether or not this is successful will
%  depend on whether or not you have cleared the variable 'Cakes' from the
%  workspace.

%  Now try typing 'my' and pressing up, repeatedly. This should cycle
%  through all of the operations and assignments performed on the matrices
%  and vectors above.

%  Also try double clicking on operations that appear in the command
%  history, to see how they are performed again in the command window

%  Finally, type:

clc

%  ...and hit return. This will clear all previous commands from the
%  command window, but you can still press 'up' to retrieve them, they
%  will still all appear in the command history, and all of the variables
%  still exist in the workspace (because we have not 'clear'ed them)



%% 7. Some Basic Functions
%  One of the reasons that Matlab is so popular is that it comes with a
%  large library of built-in functions (and many more, written by third
%  parties, are available online). Beyond the simple syntax we have covered
%  above, and will expand on in the next lectures, the only trick to using 
%  Matlab is to learn these different functions and how to use them. If 
%  there is any kind of operation you would like to perform in Matlab, the 
%  best thing to do is Google it, and you will usually find that a function 
%  to perform that operation already exists. 

%  The most straightforward way to use functions is to type the name of the
%  function, and then provide the input that function needs in brackets,
%  after the function name. As a simple example, let's try using the
%  function 'mean', which computes the average (i.e. mean) of a set of
%  numbers. Try:

mean([3 4 5])

%  As you will see, this computes the mean of the numbers 3, 4 and 5 (which
%  should be 4). Note that we have to provide the input as a single vector 
%  (i.e. within square brackets), otherwise Matlab will get confused.
%  Alternatively, we could try typing:

mean(my_second_vector)

%  ...which is pretty straightforward, and will give you the mean of all
%  the values in 'my_second_vector'. Note how the result is placed into the
%  'ans' variable. Now try:

mean(my_second_matrix)

%  You will notice that you get two answers here. By default, if asked for
%  the mean of a matrix, Matlab will return the mean of each column
%  separately. In order to obtain the mean along a different dimension of
%  the matrix, use the notation:

mean(my_second_matrix,2)

%  This now takes the mean along each row (i.e. dimension number 2) of the 
%  matrix, so the output will be different. 

%  Now let's have a look at 'std', which computes standard deviation with
%  much the same syntax as 'mean':

std(my_third_vector)

std(my_second_matrix)

%  However, in this case, the function 'std' takes another input before the
%  dimension along which you want the standard deviation computed, so to
%  get the standard deviation of each row in the matrix, you need to type:

std(my_second_matrix,[],2)

%  There is no way of knowing, intuitively, exactly what inputs each
%  function requires, on in which order. The only way to build up this
%  knowledge is through extensive use of Matlab and frequent visits to the
%  help documentation, which will be explained in more detail at the end of
%  this lecture.

%  Now let's have a look at 'min' and 'max'. These are pretty
%  straightforward, each computing either the minimum or maximum of a
%  vector or matrix, with exactly the same syntax as 'std', so try:

min(my_fourth_vector)

max(my_fourth_vector)

min(my_second_matrix)

max(my_second_matrix,[],2)

%  Now, it is frequently useful, when programming experiments (in later
%  lectures!), to generate random numbers or random permutations of
%  numbers, to jitter a stimulus presentation time, or assign the order of 
%  stimulus presentation, for example. Depending on your exact
%  requirements, there are two main functions for generating random
%  numbers. 'rand' produces random numbers that are uniformly distributed
%  between zero and one, while 'randn' produces random numbers that are
%  normally distributed around zero with a standard deviation of one. So
%  first, try typing 'rand' and then 'randn' over and over again and see
%  what this produces:

rand

randn

%  Hopefully, this will output a sequence of random numbers to the screen. 
%  These functions can also be used to generate vectors or matrices of
%  random numbers, so to check if they are doing what they are supposed to,
%  let's first generate some very large random number vectors. To do this,
%  we just supply the size of the vector we want as inputs to each
%  function, as follows:

uniform_randoms = rand(10000,1);
Gaussian_randoms = randn(10000,1);

%  These variables should each have 10000 rows and one column, according to
%  the inputs we specified. Now we can look at the means, standard 
%  deviations, mins and maxes, to check that these functions are producing 
%  the kind of output they are supposed to. First:

mean(uniform_randoms)
max(uniform_randoms)
min(uniform_randoms)

%  ... should give a mean of around 0.5, a maximum close to 1, and a
%  minimum close to zero. 

%  Now:

mean(Gaussian_randoms)
std(Gaussian_randoms)

%  ... should give a mean of around 0, and a standard deviation of around 1
%  We can also check whether the size of the random number matrices we have
%  generated are the same as we requested, by typing:

size(Gaussian_randoms)
size(uniform_randoms)

%  In each case, the answer outputted should tell you that there are 10000
%  rows (remembering that the number of rows is always entered and
%  displayed first) and 1 column (which comes second). 

%  If you are only interested the size of one particular dimension of a
%  matrix, you can provide a second input to tell the 'size' function which
%  dimension you are interested in, for example:

size(Gaussian_randoms,1)
size(Gaussian_randoms,2)

%  ...will give you the number of rows and number of columns separately. It
%  is also worth knowing that there is another function, called 'length',
%  which will give you the size of the largest dimension of any matrix, no
%  matter which dimension that is (i.e. the number of rows if there are 
%  more rows than columns, and the number of columns if there are more 
%  columns than rows). For example, try:

length(Gaussian_randoms)

%  This can often be confusing, however, if the size of matrices might
%  change (i.e. sometimes it will give you the number of rows, and 
%  sometimes the number of columns), and so the 'length' function is best 
%  avoided.

%  Now let's have a look at 'randperm'. This randomly permutes a list of
%  numbers from one up to the input you provide. So, for example, see the
%  output produced from the following commands:

randperm(5)
randperm(5)
randperm(20)
randperm(20)

%  Note that when you enter each command for the second time, the order is
%  different, as it is randomly generated each time you request it. 

%  Next, let's have a look at 'sqrt', which simply produces the square
%  root of any input you provide, whether that is a single number, vector,
%  or matrix:

sqrt(9)

sqrt(1024)

sqrt(my_first_vector)

sqrt(my_second_matrix)

%  Finally, let's look at some functions that can be useful for processing
%  string variables. For example, the function 'disp' will display a string
%  array without the name of the variable and an equals sign preceding it,
%  which looks neater in the Matlab command window. Compare the output of 
%  the two following lines by entering them one at a time:

words_and_letters
disp(words_and_letters)

%  We can also use the functions 'int2str' and 'num2str' to convert numbers
%  to strings, for display reasons. 'int2str' deals with integers (whole
%  numbers), while 'num2str' deals with numbers that have decimal points.
%  For example, execute the following lines of code, one at a time, and 
%  examine the output:

Age = 15.5;
num2str(Age)
int2str(Age)

%  You will notice that 'num2str' gives you the full number, with the
%  decimal place, while 'int2str' rounds the value up to the nearest
%  integer. We can combine 'disp' with these functions to generate some
%  nice text output, for example:

disp(['My long lost son is now ' num2str(Age) ' years old'])