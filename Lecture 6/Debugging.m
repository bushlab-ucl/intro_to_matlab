%% This script accompanies the "Debugging" lecture from the UCL Institute
%  of Cognitive Neuroscience Matlab Course. All course details and content 
%  - including pre-recorded lectures, slides, practical exercises and 
%  solutions - can be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk


%% Organising your code: Header information
%  There are several simple guidelines for organising your code when you 
%  are writing scripts that will help you to keep track of what you are 
%  doing, as well as make your code easier to interpret, share and re-visit

%  Some of these practices will seem needlessly complicated in the simple 
%  examples we consider here, but when you come to writing more convoluted 
%  scripts (like the experimental data analysis pipeline in future 
%  lectures), these simple practices should serve to make your code more
%  transparent and less prone to simple errors

%  A good analogy for writing good code is writing a clear recipe -  which 
%  tends to have the following structure:
%  (1) A brief description of the 'output' - i.e. the name of the dish, how 
%  many people it serves, and potentially the cost per person or 
%  nutritional information
%  (2) The name and quantity of all the ingredients and equipment that is 
%  needed
%  (3) An outline of how those ingredients are combined to generate the 
%  final product

%  In order to demonstrate how we can try and introduce a similar structure
%  into our code, we're going to need a more complex example to work with,
%  so we will create a script that generates simulated data from a typical
%  Psychology experiment, rather than collecting it from real participants.
%  In this example, we will randomly simulate reaction times and responses 
%  (i.e. key presses) for ten participants, in two conditions that each 
%  contain twenty trials, presented in a random order. We will then 
%  calculate the mean reaction time and most common key press for each 
%  simulated participant. In doing so, I also hope to demonstrate some
%  useful ways in which Matlab can contribute to constructing your
%  experiments

%  So, the first thing to put in your script is a high-level description 
%  that informs people what the piece of code does, what inputs it 
%  requires, and what outputs it produces. Hopefully, you will have seen 
%  examples of this in the scripts and functions I have produced in the
%  sample code and practical exercise solutions from previous lectures

%  In addition, it is also often a good idea to include details of when you 
%  wrote the code, what changes you made from previous versions (if there 
%  were any), and your contact details in this header information. This 
%  will be useful if you share the code with other people, or if you 
%  generate several versions of a similar piece of code that do slightly 
%  different things (like several iterations of a data analysis script, 
%  with slightly different procedures or parameters in each) and then 
%  re-visit that code at a later date

%  Importantly, this text is also what will appear if anyone calls up the 
%  'help' information for your code. For example, make sure this script is 
%  in your current folder, and then type:

help Debugging

%  Hopefully, you should see the first section of annotation from the top
%  of this script appear in the command window

%  For other examples of this, have a look at any built-in Matlab function,
%  i.e. have a look at the built-in Matlab script for computing the mean:

edit mean

%  First, observe the header information that is provided at the top of 
%  that script; then, see what happens if you type:

help mean

%  So, for our simulated experiment code, we should begin with header 
%  information that says something along the lines of:

%  Simulated Psychology Experiment Script. Daniel Bush (UCL, 2020)
%  This script randomly generates reaction times and key press responses 
%  for ten 'participants' in two 'conditions' that each contain twenty 
%  'trials' presented in a random order. The purpose of this script is to 
%  demonstrate some good coding practices. Contact: d.bush@ucl.ac.uk


%% Organising your code: High level outline
%  Next, having written our header information, the following step should
%  usually be to write a 'high-level' outline of the whole script as text - 
%  i.e. as a list of bullet points, in annotation, using percent symbols - 
%  so that you can break the overall problem down into a series of smaller,
%  more manageable sub-problems, and get the order of each clear in your 
%  head. Once you have that annotated plan, you can then proceed by filling
%  in the low-level details - i.e. the nuts and bolts code that performs
%  each sub-problem. In our simulated Psychology experiment example, for 
%  instance, the outline might look like this:

%  [1] Assign constant variables for the experiment - this will include the 
%  number of participants, conditions, trials

%  [2] Assign memory for the output of the experiment - this will include 
%  reaction times, key presses, and the condition for each trial for each
%  participant

