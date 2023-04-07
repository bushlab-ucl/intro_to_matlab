%% This script accompanies the "Basics of Programming" lecture from the
%  UCL Institute of Cognitive Neuroscience Matlab Course. All course 
%  details and content - including pre-recorded lectures, slides, practical
%  exercises and solutions - can be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk



%% 1. Relational and Logical Operators
%  Before we get started, we need to be aware that Matlab can not only 
%  evaluate numerical expressions, but also relational and logical 
%  expressions. As we will see below and in subsequent lectures, this can 
%  be very useful for checking whether variables conform to certain 
%  constraints and for quickly categorising data. There are several 
%  different relational and logical operators that are listed in the 
%  lecture slides. Briefly, the relational operators include 'equal to' 
%  (==), 'more than' (>), 'less than' (<), 'more than or equal to' (>=), 
%  less than or equal to (<=), and 'not equal to' (~=); and the logical
%  operators include 'and' (&) and 'or' (|)

%  Importantly, any expression that performs a relational or logical
%  operation produces a logical variable as output, that can either take 
%  values of 'true' (indicated by a '1') or false (indicated by a '0'), and 
%  is always the same size as the variable that is the subject of the 
%  operation. To get an idea, try entering some of the following 
%  expressions, one at a time, and see what is generated in the command 
%  window and workspace:

sampleVector = 1 : 3 : 25;

sampleVector > 7

sampleVector < 7

sampleVector == 7

sampleVector <= 7

sampleVector >= 7

%  Hopefully you can see that, in each case, a logical array is created in
%  the workspace and displayed in the command window, which is exactly the
%  same size as 'sampleVector', with values of '1' (i.e. 'true') wherever
%  an entry in 'sampleVector' satisfies the expression you have specified,
%  and a value of '0' (i.e. 'false') where it does not.

%  In addition, we can use logical operators to connect and compare
%  different logical arrays, such as those produced by the expressions
%  above. For example we can use the AND operator (implemented with a & 
%  symbol) to ask where multiple logical arrays are all true, or we can use
%  the OR operator (implemented with a | symbol) to ask where at least one
%  of multiple logical arrays is true. To demonstrate, try entering the
%  following expressions, one at a time, and see what is generated in the
%  command window and workspace:

sampleVector > 7 & sampleVector < 19

sampleVector <= 7 | sampleVector >= 19



%% 2. Creating a Script
%  Now, copy and past the text below into a new script file and then
%  execute it by clicking on "Run" (or "Save and run", depending on your
%  version of Matlab) or pressing F5. This will require you to save the
%  code in a folder of your choice, and then make that your current folder
%  (or add it to the MATLAB path, see below). After you have run the code, 
%  enter 'clc' in the command window, and execute it again. As it operates 
%  on random numbers, you should get a different output each time.

RandomNumbers = rand(10,1);

Mean = mean(RandomNumbers)
Standard_Deviation = std(RandomNumbers)
Maximum = max(RandomNumbers)
Minimum = min(RandomNumbers)

%  Notice how the output of the script (i.e. the variables 'Mean', 
%  'Standard_Deviation' etc.) are output to the workspace.

%  Rather than saving the script in your current directory, and only being 
%  able to run the script when that folder was the current directory, you 
%  could add the folder into which you save the script to the Matlab path. 
%  Each time you try and run a script or function, Matlab will search 
%  through each folder on this Path in turn until it finds an *.m file with
%  the name you have entered, and then run that. This can cause problems if
%  there are multiple scripts or functions with the same name in different 
%  folders on the path, as you may end up running the wrong script without 
%  realising. A handy command, therefore, to find out where the script or 
%  function you are calling from the command line is located on the 
%  computer, is 'which'. For example, try typing:

which mean

% ...this will return, in the command window, the full address of where the
% script for the built-in Matlab function 'mean' is located on your
% computer. The folders that contain all built-in Matlab functions are
% located on the Matlab path by default, so that they can always be called 
% from the command window. Any scripts that you write yourself will be 
% located in other folders on the computer, and so you will need to add 
% those folders to the path if you want to run those scripts from the 
% command window.


%% 3. Annotating your code
%  Now try annotating the code in your new m-file (that was copy and pasted
%  from above). At the top of the code, enter a brief description of what
%  the whole script does, who wrote it (you) and when (today!), to look
%  something like this:


%  Code to generate an array of ten random numbers and evaluate their mean,
%  standard deviation, maximum and minimum values. Daniel Bush (2020)

