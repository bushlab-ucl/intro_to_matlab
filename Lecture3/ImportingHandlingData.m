%% This script accompanies the "Importing and Handling Data" lecture from 
%  the UCL Institute of Cognitive Neuroscience Matlab Course. All course 
%  details and content - including pre-recorded lectures, slides, practical
%  exercises and solutions - can be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk



%% Saving and loading Matlab format data
%  To demonstrate how you can save data from, and load data into, Matlab,
%  we'll first need to create some data:

Data = rand(100,100);   % Generate a 100 x 100 matrix of random numbers to save

%  We are now going to save and load this variable to demonstrate how 
%  MATLAB deals with data files. First, change your current folder by 
%  clicking on the button next to the name of the current folder, 
%  immediately above the workspace, and make a new folder in a location of 
%  your choice with any name you like. Now enter the following command:

save myfirstdata

%  If you navigate to the folder that you have just created in Windows / 
%  Mac OS, outside of the MATLAB window, you should see that a file called 
%  'myfirstdata.mat' has been created. ".mat" is the extension of all 
%  native Matlab format data files. Now, clear your workspace to get rid of
%  the 'Data' variable:

clear

%  ...and then retrieve the previously defined 'Data' variable by typing:

load myfirstdata

%  This should reinstate the 'Data' variable in the workspace as it 
%  appeared previously. Note that you can also load and save data using the
%  more 'traditional' approach - through the toolbar. Just click on the 
%  'Open' or 'Save' buttons in the Matlab desktop toolbar. Also note that 
%  you do not need to  specify the ".mat" extension when saving or loading 
%  data, but you can if you want to. 

%  It is important to note that loading a file will overwrite any variables 
%  in the workspace that have the same name as those being loaded, WITHOUT 
%  WARNING. As an example, clear the workspace again and create a new
%  variable called 'Data', but this time a string:

clear
Data = 'Primed for overwriting';   % Generate a meaningless string to overwrite

%  Now, load 'myfirstdata' again, and have a look at 'Data' in the 
%  workspace - the string variable has disappeared, without warning, and 
%  the matrix of random numbers that we saved earlier has returned:

load myfirstdata