%  [3] Loop through each participant, randomly assign a condition to each 
%  trial, and store the condition for each trial for that participant

%  [4] Loop through each trial, randomly generate reaction times and key 
%  presses for that trial and store that information too

%  [5] Compute the mean reaction time and most common key press for each 
%  participant 

%  [6] Clear variables that are not needed as output

%  Once we have this outline, we can start to fill in the actual code and
%  finer details, with a clearer idea in our head of the structure of the
%  entire script, the order in which each step needs to be completed, and
%  even the exact piece of data or parameter values that need to be passed
%  from one part of the script to the next


%% Organising your Code: White space and code cells or sections
%  Next, as demonstrated in this script, and in the other sample scripts 
%  and practical exercise solutions from each lecture, it is a good idea 
%  to use blank lines (i.e. white space) to delineate the different 
%  sections of your script. This (in combination with the high level 
%  annotation described in the previous section) makes it much easier to
%  follow the structure of a script, one step at a time, and differentiate
%  the different steps in your experimental design or analysis pipeline,
%  for example

%  Another useful technique for splitting a long script into smaller, more
%  manageable sections - which has also been repeatedly demonstrated in
%  this script, and the others that have accompanied the course so far - is
%  to make use of code cells or sections. In the Matlab Editor, a new code 
%  cell or section is defined by a double percent sign ('%%') at the start 
%  of a line of text, which becomes the corresponding section title, and is
%  displayed in bold text (like the 'Organising your Code...' line above)

%  Once a code cell or section has been created, the entire cell or section
%  is highlighted in yellow when it is being edited, while the other cells
%  or sections within your script (i.e. those preceding or following that
%  section of code) are displayed on a white background (try scrolling up
%  and down this script, using the mouse, while leaving the cursor within
%  this code section to get an idea of what I mean)

%  Dividing your scripts into code cells or sections, according to the list
%  of bullet points in your high level plan or proposed structure, makes 
%  the code easier to read, and also means that the heading of each cell or 
%  section is displayed in bold, to make the overall structure of your
%  script easier to keep track of

%  Importantly, however, code cells or sections do not just visually 
%  separate different parts of your code, but can also be used to 
%  functionally separate those different sections. For example, you can 
%  execute the code in the current cell or section alone, without executing
%  the rest of the script, by clicking on the 'Run Section' or 'Run and 
%  Advance' buttons in the toolbar at the top of the Editor window, or by 
%  using the control and return shortcut (in Windows)

%  Moreover, you can easily navigate between different code cells or 
%  sections by pressing control and up, or control and down (in Windows) to
%  move from the start of one code cell or section to the next


%% Organising your code: Assigning variables
%  Next, you may have noticed that the first step in the high level outline
%  of our proposed script, shown above, was to assign any constant values
%  that will be used by the code as different variables. More generally, if
%  there are certain constant values that you will use repeatedly 
%  throughout any piece of code, then it is always a good idea to assign 
%  those constants to a variable at the very start of the script. If you do 
%  so, then should you ever need to change the value of that constant, you 
%  can easily edit the line where you define that variable, at the top of 
%  your script, rather than having to scan through the code and change all 
%  instances of that constant value. This makes your code more flexible and
%  easier to repurpose for different applications

%  In our example Psychology experiment script, there are several constant
%  values that will likely be used multiple times - namely, the number of 
%  participants, conditions and trials that we will need to loop through 
%  when we generate our data. Hence, the first lines of actual code in our 
%  script might look something like this:

n_participants  = 10;   % Number of simulated participants
n_conditions    = 2;    % Number of simulated conditions
n_trials        = 20;   % Number of simulated trials per condition

%  Having done this, if we suddenly decide we want to change the number of 
%  trials or conditions, then we just need to change the value of these 
%  variables once, at the top of the script, and the code will continue to
%  function as before, but using this new variable value, rather than 
%  having to scan through the whole script and change each '20' or '2' that
%  we find - and risk missing one, which would stop our code from working
%  properly