RandomNumbers = rand(10,1);                 % Generate an array of uniformly distributed random numbers

Mean = mean(RandomNumbers)                  % Compute and display the mean
Standard_Deviation = std(RandomNumbers)     % Compute and display the standard deviation
Maximum = max(RandomNumbers)                % Compute and display the maximum value
Minimum = min(RandomNumbers)                % Compute and display the minimum value

%  Note that all output is sent directly to the workspace

%  Although this may seem very tedious for now, it is a VERY good habit to
%  get into, and will become much more useful when you begin writing and
%  sharing more complex pieces of code. 

%  Now, to demonstrate how scripts will take existing variables from the 
%  workspace, try commenting out the first line of the code above (i.e.
%  putting a '%' in front of the line that starts 'RandomNumbers', then
%  clear your workspace (by entering the 'clear' command), manually enter
%  the following line in the command window to create a new 'RandomNumbers'
%  variable:

RandomNumbers = 1:100;

%  ...and run your script again. As you will hopefully see, it will run
%  as before, but instead of creating its own array of random numbers, it
%  now performs all of the operations on the 'RandomNumbers' variable that
%  already exists in the workspace. This means that, if you run the script
%  multiple times, you will now receive the same output each time (as a new
%  'RandomNumbers' variable is not being generated within the script)



%% 4. If statements
%  Now let's have a look at a very basic 'if' statement using a very basic
%  piece of code that simulates tossing a coin. To do this, we will
%  generate a uniformly distributed random number, then see 'if' it is
%  smaller or larger than 0.5 to determine whether the output is 'Heads' or
%  'Tails'. We will also annotate our code! Copy and paste the following
%  into a new script, save it as 'CoinToss', and then run it by typing the 
%  name of the file in the MATLAB command window. You can do this over and
%  over again


%  Code to simulate a coin toss. Daniel Bush (2020)
Toss = rand;            % Generate a uniformly distributed random number
if Toss > 0.5           % If that number is greater than 0.5...
    disp('Heads')       % ...then the output is 'Heads'...
else                    % ...otherwise...
    disp('Tails')       % ...the output is 'Tails'
end
clear Toss              % Clear variables that are no longer needed


%  This code is actually slightly biased towards tails, as random numbers
%  up to and including 0.5 will produce that result. In order to introduce
%  the 'elseif' statement, and to make things a bit more interesting, let's
%  add another (improbable but not impossible!) outcome:


%  Code to simulate a coin toss. Daniel Bush (2020)
Toss = rand;            % Generate a uniformly distributed random number
if Toss > 0.5           % If that number is greater than 0.5...
    disp('Heads')       % ...then the output is 'Heads'...
elseif Toss < 0.5       % If that number is less than 0.5...
    disp('Tails')       % ...the output is 'Tails'
else                    % ...otherwise (if the number is exactly 0.5)...
    disp('The coin is perfectly vertically balanced!')
end
clear Toss              % Clear variables that are no longer needed


%  We can now advance the original code a little further to simulate the
%  effect of two coin tosses, and demonstrate the concept of nested 'if'
%  loops, as follows:


%  Code to simulate two coin tosses. Daniel Bush (2020)
Toss1 = rand;                                               % Generate two uniformly distributed random numbers
Toss2 = rand;
if Toss1 > 0.5                                              % If the first number is greater than 0.5...
    disp('The first coin is heads...')                      % ...then the first output is 'Heads'...
    if Toss2 > 0.5                                          % If the second number is greater than 0.5...
        disp('...and the second coin is heads too!')        % ...then the output is also 'Heads'
    else                                                    % But if the second number is less than or equal to 0.5...
        disp('...but the second coin is tails!')            % ...then the output is 'Tails'
    end
else                                                        % But if the first number is less than or equal to 0.5...
    disp('The first coin is tails...')                      % ...then the first output is 'Tails'...
    if Toss2 > 0.5                                          % If the second number is greater than 0.5...
        disp('...but the second coin is heads!')            % ...then the output is 'Heads'
    else                                                    % But if the second number is less than or equal to 0.5...
        disp('...and the second coin is tails too!')        % ...then the output is also 'Tails'
    end
end
clear Toss1 Toss2                                           % Clear variables that are no longer needed


%  Note that every 'if / else' statement must be paired with an 'end'
%  statement, and MATLAB will automatically indent the code to align them
%  vertically, for ease of comprehension (more on this in the next lecture)

%  As an alternative to the nested 'if' loops above, we can also use logial
%  expressions within our 'if' conditions, which is a little more compact.
%  Here we will use the AND statement (denoted by '&') to evaluate both
%  random numbers at the same time, instead of one after another:


%  Code to simulate two coin tosses. Daniel Bush (2020)
Toss1 = rand;                                                       % Generate two uniformly distributed random numbers
Toss2 = rand;
if Toss1 > 0.5 & Toss2 > 0.5                                        % If both numbers are greater than 0.5...
    disp('Both coins landed on heads!')                             % ...then both outputs are heads    
elseif Toss1 > 0.5 & Toss2 <= 0.5                                   % If the first is greater AND the second lower than 0.5...
    disp('The first coin landed on heads, the second on tails!')    % ...then the first output is 'Heads' and the second is 'Tails'
elseif Toss1 <= 0.5 & Toss2 > 0.5                                   % If the first is lower AND the second greater than 0.5...
    disp('The first coin landed on tails, the second on heads!')    % ...then the first output is 'Tails' and the second is 'Heads'
elseif Toss1 <= 0.5 & Toss2 <= 0.5                                  % If both numbers are lower than 0.5...
    disp('Both coins landed on tails!')                             % ...then both outputs are tails
end
clear Toss1 Toss2                                                   % Clear variables that are no longer needed



%% 5. Switch / case statements
%  Switch / case statements can be used to evaluate a single variable and
%  allow multiple outcomes. They are almost equivalent to a set of 'if /
%  elseif' statements, but the syntax is a little neater, and instead of
%  else, they use the term 'otherwise'. For example:


%  Code to display cocktail ingredients. Daniel Bush (2020)
Cocktail = 'Mojito';                                                % Enter either 'Mojito', 'Margarita' or 'Cosmopolitan'
switch Cocktail
    case 'Mojito'                                                   % If the cocktail is a mojito...
        disp('You need mint, sugar and rum')                        % ...print the required ingredients
    case 'Margarita'                                                % If the cocktail is a margarita...
        disp('You need tequila, triple sec and limes')              % ...print the required ingredients
    case 'Cosmopolitan'                                             % If the cocktail is a cosmo...
        disp('You need vodka, triple sec and cranberry juice')      % ...print the required ingredients
    otherwise                                                       % ...otherwise...
        disp('Ingredients unknown!')                                % ...tell the user you haven't heard of that cocktail!
end
clear Cocktail                                                      % Clear variables that are no longer needed


%  This entire piece of code could be replaced by 'if / else' statements
%  and the function 'strcmp', which checks whether a string variable (in
%  this case, 'Cocktail') is the same as another string, as follows:


%  Code to display cocktail ingredients. Daniel Bush (2020)
Cocktail = 'Cosmopolitan';                                          % Enter either 'Mojito', 'Margarita' or 'Cosmopolitan'
if strcmp(Cocktail,'Mojito')                                        % If the cocktail is a mojito...
    disp('You need mint, sugar and rum')                            % ...print the required ingredients
elseif strcmp(Cocktail,'Margarita')                                 % If the cocktail is a margarita...
    disp('You need tequila, triple sec and limes')                  % ...print the required ingredients
elseif strcmp(Cocktail,'Cosmopolitan')                              % If the cocktail is a cosmo...
    disp('You need vodka, triple sec and cranberry juice')          % ...print the required ingredients
else                                                                % ...otherwise...
    disp('Ingredients unknown!')                                    % ...tell the user you haven't heard of that cocktail!
end
clear Cocktail                                                      % Clear variables that are no longer needed



%% 6. For loops
%  If you want to execute the same piece of code multiple times, make use 
%  of a 'for' loop. This will execute whatever code is held within the 
%  'for / end' structure for every instance or value of the loop counter 
%  variable  (which  comes immediately after the 'for' statement). That is,
%  the loop counter variable ('count' in the example below) is initialised 
%  at some value (1 in the example below), and the code within the 
%  'for /end' structure is then executed 'for' that value, then the loop
%  counter variable moves on to the next value in list of values that have 
%  been assigned to it, and the code is executed again, and so on, until 
%  the loop counter variable reaches the last value that has been 
%  assigned to it (10, in the example below). For example, if we wish to
%  display a set of square numbers:


%  Code to display the square of the first ten integers. Daniel Bush (2020)
for count = 1 : 10                                                  % For the numbers one to ten
    disp([int2str(count) ' squared is ' int2str(count^2)]);         % Display their square
end
clear count                                                         % Clear variables that are no longer needed


%  Note that the values in the counting array do not necessarily have to
%  take a linear range of values. Instead, you can specify any set of 
%  values you would like to use as a vector, and the code within the 'for' 
%  loop will then be executed for each of those values in turn. For 
%  example, if we wish to compute and siaply the square of a specific list 
%  of numbers - say 2, 5, 9, 15 and 20 - then we just use a vector 
%  containing each of those numbers in the counting array:


%  Code to display the square of a specific set of integers. Daniel Bush (2020)
for count = [2 5 9 15 20]                                           % For a specific list of integers
    disp([int2str(count) ' squared is ' int2str(count^2)]);         % Display their square
end
clear count                                                         % Clear variables that are no longer needed


%  You can also use the loop counter (i.e. the variable 'count' in this
%  example) to assign the output to different elements of an output array,
%  because the value in count increases each time the code contained in the
%  'for / end' structure, so the output array (i.e. the variable 'squares'
%  in this example) is gradually filled with the output values, as follows:


%  Code to display and store the square of the first ten integers. Daniel Bush (2020)
for count = 1 : 10                                                  % For the numbers one to ten
    squares(count) = count^2;                                       % Compute their square and store it in 'squares'
    disp([int2str(count) ' squared is ' int2str(squares(count))]);  % Display the square of each number
end
clear count                                                         % Clear variables that are no longer needed


%  It is also possible to make use of 'nested' for loops - i.e. place 
%  multiple 'for' loops inside each other, to execute some set of 
%  operations multiple times. We won't bother outputting any text to the 
%  screen this time, as the code is executed 100 times. Instead, we will 
%  store all of the output values in the 'square_products' matrix. For 
%  example:


%  Code to compute all the products of the first ten integers. Daniel Bush (2020)
for count1 = 1 : 10                                                 % For the numbers one to ten...
    for count2 = 1 : 10                                             % ...and another set of numbers one to ten
        products(count1,count2) = count1*count2;                    % Compute the product of the first and second number
    end
end
clear count1 count2                                                 % Clear variables that are no longer needed



%% 7. While loops
%  'While' loops are very similar to 'for' loops, and use almost exactly
%  the same syntax. The difference is that the code contained within the
%  'while / end' structure will be executed for as long as (i.e. while)
%  some condition is true. For example, have a look at the following
%  example:


%  Code to count numbers that are less than ten. Daniel Bush (2020)
count = 1;                                                          % Initialise a counting variable
while count <= 10                                                   % For as long as that variable is less than or equal to 10
    disp([int2str(count) ' is less than or equal to 10'])           % Inform the user that this number is less than or equal to 10
    count = count + 1;                                              % Then add one to the counting variable
end                                                                 


%  Hopefully, you should be able to see that the final value of 'count' in
%  the workspace is 11 - that is, the code continued to display output and
%  add one to the value of 'count' each time until the value of 'count' was
%  no longer less than or equal to ten - i.e. when it was 11. Note that if
%  the conditional variable (i.e. the variable 'count' in this example) is
%  not updated within the 'while / end' structure, then you have created an
%  infinite loop, from which the only escape is to use ctrl+c. For example,
%  try running the following loop - you will see that it continues
%  indefinitely (because 'count' always remains equal to 1, and so is 
%  always less than or equal to 10), so you must click in the MATLAB 
%  command window and press ctrl+c to terminate the script and return to 
%  normal operation:


%  Code to count numbers that are less than ten. Daniel Bush (2020)
count = 1;                                                          % Initialise a counting variable
while count <= 10                                                   % For as long as that variable is less than or equal to 10
    disp([int2str(count) ' is less than or equal to 10'])           % Inform the user that this number is less than or equal to 10    
    wait(500)                                                       % Wait 500ms 
end 



%% 8. Writing functions
%  Any script can be converted into a function. The advantage of this is 
%  that functions will only use the variables that are explicitly provided 
%  as input, use their own private workspace to carry out operations on 
%  those variables, and then only return the output that is explicitly 
%  specified to the workspace. This helps to keep your workspace tidy and 
%  prevents accidental over-writing of variables etc. 

%  As a first example, let's convert our cocktail recipe script from above.
%  There are a few important things to note here. 

%  First, the new line  that has been placed at the very top of the script 
%  (starting 'function'...) is what tells MATLAB that this script is a 
%  function. Any output that you want to be returned to the workspace when 
%  the function has run needs to be declared in the square brackets 
%  immediately afterwards. For now, we only want this function to output 
%  text to the screen, so we'll leave those square brackets empty. 

%  Second, after the equals sign, you must enter the name of the function. 
%  This is what you can use to 'call' the function from the MATLAB command 
%  window. It MUST also be the name of the file that you save. 

%  Third, in  the normal brackets after the function name, you need to
%  declare all of the inputs that the function will take. In this example,
%  that is just the variable 'Cocktail', which tells the function which
%  cocktail we'd like to know the ingredients for. 

%  Finally, any comments that we enter immediately after the 'function...'
%  line will be displayed as 'help' information, if any requests for help
%  information regarding our function are made. 

%  Copy and paste the text below into a new script and save it somewhere on
%  your MATLAB path - making sure the file name is 'CocktailMaker' (this
%  will probably be suggested by MATLAB as default when you go to save the
%  script). 


function[] = CocktailMaker(Cocktail)
%  Function to display cocktail ingredients. Daniel Bush (2020)
%  Enter the name of a cocktail as input (either Mojito, Margarita or
%  Cosmopolitan) and this function will display a list of the necessary
%  ingredients.
switch Cocktail
    case 'Mojito'                                                   % If the cocktail is a mojito...
        disp('You need mint, sugar and rum')                        % ...print the required ingredients
    case 'Margarita'                                                % If the cocktail is a margarita...
        disp('You need tequila, triple sec and limes')              % ...print the required ingredients
    case 'Cosmopolitan'                                             % If the cocktail is a cosmo...
        disp('You need vodka, triple sec and cranberry juice')      % ...print the required ingredients
    otherwise                                                       % ...otherwise...
        disp('Ingredients unknown!')                                % ...tell the user you haven't heard of that cocktail!
end
clear Cocktail                                                      % Clear variables that are no longer needed

%  ...now go to the main MATLAB screen and try executing the command:
%  'CocktailMaker('Mojito')' - hopefully you should get a list of the
%  ingredients and no error messages! As an alternative, you can assign the
%  input separately, as follows:

Cocktail = 'Cosmopolitan';
CocktailMaker(Cocktail)

%  Also try typing 'help CocktailMaker' and see what is displayed in the 
%  command window.

%  All of the MATLAB built in functions (like 'rand' and 'mean') are just
%  scripts of this sort that have been written by other people. For
%  example, try typing 'edit mean' into the command window and pressing
%  return. This should open the 'mean' function in your Editor window. As
%  you can hopefully see, this script has exactly the same structure and
%  syntax (starting with the 'function' line, then some help comments, then
%  the code itself) as the function we have just written. 

%  To demonstrate how the output of a function is handled, let's edit our
%  CocktailMaker function to also provide a price estimate for each drink,
%  which will be returned to the workspace without being displayed. Copy
%  and paste the following text over your current script and try running it
%  again:


function[EstimatedCost] = CocktailMaker(Cocktail)
%  Function to display cocktail ingredients and estimate the cost. 
%  Daniel Bush (2020)
%  Enter the name of a cocktail as input (either Mojito, Margarita or
%  Cosmopolitan) and this function will display a list of the necessary
%  ingredients and estimate their cost
switch Cocktail
    case 'Mojito'                                                   % If the cocktail is a mojito...
        disp('You need mint, sugar and rum')                        % ...print the required ingredients
        EstimatedCost = 6;                                          % ...and output the estimated cost
    case 'Margarita'                                                % If the cocktail is a margarita...
        disp('You need tequila, triple sec and limes')              % ...print the required ingredients
        EstimatedCost = 8;                                          % ...and output the estimated cost
    case 'Cosmopolitan'                                             % If the cocktail is a cosmo...
        disp('You need vodka, triple sec and cranberry juice')      % ...print the required ingredients
        EstimatedCost = 9;                                          % ...and output the estimated cost
    otherwise                                                       % ...otherwise...
        disp('Ingredients unknown!')                                % ...tell the user you haven't heard of that cocktail!
end
clear Cocktail                                                      % Clear variables that are no longer needed


%  Now, depending on how you execute the function, an estimated price for
%  your cocktail of choice will be returned to the workspace, either as the
%  variable 'ans' (if you just ran the function without assigning a
%  variable name to its output, i.e. as 'CocktailMaker(Cocktail)') or as
%  some variable of your choice (i.e. as 'HowMuch =
%  CocktailMaker(Cocktail)' or something similar). 