%  Similarly, saving a file from the command window (i.e. by typing 'save 
%  filename') will overwrite any existing *.mat file with the same name
%  WITHOUT WARNING. For example, if you clear the workspace, create a
%  differently named variable and then save that with the same filename as
%  above, then clear the workspace and load 'myfirstdata', you can see that
%  the original file (with 'Data' contained in it) has been overwritten,
%  and now only the new 'OtherData' variable exists in that file:

clear 
OtherData = 'Be careful not to overwrite existing *.mat files by saving files with the same name!';
save myfirstdata

clear
load myfirstdata

%  Next, click on the 'Current Folder' drop down menu and change your
%  current folder to the second entry on the list (i.e. the folder it was
%  before you set it to a new one above). Now try typing:

clear
load myfirstdata

%  ...again. This should produce an error, as the file 'myfirstdata' is not
%  located in the current Matlab folder. In order to get round this issue,
%  you can add your newly created folder to the Matlab path, if you wish. 
%  Matlab will then automatically look in that folder (along with all other
%  folders on the path, in order) when it cannot find a file you wish to 
%  load in the current folder. Hence, if you then type:
 
load myfirstdata

%  ...again, without changing the current folder, then your old workspace
%  should now load without any error.

%  At this point, however, it's probably best to change your current folder
%  back to the one this script is saved in, so that you don't start leaving
%  arbitrary 'myfirstdata' files all over your computer...

%  It is worth knowing that the Matlab 'load' and 'save' functions can also 
%  be used with a different syntax, without any change in functionality.
%  For example, try running the following lines of code, one at a time:

save('myseconddata')
clear
load('myseconddata')

%  Hopefully you will see that, although the syntax used is slightly
%  different, the functionality is exactly the same. 

%  Next, it is also important to know that the Matlab 'save' and 'load' 
%  functions can be used to save and load only certain variables from the 
%  workspace or data file, respectively, rather than saving the entire
%  workspace or loading everything in a specific data file. To demonstrate
%  this, we're going to need a few other variables, so let's create Data2
%  and Data3, and save the whole workspace as we have done before, but with 
%  a new filename:

Data2 = rand(20,20);
Data3 = 420;
save('AllVariables')

%  Now, if we want to only save specific variables to a file, rather than 
%  all variables that are in the workspace, we simply list the names of
%  those variables after the filename when we call the 'save' function:

save('OneVariable','Data2')         % ...or try: save OneVariable Data2

%  We can check that this has worked by clearing the whole workspace, and
%  loading each of the the files in turn:

clear
load('AllVariables')

clear
load('OneVariable')

%  Similarly, we can load a specific subset of variables from a file,
%  instead of loading all of the variables stored in that file, with the
%  same syntax. For example, try:

clear
load('AllVariables','Data3')         % ...or try: load AllVariables Data3

%  Finally, it is important to note that it is possible to add new 
%  variables to an existing Matlab data file using the '-append' command, 
%  after the filename and list of variables that you wish to save when you
%  call the 'save' function. For example, if we create another variable to
%  save:

Data4 = '181081';

%  ...then we can add that variable to our existing 'AllVariables' data
%  file, without overwriting the entire file or the other variables that
%  are stored within it, using the '-append' command, like so:

save('AllVariables','Data4','-append')

%  If we now clear the workspace and load the 'AllVariables' data file, you
%  can see that the Data4 variable has been incorporated alongside the
%  other, pre-existing Data2 and Data3 variables within that file

clear
load AllVariables



%% Saving Excel format data
%  Matlab also allows you to import data from, and export data to, several
%  other file formats. One of the formats that may be useful is the Excel
%  file format. There are two key functions that are used to read from, and
%  write to, Excel files. These are 'xlswrite' and 'xlsread'. Before we 
%  demonstrate how they work, we'll need some data to save to an Excel 
%  spreadsheet and then load back in from that Excel spreadsheet, so let's 
%  create a matrix of random numbers again:

Data = rand(20,20);   % Matrix of random numbers to save to an Excel spreadsheet

%  In it's simplest form, the function 'xlswrite' simply requires you to
%  provide a filename and tell it which variables from the workspace you
%  would like to save to that Excel file. For example, try:

xlswrite('ExcelSheet',Data);

%  Now go to your current folder, and there should be an Excel spreadsheet
%  there with the same set of random numbers within it that you can see if
%  you open the Data variable in the variable editor in Matlab (by double
%  clicking on the name of the variable in the workspace). 

%  Like the 'save' function we described earlier, 'xlswrite' will overwrite 
%  existing data without warning. However, unlike the 'save' function, 
%  'xlswrite' will not overwrite the entire file and all of its contents, 
%  it will only overwrite those cells within the existing Excel spreadsheet
%  that are taken up by the new data. For example, if we close that Excel 
%  spreadsheet, then generate and save a smaller matrix of ones called 
%  'Data' with the same filename:

Data = ones(5,5);   % Matrix of ones to save to an existing Excel spreadsheet
xlswrite('ExcelSheet',Data);

%  ...and then open the Excel spreadsheet again, you will see that only the
%  first five rows and columns of the original data have been replaced by
%  ones. 

%  You may also have noticed that, in both cases, data that is written to 
%  an Excel spreadsheet appears, by default, in the top left hand corner of
%  the first worksheet of that spreadsheet. However, the function 
%  'xlswrite' does allow you to specify which worksheet and cells within 
%  that worksheet you wish your data to be written to. The name of the 
%  worksheet and the index of the top-left cell are simply entered as 
%  inputs to the 'xlswrite' function after the filename and variables that 
%  you wish to save to that location. As an example, let's add some more 
%  data to the Excel spreadsheet we created above:

Data2 = {'Simultaneously','demonstrating','that','we','can' ...
    'save','strings','in','cells','to','Excel','too!'};

xlswrite('ExcelSheet',Data2,'Sheet2','C3');

%  If you then open the spreadsheet again, you should see that the text 
%  data above has been saved on the second worksheet, in a series of cells 
%  with C3 in the top-left hand corner. You should also have noticed that 
%  you are not restricted to writing numerical data to Excel spreadsheets, 
%  we can write both numerical and text data and - by using a cell in 
%  Matlab to organise that data within a single variable - we can write 
%  both simultaneously. For example, close the spreadsheet again, and try:

Data3 = {'Subject Number', 'Age', 'Score', 'Gender';
    1, 22, 7.7, 'M';
    2, 11, 9.9, 'F';
    3, 33, 8.8, 'M';
    4, 44, 6.6, 'F'};

xlswrite('ExcelSheet',Data3,'Sheet3','B2');

%  In each case, however, it is important to remember that - if you want to 
%  specify which cells in Excel you wish the data to be saved to, then you 
%  have to specify a sheet name too. If you do not, then Matlab will assume 
%  that the cell name you provide as a third input is the sheet name, and 
%  create a new sheet with that name if one does not exist. To demonstrate
%  this, close the Excel spreadsheet again and try:

xlswrite('ExcelSheet',Data3,'B2');

%  Firstly, you will notice that Matlab has provided a 'warning' in the 
%  command window that it created a new worksheet within the Excel 
%  spreadsheet for that data. Second, when you open the spreadsheet again, 
%  you will see that there is now an additional worksheet called 'B2', in
%  which the data has been placed in the very top-left corner (i.e. 
%  starting in cell A1). 

%  One limitation of the 'xlswrite' function is that you can only write one
%  Matlab variable to an Excel spreadsheet at any one time, unlike the
%  'save' function, where all variables in the workspace can be saved at
%  once. However, by generating cell arrays in Matlab that contain all of 
%  the information you wish to save to an Excel spreadsheet - be it text,
%  numbers, or a combination of the two - you can overcome this obstacle.
%  Alternatively, by calling the 'xlswrite' function many times (as we have
%  done above), and specifying different worksheet and/or cell targets 
%  within that spreadsheet each time, you can build up a complete Excel 
%  spreadsheet one component at a time.

%  Before we look at loading data from Excel files, it is also important to
%  note that there is a very similar function - 'csvwrite' - that can be
%  used to generate comma seperated value (i.e. *.csv) output files.
%  Although, this function and the output files it generates are a lot less
%  flexible than the xlswrite function and Excel files, *.csv files can be
%  imported into a much wider range of numerical software packages -
%  including R and SPSS. The syntax is very similar to that demonstrated
%  above, in that we simply call the function and specify an output
%  filename and the variable that we wish to export to that file:

csvwrite('CSVFile.csv',Data);

%  In this case, however, we can only export numerical matrices, so the 
%  following line of code will produce an error:

csvwrite('CSVFile.csv',Data3);

%  Similarly, each CSV file can only consist of a single worksheet and
%  numerical matrix, so it is not possible to add more data to an existing
%  file, as we did with the Excel spreadsheet above. As an example, try
%  running the following lines of code:

Data4 = randi(10,2,2);
csvwrite('CSVFile.csv',Data4);

%  ...if you then open the corresponding CSV file in Excel, you will see
%  that it only contains the Data4 variable - all traces of the original
%  matrix of ones that were originally exported to that file have been
%  erased



%% Loading Excel format data
%  Next, we will look at how we can load data from either Excel 
%  spreadsheets or CSV files into Matlab. This is achieved using the 
%  'xlsread' function. In it's simplest form, you can provide the 'xlsread'
%  function with just the filename, and it will load data from the corresponding Excel spreadsheet:

clear
xlsread('ExcelSheet');

%  You should notice two things: (1) Because we have not assigned the data 
%  we are loading to a variable name, it will be placed in a variable with 
%  the default name 'ans'; and (2) The function has only loaded the
%  numerical data that we entered into the first worksheet of that 
%  spreadsheet earlier, not the text data from the second worksheet or the 
%  combined text and numeric data from the third worksheet. 

%  By default, the 'xlsread' function will only load data from the first 
%  worksheet of any spreadsheet. If you wish to load data from a different 
%  worksheet, you can specify the name of that worksheet as an additional 
%  input to the function - just like we did above, when we saved data to 
%  the second or third worksheet. For example, try:

xlsread('ExcelSheet','Sheet3');

%  You should now notice that Matlab has loaded data from the third
%  worksheet of our Excel file, but only the numerical data from that
%  worksheet - all of the text data has been ignored. 

%  This highlights an important difference between the 'xlsread' function 
%  and many of the other functions we have encountered on this course so 
%  far - 'xlsread' generates multiple outputs, and if you do not assign 
%  multiple output variables to accommodate those outputs, then you will 
%  only ever receive the first of those outputs. 

%  To get an idea of what other outputs 'xlsread' generates, run the 
%  following line of code:

[numbers text combined] = xlsread('ExcelSheet','Sheet3');

%  An inspection of the three variables we have just created in the 
%  Variable Editor (which is accessed by double clicking on the variable 
%  names in the Workspace) should demonstrate the nature of the three 
%  different outputs generated by 'xlsread':

%  (1) A numerical matrix of all the numerical data from the specified 
%  Excel worksheet (in this case called 'numbers')

%  (2) A cell array of all the text data from the specified Excel worksheet 
%  (in this case called 'text')

%  (3) A cell array of all the (numerical and text) data from the specified
%  Excel worksheet combined (in this case called 'combined')

%  The kind of data you want to load from Excel dictates which of these
%  different outputs may be useful, but for now, it's just important to 
%  know how to generate each of them. Later on in the lecture, we'll look 
%  at some useful ways to manipulate the data that is contained within each 
%  (in addition to the indexing that we learned about in the first lecture)

%  Finally, it is important to remember, for all of these examples, that 
%  you can check the built-in help information for more details and 
%  examples pertaining to each function - many (including 'xlsread') have 
%  other options or inputs that I have not described here for the sake of 
%  brevity, clarity, or simply because I don't think they are important.



%% Manipulating the contents of matrices
%  Having imported data into Matlab, from a *.mat, *.xls or *.csv file that
%  contains the results of a psychology experiment, for example, you will
%  often want to manipulate that data both to organise it in a more usable
%  form, and to facilitate further analyses. Hence, we will now briefly
%  introduce and demonstrate a couple of built-in Matlab functions and
%  operations that you will find very useful for manipulating data. To do 
%  this, we'll need some sample data, so let's reinstantiate a cell array
%  from earlier on, which contained a summary of data from a hypothetical
%  behavioural experiments:

Data3 = {'Subject Number', 'Age', 'Score', 'Gender';
    1, 22, 7.7, 'M';
    2, 11, 9.9, 'F';
    3, 33, 8.8, 'M';
    4, 44, 6.6, 'F'};

%  Now, one thing we may wish to do is extract the different columns of
%  numeric data from this cell array, and store them as separate variables.
%  We can do that using the horzcat or vertcat functions - which perform
%  horizontal or vertical concatenation of their inputs - or, equivalently,
%  by using the square bracket syntax that was introduced in the first
%  lecture, along with the Matlab 'transpose' function or shortcut. To
%  demonstrate, let's first try horizontally concatenating the list of
%  participant IDs in a new variable called 'partIDs', like so:

partIDs = horzcat(Data3{2:end,1});

%  ...this will produce a new variable, containing all of the participant
%  IDs as a single row of numbers. We could produce exactly the same output
%  using square brackets:

partIDs = [Data3{2:end,1}];

%  ...alternatively, we could use the 'vertcat' function to list the
%  participant IDs as a single column of data - that is, by stacking each
%  value one on top of the other:

partIDs = vertcat(Data3{2:end,1});

%  ...alternatively, this can be achieved by using square brackets to
%  horizontally concatenate the list of participant IDs, and then
%  transposing the result - that is, flipping the matrix so that rows
%  become columns and viced versa:

partIDs = transpose([Data3{2:end,1}]);

%  Importantly, a single inverted comma after the name of the variable, or 
%  after the square brackets, acts as a shortcut for the transpose function
%  in Matlab, so the same output can again be produced using the following 
%  line of code:

partIDs = [Data3{2:end,1}]';

%  The next function that can often be useful is 'sort'. Just as it says on
%  the tin, 'sort' will sort your data in ascending or descending order
%  along an axis of your choice. By default, 'sort' will sort your data 
%  into ascending order and by column. For example, we can sort all of the 
%  data in each column of a numeric matrix called 'Data', again, containing
%  the output of a hypothetical behavioural experiment:

Data = [19  200 97 ;        % Sample data - each row corresponds to a different participant, 
        21  350 82 ;        % column 1 is age, column 2 is mean RT and column 3 is memory test score
        23  280 86 ; 
        31  275 91 ; 
        25  310 88];
            
sort(Data)

%  Alternatively, we can ask 'sort' to sort the data in each row (not 
%  column) by providing a second input, which specifies the (second) 
%  dimension which we would like our data sorted along. So, compare the
%  output from above with the output from:

sort(Data,2)

%  In addition, we can provide a third input which specifies whether we
%  would like the data sorted in ascending or descending order:

sort(Data,2,'descend')

%  Finally, you may have noticed that using 'sort' in this way, with
%  matrices where each row (or column) corresponds to data from a specific
%  participant, is not helpful, because it sorts every column (or row) 
%  independently, and thus switches the 'RT' and 'memory test score' values 
%  that correspond to each 'age', for example.

%  Fortunately, 'sort' has one more useful feature that allows you to
%  extract the index of each row (or column) in the original data that the
%  sorted data corresponds to. This is achieved by allowing for an
%  additional output:

[SortedData Rows] = sort(Data)

%  When we run this command, we are given the data sorted by column, as
%  before (in the variable 'SortedData') and, in addition, we are given a
%  list of indices in the variable 'Rows' which tell us which row of 'Data'
%  these values come from. This can be useful, for example, if we wish to
%  sort 'Data' in ascending order of age, but keep the RT and memory score 
%  values that correspond to each participant in place:

SortedData = Data(Rows(:,1),:)

%  Note that this operation will over-write the 'SortedData' variable from
%  above, which we did not need, and takes advantage of indexing entire 
%  rows and columns using the colon, which we discussed in the first 
%  lecture. Have a look at the output, and hopefully you will see that the 
%  variable 'SortedData' now contains each row of the original 'Data' 
%  variable, but organised in order of ascending age (i.e. column one). 
%  There is an easier way to do this, using the function 'sortrows', but 
%  the method described above using 'sort' is much more flexible
    


%% Finding elements in an array
%  Another very useful function is 'find', which identifies and returns the 
%  indices of any elements in an array that satisfy whatever logical 
%  expression is provided as input. To demonstrate this, we'll need some 
%  arbitrary data, so let's generate a more complex matrix of results from 
%  a hypothetical behavioural experiment. Copy and paste the following 
%  lines of code into the command window, or highlight them all and press 
%  F9, to run them:

Data = [19 1 200 97 ;        % Sample data - each row corresponds to a different participant, 
        21 2 350 82 ;        % column 1 is age, column 2 is condition, 
        23 1 280 86 ;        % column 3 is mean RT and column 4 is memory test score
        31 2 275 91 ; 
        25 2 310 88 ; 
        24 1 250 95 ;
        27 1 260 94 ; 
        22 2 340 78 ; 
        28 2 380 85 ; 
        26 1 300 92];

%  Now let us suppose that, for some reason, we wish to identify all
%  'participants' in this behavioural data set who are aged 25 or above. We 
%  can use 'find' to tell us which those are, by asking it to look for 
%  entries in the first column of 'Data' (which contains the age of each 
%  hypothetical participant) that are greater or equal to 25 (refer back to 
%  the lecture 1 slides for a list of Matlab's logical operators):

find(Data(:,1) >= 25)

%  This will return a list of numbers (in 'ans', as we did not specify a
%  variable to contain the output) that specify the rows (or participant
%  indices, if you like) of the first column of 'Data' where the values are
%  25 or greater.

%  Similarly, we can ask 'find' to tell us which participants (i.e. which 
%  row numbers) fell into condition one - condition number being stored in 
%  the second column of 'Data':

find(Data(:,2) == 1)

%  We could also use 'find' to identify any potential outliers in our
%  experiment - for example, participants whose reaction times were more 
%  (or less) than five standard deviations above (or below) the mean:

find(Data(:,3) >= (mean(Data(:,3)) + 5*std(Data(:,3))) )
find(Data(:,3) <= (mean(Data(:,3)) - 5*std(Data(:,3))) )

%  In this case, 'find' returns two empty matrices, as there are no entries
%  in the RT column that are more (or less) than five standard deviations
%  above (or below) the mean of the group as a whole.

%  In each of the cases described above, we have asked 'find' to provide us
%  with the indices of elements in a single column. However, we can also 
%  ask find to look across the whole matrix. For example, let's forget 
%  about the contents of the 'Data' matrix for a second, and just find any 
%  numbers in 'Data' that are larger than 350:

find(Data>350)

%  What you might notice is that, in this case, 'find' returns a single
%  number that corresponds to the index of the one entry in 'Data' that
%  exceeds 350 - the 29th element. You might remember, from earlier 
%  lectures, that elements in a matrix can always be accessed with a single 
%  number, generated by counting down each column in turn. As there are 10 
%  entries in each column, the 29th entry corresponds to the 9th row in the 
%  3rd column. Alternatively, if we wish 'find' to directly return the row
%  and column indices of this entry, we simply need to ask the function to 
%  provide two outputs:

[row col] = find(Data>350)

%  The 'find' function has a couple of other useful features that are worth
%  mentioning (also, don't forget that you can always check the Matlab 
%  built-in help for more examples and details of this, or any function). 
%  For example, you can ask 'find' to return only the first or last n 
%  entries of an array that satisfy a specific logical expression. 
%  Returning to the example above, we might want to ask which the first 
%  participant we tested with an age of 25 or above was. To do this we 
%  provide 'n', the number of indices we wish to have returned to us, as a 
%  second input; and the text string 'first' to tell 'find' that it is the 
%  'first' n entries (as opposed to the 'last' n entries) that we are 
%  interested in:

find(Data(:,1) >= 25, 1, 'first')

%  Similarly, try another example, and check that it is correct by looking
%  at 'Data' in the Variable Editor:

find(Data(:,4) > 90, 2, 'last')

%  Lastly, it is important to note that you can also ask 'find' to return 
%  the indices of elements that satisfy multiple logical expressions, using 
%  the logical AND (&) / OR (|) operators to specify how the results of 
%  each logical expression should be combined (again, see the Lecture 2 
%  slides for more details).

%  For example, we can find participants who have an age under 25 AND (&) a
%  memory score of 95 or above:

find(Data(:,1) < 25 & Data(:,4) > 95)

%  ...or participants who fell into condition one OR (|) had a reaction 
%  time of less than 300ms:

find(Data(:,2) == 1 | Data(:,3) < 300)

%  It is worth noting one very common error that arises from using the
%  'find' function occurs when applying it to a subset of your overall
%  data. For example, we might ask which, if any, of participants 6 to 10 
%  had a reaction time of less than 300ms:

find(Data(6:10,3) < 300)

%  The 'find' function should return the numbers 1 and 2. Importantly, this
%  means that entries 1 and 2 in the data you provided to the 'find'
%  function satisfy this expression - that is, participants 6 and 7 - not 
%  entries 1 and 2 in the whole third column of 'Data'. People often forget 
%  this, however, and use the indices they have obtained from using 'find' 
%  on a subset of their data, to access the incorrect elements of the 
%  entire Data array - i.e. in the example above, they may go on to use the
%  returned indices (1 and 2) to look for other details of those
%  participants in the 'Data' variable, forgetting that this will give 
%  them further details of participants 1 and 2, not 6 and 7. 



%% Logical Indexing
%  In previous lectures, and in the 'sort' examples above, we have seen how 
%  specific rows or columns of a matrix can be accessed using numerical
%  indices - i.e. Data(2,:) will display the second row of Data. However, 
%  there is another, very important, way of accessing specific elements, 
%  rows or columns of a vector or matrix that will become very useful when 
%  you start to manipulate and analyse more complex data sets. This method
%  is called 'logical indexing'. 

%  In short, logical indexing uses logical expressions (i.e. is equal to, 
%  is more than, is less than etc.) - just like those used with 'find' 
%  above - to specify which elements, rows or columns of the same (or a 
%  different) matrix to display or edit. In some ways, this is similar to 
%  the 'find' function that was introduced in the first lecture and 
%  reviewed above, but logical indexing has the advantage of being faster, 
%  more powerful, and requiring less code.

%  As an example, let's use the arbitrary data from our hypothetical
%  behavioural psychology experiment again. To make the logical indexing
%  examples clearer, however, we'll separate each column of data into a
%  separate field of a 'Data' structure:

Data.Age    = [19  21  23  31  25  24  27  22  28  26];
Data.Cond   = [1   2   1   2   2   1   1   2   2   1];
Data.RT     = [200 350 280 275 310 250 260 340 380 300];
Data.Memory = [97  82  86  91  88  95  94  78  85  92];

%  Logical indexing basically performs two steps in a single line: it finds
%  all entries in a specified array that satsify a specified logical
%  expression, and then returns those values (rather than the index of 
%  those values, as the 'find' function does). This can be very useful when 
%  analysing data, as any other Matlab function can then be applied to 
%  those values directly, rather than having to extract and store those 
%  values in a separate array before analysing them. This will become 
%  clearer as we work through some examples below. 

%  To perform logical indexing, you simply provide a logical expression 
%  (such as those that we passed as inputs to the 'find' function above) 
%  instead of numerical indices when extracting elements from an array. 
%  This tells Matlab to access any elements of an array that satisfy that 
%  logical expression, and ignore all others. 

%  To make this more clear, and provide a few examples, let's first use
%  logical indexing to extract all of the age values that are larger than
%  25. To do this, we ask Matlab to return all the values in Data.Age where
%  the values of Data.Age are greater than 25:

Data.Age(Data.Age>25)

%  ...or find all of the reaction time values that are greater than the 
%  mean reaction time, by asking Matlab to return all the values in Data.RT
%  where the values of Data.RY are greater than the mean of RT:

Data.RT(Data.RT>mean(Data.RT))

%  It might be of interest to understand how logical indexing works. To do
%  this, try entering the code below into the command window:

Data.Age>25

%  Matlab should return - in 'ans', as we did not specify a variable for
%  the output of this expression - a logical array, the same size as 
%  Data.Age, with a value of '1' (or 'true') wherever Data.Age is greater 
%  than 25, and values of '0' (of 'false') everywhere else. 

%  Importantly, this logical variable can then be used to access specific 
%  elements of any other array of the same size. Those specific elements 
%  are the entries that correspond to a value of 'true'. For example, we  
%  can find the reaction times of each participant aged over 25:

Data.RT(Data.Age>25)

%  Hopefully, you should be able to see that this returns the values from
%  'Data.RT' that specifically correspond to values of '1' in the logical
%  array we created above, and therefore - in turn - to values where 
%  Data.Age is greater than 25. 

%  Similarly, we can find the memory scores of everyone with a reaction 
%  time less than 300ms:

Data.Memory(Data.RT<300)

%  This might still not appear particularly useful, but in terms of data
%  analysis, it is important to realise that functions can now be applied
%  directly to the output of lines of code like the ones above. For 
%  example, we can compute the mean age of participants in each condition, 
%  all with two lines of code:

mean(Data.Age(Data.Cond==1))
mean(Data.Age(Data.Cond==2))

%  ...or the standard deviation of reaction times for participants in each
%  condition:

std(Data.RT(Data.Cond==1))
std(Data.RT(Data.Cond==2))

%  ...or even to see if there is a significant difference between the 
%  memory score of participants in conditions one and two, using the two 
%  sample t-test function 'ttest2' (which there is, at p<0.05):

[h p] = ttest2(Data.Memory(Data.Cond==1), Data.Memory(Data.Cond==2));

%  Hopefully you can see the advantages logical indexing offers over the
%  'find' function, even though the same analyses could be performed using
%  that function. For example:

std(Data.RT(find(Data.Cond==1)))

%  In fact, you should notice that Matlab will automatically highlight the 
%  'find' function in the line of code above, and suggest that you use
%  logical indexing instead of 'find' to make your code run faster. 

%  There are a few other useful things to note about logical indexing -
%  first, just like we demonstrated with the 'find' function above, we can 
%  ask for indices that satisfy multiple logical expressions using the 
%  logical AND (&) / OR (|) operators. For example:

Data.Age(Data.Cond==1 & Data.RT < 300)

Data.RT(Data.Cond==1 & Data.Memory>95)

%  Next, we can use logical indexing to access entire rows or columns of
%  data. For example, if we generate a random array of putative 'responses' 
%  from our participants, which are whole numbers between one and ten for 
%  each of twenty trials, then we can use the condition labels stored in 
%  'Data' to access entire specific rows of those responses. For example:

responses   = ceil(10*rand(10,20));         % Generate a random set of responses between 1 and 10 for ten participants, twenty trials
responses(Data.Cond==1,:)                   % Display the responses of all participants in condition one on the screen

%  Finally, it is important to note that logical indexing can also be used
%  to edit the entries in specific elements of any matrix, which are
%  identified based on whether they satisfy the corresponding logical
%  expression(s) or not. For example, we can replace all of the entries in
%  'responses' with NaN values for any participant that is aged below 20:

responses(Data.Age<20,:) = nan;

%  Or we can add 20 to the memory score of any participants from condition
%  two. Note that, to do this, we need to use logical indexing twice - once
%  to identify the elements that should be changed, and once to define the
%  numbers we wish to change them to:

Data.Memory(Data.Cond==2) = Data.Memory(Data.Cond==2) + 20;

%  Hopefully these examples have demonstrated the power of logical 
%  indexing, and in particular, how useful it can be when we come to 
%  analysing data obtained from cognitive neuroscience experiments.