%% Organising your code: Variable Names
%  On a related note, it is also worth emphasising at this point how useful
%  it is to use meaningful or intuitive variable names wherever possible. 
%  This helps both you and other people understand what your code is doing, 
%  by making it clear what each variable encodes. As a simple example,
%  compare:

x = 5;
y = 4;
z = x * y;

% ...with:

height = 5;
width = 4;
area = height * width;

%  As you can hopefully see, the latter example if much easier to 
%  interpret, and therefore check for accuracy. This also means that, if 
%  you come back to the script after a long break, it will be quicker to 
%  understand what the code is doing, and why

%  You can also use annotation when assigning variables, to remind yourself
%  what each variable represents, or why it is being created at all. For
%  example:

height = 5;   % Height of the rectangle (cm)
width = 4;   % Width of the rectangle (cm)
area = height * width;   % Compute the area of the rectangle (cm^2)


%% Organising your code: Assigning memory 
%  Next, it is also good practice to assign memory at the start of a script
%  for any output variables that are going to be generated within your 
%  code. Practically speaking, this means creating 'empty' variables of the
%  requisite size, which values generated by the code can then be stored in
%  later on. This allows the computer to optimally assign memory for 
%  storing each of those variables, which makes your code run faster. 

%  In our example, we want to collect reaction times and key presses for 10
%  participants across 20 trials in each of two conditions, giving 40 
%  trials overall. In addition, we would like to record the random order in
%  which trials from each condition are presented for each participant. 
%  Hence, we need to assign memory (i.e. create three empty variables) to 
%  store this information. Each of these empty variables will have 10 rows 
%  (one for each participant), and 40 columns (one for each trial):

RTs             = zeros(n_participants,n_conditions*n_trials);  % Assign memory for collecting reaction times
KeyPresses      = zeros(n_participants,n_conditions*n_trials);  % Assign memory for collecting key presses
TrialConds      = zeros(n_participants,n_conditions*n_trials);  % Assign memory for recording which condition each trial belongs to

%  Note that, in this example, we have used the Matlab function 'zeros' to 
%  create these empty variables. The function 'zeros' simply creates a 
%  vector or matrix of a specified size in which every entry is a zero. 
%  Just like when indexing a matrix, the number of rows is defined first 
%  (i.e. is the first input) and the number of columns is defined second 
%  (i.e. is the second input). At the start of the script, each entry in 
%  this matrix is a zero, but we will replace these zeros with the randomly 
%  generated values later in, as we go through the main body of the code

%  Before we move on, there are a couple of other Matlab functions that 
%  will be useful when defining variables and assigning memory. Firstly, 
%  instead of zeros, we can also assign memory by generating matrices full 
%  of 'NaN' values (remember that 'NaN' stands for 'not a number', and we
%  will come back to why this might be useful in the next lecture). This is
%  achieved using the 'nan' function, with exactly the same syntax as we
%  used for 'zeros' above, like so:

RTs             = nan(n_participants,n_conditions*n_trials);  % Assign memory for collecting reaction times
KeyPresses      = nan(n_participants,n_conditions*n_trials);  % Assign memory for collecting key presses
TrialConds      = nan(n_participants,n_conditions*n_trials);  % Assign memory for recording which condition each trial belongs to

%  Similarly, another function that is useful for assigning values to
%  matrices is 'ones', which creates an arbitrary sized matrix where every 
%  entry is a 1. Importantly, we can multiply any matrix of ones that we
%  create using this function by any constant value to get a matrix where 
%  every entry is equal to that constant value, and combine those using 
%  concatenation, implemented with square brackets, in order to create
%  matrices that are comprised of smaller matrices of different numbers. We
%  will see below how this is useful for assigning condition labels to each
%  trial, but for now, let's try a few examples:

allOnes         = ones(10,10);
allTwos         = 2*ones(10,10);
theOnesAndTwos  = [ones(10,5) 2*ones(10,5)];

%  Two more functions that use the same syntax to assign memory, but in 
%  this case, by creating 'empty' logical arrays, are 'true' and 'false'.
%  As for 'zeros', 'nan' and 'ones' above, we simply provide the number of
%  rows and number of columns of true or false entries that we require as
%  the first and second inputs, respectively. Again, remember that it is
%  also possible to concatenate the output of these functions - if they
%  have equivalent dimensions - using square brackets, as we have
%  demonstrated before. So, for example, we could use a logical array to
%  indicate which trials were in condition 1 (by giving those entries 
%  values of 'true') and which trial were in condition 2 (by giving those 
%  entries values of 'false'), like so:

cond            = [true(n_trials,1) ; false(n_trials,1)];

%  It may also be the case that you want to generate an empty cell array, 
%  rather an empty numeric matrix, to store the data that your code
%  generates. In this case, you can use the 'cell' function, again using
%  the same syntax as demonstrated repeatedly above. For example, you may
%  wish to generate an empty cell array to store the name of each
%  participant (although you probably shouldn't do that when running a real
%  experiment, for GDPR reasons), which you know will be text variables of
%  different lengths, and so best suited for storage in a cell array, like
%  so:

partNames       = cell(n_participants,1);

%  Finally, before we continue to look at some other good programming
%  practices and the various debugging features that are available in
%  Matlab, there are two more functions that I'd like to briefly introduce,
%  which may be useful when assigning memory or generating arbitrary 
%  matrices more generally. Each function can be used to repeat either a
%  specified matrix, or a specified set of values, multiple times, in order
%  to generate a larger matrix or vector comprised of repeating elements.
%  The first function is 'repmat' or 'replicate matrix', which can be used
%  to replicate any input matrix a specific number of times. After this 
%  first input (i.e. the matrix that you wish to replicate), the second and
%  third inputs correspond to the number of replications you require, 
%  defined in terms of rows and columns. So, to give an arbitrary example, 
%  let's say we want to produce two rows and three columns of a simple,
%  four element matrix, like so:

bigMatrix       = repmat([1 2 ; 3 4],2,3);

%  Of course, if you wish, you could also use this function to generate a
%  matrix of any specified size, consisting of just a single value,
%  repeated - rather than multiplying the output of the 'ones' function by
%  a constant value, as demonstrated above:

bunchOfFives    = repmat(5,2,10);

%  Alternatively, to go back to the example we used earlier, if we wish to
%  assign a list of conditions labels, by repeating a specific set of 
%  values (in our simple example, the numbers 1 and 2, indicating
%  conditions 1 and 2), a specific number of times (in our simple example,
%  twenty times each), then we could use the 'repelem' function (i.e. to 
%  'repeat elements'). This function takes two inputs - first, the list of 
%  numeric values you wish to repeat; and second, the number of times you 
%  wish to repeat each value, like so:

condLabels      = repelem([1 2],n_trials);

%  Alternatively, if we wished, we could repeat each element a different
%  number of times, like so:

arbitraryReps   = repelem([1 2 3 4],[2 4 6 8]);


%% Organising your code: Smart Indentation
%  Next, it is also good practice to indent or align your code, so that you 
%  can clearly visualise which lines of code are nested within each loop or 
%  conditional statement. As you have probably noticed in previous lectures
%  and practical sessions, Matlab will try and align your code for you 
%  automatically, i.e. it performs 'smart indentation', which means that 
%  loops and conditional statements are organised such that the start and 
%  end of each loop have the same alignment. For example, try typing out 
%  the code below, one step at a time, underneath it in this script:

heights     = randi(10,10,1); 
for shape   = 1 : size(heights,1)
    if heights(shape) >= 5
        disp(['Shape number ' int2str(shape) ' is taller than 5cm']);
    end    
end
clear shape

%  Hopefully, you will have noticed that - as you type the code out - each 
%  new line starts one 'tab' further in after you enter the 'for' and 'if' 
%  statements, and each 'end' statement brings the line one 'tab' further 
%  backward towards the margin, so that the start and end of each loop or
%  conditional argument are aligned on the screen

%  However, it is also possible to enter and run code without this 'smart 
%  indentation', without making any difference to the output - i.e. 
%  the indentation or alignment of each line of code have no functional 
%  impact in Matlab, it can just make your code easier to read and 
%  interpret. To demonstrate, try running the code above (by copying it 
%  into the command window, or highlighting it within the script and then 
%  pressing F9, to run the highlighted section of code only), and then try
%  running this code in the same way:

for shape   = 1 : size(heights,1)
if heights(shape) >= 5
disp(['Shape number ' int2str(shape) ' is taller than 5cm']);
end    
end
clear shape

%  Now, if you end up with a section of code which is not indented
%  correctly (for whatever reason - usually because you have gone back 
%  within your script and adjusted code within a loop or conditional 
%  statement), then you can apply smart indentation at any time by 
%  highlighting the relevant section of your script and pressing ctrl+I, or
%  clicking on the 'Smart Indent' button in the toolbar at the top of the 
%  Editor window. Have a go at doing this with the code directly above, to
%  see what I mean. Also remember that you can apply smart indentation to
%  your entire script at any time by using ctrl+A to select all of the text
%  within that script, and then ctrl+I to apply smart indentation


%% Organising your code: Clearing redundant variables
%  Finally, before we proceed to look at the debugging features that are 
%  available in Matlab, another good practice to ge into is clearing any 
%  variables that are no longer needed within your scripts, at the first 
%  possible opportunity. This helps both to save memory, so that your code 
%  will run faster; keep your workspace 'tidy', so that there aren't lots
%  of unused variables to wade through if you are looking for a particular
%  output of your code; and to avoid errors that are difficult to detect, 
%  by mistakenly using the wrong variable name from your workspace

%  The most frequent example of this is clearing the loop counter variables 
%  that you use in 'for' loops, as well as 'temporary' variables that you 
%  create in the process of computing something else. Try and get in the 
%  habit of immediately clearing the loop counter variable every time you 
%  'end' a loop you have written, as well as looking through the variables 
%  you have created in each section of code and clearing those which will 
%  not be used in the remainder of your script


%% Code Analyser
%  OK, so having gone through various good practices for programming, which
%  will hopefully help you to avoid introducing errors into your code in
%  the first place, we can now have a look at the various debugging
%  features that Matlab offers. The first useful feature is the dynamic
%  code checking function offered by the 'Code Analyser', which is built
%  into the Editor window. In effect, this means that Matlab checks the
%  code you are writing within a script, as you go along, and highlights
%  any potential or actual errors that may arise within that code, before
%  you even try and run that script for the first time

%  The output of this dynamic code checking procedure is displayed in two
%  places - first, in the right hand border of the Editor window; and 
%  second, by underlining particular sections of code within your script. 
%  If you look in the very top right hand corner of the Editor window now, 
%  you will see an orange box. If this box is green, that means your script
%  is completely free of any potential errors (which is rare1); if this box
%  is orange (as it is here), this means that Matlab has some 'warnings' 
%  about your script (i.e. it has some found some potential errors, or
%  identified some changes you could make which would allow your code to
%  run more quickly or more efficiently), but these won't prevent the
%  script running from start to finish without crashing; and if this box is
%  red, this means that there are 'fatal' errors in your code which will
%  prevent it from running all the way through

%  Below this box, you will see a series of orange lines in the right hand
%  border of the Editor window (in this example, but also one or more red
%  lines if there are any fatal errors in your code). Hovering your mouse
%  pointer over any one of these lines will tell you where Matlab has
%  detected a potential error (i.e. the line number in your script), as
%  well as providing a brief description of that potential error. Moreover,
%  you will usually see a drop down 'Details' button, which provides a
%  great deal more feedback on the potential error, as well as suggestions
%  on how to solve that error, and even some worked examples, in a much 
%  more informal and intuitive language than the error messages that appear
%  in the command window. In some cases, there may even be a 'Fix' button, 
%  which automatically corrects the error as Matlab has described. However,
%  I would caution against using this, for two reasons: first, it's better 
%  to understand what may have gone wrong and learn how to avoid making 
%  similar mistakes in future code; and second, you cannot be sure that 
%  Matlab will fix the potential error correctly, as it has no idea what 
%  the intended function of your code is

%  Finally, clicking on any one of these orange lines will take you to the 
%  line in your script where Matlab thinks it has detected a potential 
%  error, and Matlab will also highlight the particular part of that line 
%  of code where it thinks the error exists by underlining in red or 
%  orange, as I mentioned above. Once you have finished writing a first
%  'draft' of a new script, it's often a good idea to go back to the start
%  of that script and then cycle through each of these highlighted warnings
%  or errors, one at a time (which you can do by clicking on the coloured 
%  box in the top right hand corner), to check what Matlab thinks may have
%  gone wrong. Importantly, however, you won't necessarily need to make any
%  changes to your code - as I mentioned above, Matlab has no idea what
%  your intentions are, and some of these warnings can arise when you are
%  simply trying to write code for a specific purpose that it does not
%  understand


%% Debugging from the Editor Window
%  Next, to demonstrate another important debugging feature, we'll need a 
%  script to work with, so here's our finished Psychology experiment code -
%  if you copy and paste that into a new script, and then save it in your 
%  current folder or somewhere on your Matlab path, we can have a look at 
%  how to enter 'debugging mode' in that script

%  ---- Start of code ----

%  Sample psychology experiment script, Daniel Bush (UCL, 2020)
%  This script randomly generates reaction times and key press responses for
%  ten 'participants' in two 'conditions' that each contain twenty 'trials'
%  presented in a random order. The purpose of this script is to demonstrate
%  good coding practice. Contact: d.bush AT ucl.ac.uk


%  [1] Assign constant variables for the experiment
n_participants  = 10;   % Number of simulated participants
n_conditions    = 2;    % Number of simulated conditions
n_trials        = 20;   % Number of simulated trials per condition
respProb        = 0.95; % Probability of a participant responding on any given trial
rtMean          = 800;  % Mean reaction time (ms)
rtStd           = 200;  % Standard deviation of reaction times (ms)
nPresses        = 5;    % Number of possible key presses


%  [2] Assign memory for the output of the experiment
RTs             = nan(n_participants,n_conditions*n_trials);        % Assign memory for collecting reaction times
KeyPresses      = nan(n_participants,n_conditions*n_trials);        % Assign memory for collecting key presses
TrialConds      = zeros(n_participants,n_conditions*n_trials);      % Assign memory for recording which condition each trial belongs to


%  [3] Loop through each participant, randomly assign a condition to each
%  trial, and store the condition for each trial for that participant
for p = 1 : n_participants
    
    trial_cond      = [ones(1,n_trials) 2*ones(1,n_trials)];        % Assign a condition to each trial
    trial_cond      = trial_cond(randperm(n_conditions*n_trials));  % Randomise the order of trials
    TrialConds(p,:) = trial_cond;                                   % Store the condition for each trial for that participant
    clear trial_cond
    
    
    % [4] Loop through each trial, randomly generate reaction times and key
    % presses for that trial and store that information too
    for t = 1 : n_trials*n_conditions
        
        if rand <= respProb                                         % If the participant responded on that trial...
            RTs(p,t)        = rtMean + randn*rtStd;                 % Generate and record a random reaction time
            KeyPresses(p,t) = ceil(rand*nPresses);                  % Generate and record a random key press
        end
    end
    clear t
end
clear p


%  [5] Compute the mean reaction time and most common key press for each
%  participant
MeanRTs         = nanmean(RTs,2);               % Compute the mean reaction time for each participant
ModeKeyPresses  = mode(KeyPresses,2);           % Compute the most frequency key press for each participant
Responded       = sum(~isnan(RTs),2);           % Compute the number of trials on which each participant responded


%  [6] Clear variables that are not needed as output
clear n_participants n_conditions n_trials

%  ---- End of code ----

%  So, to enter debugging mode in Matlab, you simply click on the small 
%  black dash next to any line number in the left hand border of the Editor
%  window, noting that these black dashes only appear on lines where there 
%  is some actual executable code (rather than annotation or blank space). 
%  When you do that, a small red dot should appear - this indicates that a
%  breakpoint has been set at that particular line within the code. If you
%  now run that script, as normal, you will hopefully see that all of the
%  code up to (but not including) the line where you have placed a
%  breakpoint is executed, but then the execution of that code pauses, and 
%  a small green arrows appears, next to the line where you entered the 
%  breakpoint. In addition, you may notice that the cursor in the command
%  window changes from '>>' to 'K>>', to remind you that you have entered
%  debugging mode, and are part of the way through running a script

%  Once you are in debugging mode, you can inspect the current state of any
%  variable within the workspace - which is particularly useful for
%  functions, where this workspace is usually hidden - as well as editing,
%  plotting, or manipulating any of those variables. This can really help 
%  when you are trying to identify why an error occurs in a particular part
%  of your code, by looking at the exact state of each variable just before
%  that error arises, to get an idea of how it may have been generated.
%  More generally, debugging mode also allows you to proceed through your
%  code one line at a time, examining how each of your variables is
%  affected by each line of code, to make sure that the procedure you are
%  implementing is the one you intended

%  Once you are happy with what you have seen, you can use various buttons
%  in the toolbar at the top of the Editor window, or associated keyboard 
%  shortcuts, to proceed: you can either 'step' to the next line of code 
%  (using the shortcut F10); or 'continue' to the next breakpoint or end of
%  your script (using the shortcut F5). You can also enter as many more 
%  breakpoints as you like, and remove any existing breakpoints by clicking
%  on the corresponding red dot in the left hand border of the Editor 
%  window. At any point, the small green arrow indicates whereabouts in the
%  script you currently are, with all of the code above that point having 
%  been executed, but none of the code below it

%  To get an idea of how this works, try placing breakpoints on various
%  lines within the sample Psychology experiment script that I have
%  provided above, then running that script and having a look at how each
%  variable value is updated as you go along


%% Debugging from the Command Window
%  Now, using 'graphical' breakpoints to pause and inspect the workings of
%  your code at some particular juncture can be very useful, either if you
%  want to go through that code step by step to see exactly what it is
%  doing, or if you have an idea of where a specific error is generated and
%  want to try and work out how to solve that error. More generally,
%  however, you may simply want to run your code as normal unless an error
%  arises, in which case, you want to pause the execution of that code at
%  the very point that error arises, without crashing, so you can try and
%  look at the variables in your workspace and work out what went wrong

%  Fortunately, there is a method to do exactly this, most easily
%  implemented directly from the command window, by setting what is known
%  as a 'conditional breakpoint'. This basically means that Matlab will
%  introduce a breakpoint into your code, if and only if, some particular
%  condition is satisfied - in this example, if an error arises. You can
%  set a conditional breakpoint in this way by entering the following
%  command into the command window:

dbstop if error

%  To demonstrate how this works, enter that command into the command
%  window (or highlight the line of code above and press F9 to execute it),
%  and then introduce a deliberate error in the sample Psychology 
%  experiment script by adding the following code as line 16 of that 
%  script, immediately after 'nPresses = 5':

ceil    = 1;

%  Now run the code as normal, and what you should hopefully see is that
%  execution pauses on line 41 (KeyPresses(p,t) = ...), the green arrow
%  appears in the left hand border of the Editor window, and we enter
%  debugging mode. You can now try and work out why this particular error
%  has arisen - in this case, it's because we are trying to use the
%  function 'ceil' to round our randomly generated number up to the nearest
%  whole integer, but we also have a variable called 'ceil', so Matlab
%  thinks we want to access (or 'index') a specific entry in that variable,
%  but using an index value which is not a whole number (i.e. not a real
%  positive integer, or a logical array). Regardless of that, the important
%  point is that we can use conditional breakpoints in this way to 
%  automatically identify the errors in our code, and then enter into 
%  debugging mode at the precise point those errors occur, in order to try 
%  and solve them

%  Once you are happy that you have corrected the error (in this case, by
%  removing the 'ceil = 1;' line of code at the start of the script, which
%  we added above), then you can run the code through again and, in this
%  case, it should proceed from start to finish as normal, because no
%  errors have arisen, and so debugging mode has not been entered. If
%  this is the case, you can remove the conditional breakpoint using the
%  command: 

dbclear if error