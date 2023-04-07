%% Lecture 2 Practical Exercise from the UCL Institute of Cognitive 
%  Neuroscience Matlab Course. All course details and content - including 
%  pre-recorded lectures, slides, practical exercises and solutions - can 
%  be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

%  Problem [1]: Write a function that asks the user for a number between 1 
%  and 6 as an input, then simulates three rolls of a six-sided dice and 
%  informs the user after each roll whether it matches their chosen number
%  or not by displaying appropriate text on screen. Make sure the code is 
%  well annotated.

%  There are two potential solutions to asking the user for input here -
%  either by simply generating a function that takes the user's guess as an
%  input, or by using the 'input' function to prompt the user for an input
%  via the command window. The first option would look something like the
%  code below (copy and paste the following code into a new script to try 
%  it out). 

%  Note that it is good practice to define any variables that will keep a 
%  constant value throughout the script at the top. This is because, if we 
%  choose to change the value of those variables in the future, we can do
%  so by just changing one line of code at the top of the script, rather
%  than having to search through and find every time we entered a '3' or
%  '6' and change each instance individually.

function[] = DiceRoller(guess)
% Function to simulate three rolls of a six-sided dice and inform the user
% after each roll whether or not it matches their guess
% Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

rolls   = 3;        % Define the number of dice rolls
sides   = 6;        % Define the number of sides on the dice

% Now, for each roll of the dice...
for roll    = 1 : rolls
    
    % Simulate one roll of the dice
    rolled  = ceil(sides*rand);     % Generate a random number between 1 and sides
                                    % Note that you could also use randi(sides) here
	
    % Check if the rolled number matches the user's guess                                
	if rolled == guess                                  % If it does match...
        disp('Congratulations, you guessed correctly!') % Display a winning message
    else                                                % Otherwise, if it doesn't match...
        disp('Sorry, you guessed incorrectly')          % Display a losing message
    end
    
    % Clear anything we don't need to keep in memory
    clear rolled
        
end
clear roll rolls sides guess        % Clear anything we don't need to keep in memory



%% Alternatively, the second option (using the 'input' function), looks 
%  something like this:

function[] = DiceRoller()
% Function to simulate three rolls of a six-sided dice and inform the user
% after each roll whether or not it matches their guess
% Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

rolls   = 3;        % Define the number of dice rolls
sides   = 6;        % Define the number of sides on the dice

% First, ask the user for their guess
guess   = input('What is your guess? ');

% Now, for each roll of the dice...
for roll    = 1 : rolls
    
    % Simulate one roll of the dice
    rolled  = ceil(sides*rand);     % Generate a random number between 1 and sides
                                    % Note that you could also use randi(sides) here
	
    % Check if the rolled number matches the user's guess                                
	if rolled == guess                                  % If it does match...
        disp('Congratulations, you guessed correctly!') % Display a winning message
    else                                                % Otherwise, if it doesn't match...
        disp('Sorry, you guessed incorrectly')          % Display a losing message
    end
    
    % Clear anything we don't need to keep in memory
    clear rolled
        
end
clear roll rolls sides guess        % Clear anything we don't need to keep in memory



%  Problem [2]: Extend the code above so that it asks for the user’s name 
%  and year of birth as additional string and numerical inputs, 
%  respectively. If the year of birth means that the user is definitely 
%  younger than 18, the function should display the following text on 
%  screen:
%
%  Sorry, <name>, you are too young to gamble!
%
%  Otherwise, customise the text output following each dice roll with the 
%  user’s name:
%  Congratulations <name>, you correctly guessed the roll of the dice!

%  Again, there are two solutions here, using either additional inputs to
%  the function directly from the command line, or additional prompts with
%  the 'input' function. I will only demonstrate the second option this
%  time, but you can do the first by using the following line:
%  function[] = DiceRoller(guess, name, yearOfBirth)
%  ...and removing the lines that use the 'input' function below 
%  (126, 130 and 139). Don't forget you'll need to copy this code into a
%  new script and save it as 'DiceRoller' in your current folder to try it
%  out

function[] = DiceRoller()
% Function to simulate three rolls of a six-sided dice and inform the user
% after each roll whether or not it matches their guess
% Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

rolls       = 3;                                % Define the number of dice rolls
sides       = 6;                                % Define the number of sides on the dice

% First, ask the user for their name
name        = input('What is your name? ','s'); % Note that the second input to the 'input' function, 's'
                                                % tells the 'input' function that 'name' will be a string input

% Then, ask the user for their year of birth
yearOfBirth = input('What is your year of birth? ');

% Check that they are definitely not under 18
if yearOfBirth > 2002                   % Anyone born after 2002 is definitely under 18, at the time of writing
    disp(['Sorry, ' name ', you are too young to gamble!']);

else                                    % Otherwise, continue with the rest of the code

    % Then, ask the user for their guess
    guess       = input('What is your guess? ');
    
    % Now, for each roll of the dice...
    for roll    = 1 : rolls
        
        % Simulate one roll of the dice
        rolled  = ceil(sides*rand);     % Generate a random number between 1 and sides
                                        % Note that you could also use randi(6) here
        
        % Check if the rolled number matches the user's guess
        if rolled == guess                                              % If it does match...
            disp(['Congratulations, ' name ', you guessed correctly!']) % Display a winning message
        else                                                            % Otherwise, if it doesn't match...
            disp(['Sorry, ' name ', you guessed incorrectly'])          % Display a losing message
        end                
        clear rolled                    % Clear anything we don't need to keep in memory
        
    end
    clear roll rolls sides guess        % Clear anything we don't need to keep in memory
    
end
clear name yearOfBirth                  % Clear anything we don't need to keep in memory



%  Problem [3]: If the number entered by the user is less than 1 or more 
%  than 6, get the function to display the following text on screen, 
%  without generating any other output:
%
%  ERROR! You must enter a number between 1 and 6
%  
%  This is easy to implement by adding an additional 'if' or 'elseif' 
%  statement after the 'if' statement that checks the user's age. We can
%  choose to either only ask for their guess after we have checked their
%  age, as shown here, in which case we use nested 'if' statements (i.e. 
%  one is contained within the other):

function[] = DiceRoller()
% Function to simulate three rolls of a six-sided dice and inform the user
% after each roll whether or not it matches their guess
% Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

rolls       = 3;                                % Define the number of dice rolls
sides       = 6;                                % Define the number of sides on the dice

% First, ask the user for their name
name        = input('What is your name? ','s'); % Note that the second input to the 'input' function, 's'
                                                % tells the 'input' function that 'name' will be a string input

% Then, ask the user for their year of birth
yearOfBirth = input('What is your year of birth? ');

% Check that they are definitely not under 18
if yearOfBirth > 2002                   % Anyone born after 2002 is definitely under 18, at the time of writing
    disp(['Sorry, ' name ', you are too young to gamble!']);
    
else                                    % Otherwise, continue with the rest of the code

    % Then, ask the user for their guess
    guess       = input('What is your guess? ');
    
    % Check if the guess is smaller than 1  or greater than 'sides'
    if guess < 1 || guess > sides       % Remember that the '|' symbol means 'OR' in Matlab
        disp(['Please choose a number between 1 and ' int2str(sides)'])
        
    else
    
        % Otherwise, if the guess is between 1 and sides, then for each 
        % roll of the dice...
        for roll    = 1 : rolls
            
            % Simulate one roll of the dice
            rolled  = ceil(sides*rand);     % Generate a random number between 1 and sides
            % Note that you could also use randi(6) here
            
            % Check if the rolled number matches the user's guess
            if rolled == guess                                              % If it does match...
                disp(['Congratulations, ' name ', you guessed correctly!']) % Display a winning message
            else                                                            % Otherwise, if it doesn't match...
                disp(['Sorry, ' name ', you guessed incorrectly'])          % Display a losing message
            end
            clear rolled                    % Clear anything we don't need to keep in memory
            
        end
        clear roll rolls sides guess        % Clear anything we don't need to keep in memory
        
    end
    clear guess

end
clear name yearOfBirth                  % Clear anything we don't need to keep in memory

%  Alternatively, we could use an 'if / elseif' statement, in which case we
%  ask for their guess before we check their year of birth:

function[] = DiceRoller()
% Function to simulate three rolls of a six-sided dice and inform the user
% after each roll whether or not it matches their guess
% Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

rolls       = 3;                                % Define the number of dice rolls
sides       = 6;                                % Define the number of sides on the dice

% First, ask the user for their name
name        = input('What is your name? ','s'); % Note that the second input to the 'input' function, 's'
                                                % tells the 'input' function that 'name' will be a string input

% Then, ask the user for their year of birth
yearOfBirth = input('What is your year of birth? ');

% Then, ask the user for their guess
guess       = input('What is your guess? ');
    
% Check that they are definitely not under 18
if yearOfBirth > 2002                   % Anyone born after 2002 is definitely under 18, at the time of writing
    disp(['Sorry, ' name ', you are too young to gamble!']);
     
% Check if the guess is smaller than 1  or greater than 'sides'
elseif guess < 1 || guess > sides       % Remember that the '|' symbol means 'OR' in Matlab
    disp(['Please choose a number between 1 and ' int2str(sides)'])
    
% Otherwise, if the guess is between 1 and sides...
else
    
    % ...then for each roll of the dice...
    for roll    = 1 : rolls
        
        % Simulate one roll of the dice
        rolled  = ceil(sides*rand);     % Generate a random number between 1 and sides
                                        % Note that you could also use randi(6) here
        
        % Check if the rolled number matches the user's guess
        if rolled == guess                                              % If it does match...
            disp(['Congratulations, ' name ', you guessed correctly!']) % Display a winning message
        else                                                            % Otherwise, if it doesn't match...
            disp(['Sorry, ' name ', you guessed incorrectly'])          % Display a losing message
        end
        clear rolled                    % Clear anything we don't need to keep in memory
        
    end
    clear roll rolls sides guess        % Clear anything we don't need to keep in memory
    
end
clear guess name yearOfBirth           	% Clear anything we don't need to keep in memory



%  Problem [4]: If the number entered by the user is not an integer (i.e.
%  whole number), get the function to display an error message similar to 
%  that shown above
%
%  The most simple way to do this is simply by adding another 'or' clause
%  to the statement which checks whether the user's guess is smaller than 1
%  or greater than sides. The tricky part is working out a statement that 
%  checks whether a number is an integer - you will probably have had to 
%  Google a good method to do this. The most simple way is to check whether
%  there is any remainder after dividing by one, i.e. by asking if the 
%  remainder after dividing by 1 is not equal to zero 'if rem(guess,1)~=0',
%  as shown here:

function[] = DiceRoller()
% Function to simulate three rolls of a six-sided dice and inform the user
% after each roll whether or not it matches their guess
% Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

rolls       = 3;                                % Define the number of dice rolls
sides       = 6;                                % Define the number of sides on the dice

% First, ask the user for their name
name        = input('What is your name? ','s'); % Note that the second input to the 'input' function, 's'
                                                % tells the 'input' function that 'name' will be a string input

% Then, ask the user for their year of birth
yearOfBirth = input('What is your year of birth? ');

% Then, ask the user for their guess
guess       = input('What is your guess? ');
    
% Check that they are definitely not under 18. Note that anyone born after 
% 2002 is definitely under 18, at the time of writing 
if yearOfBirth > 2002
    disp(['Sorry, ' name ', you are too young to gamble!']);
     
% Check if the guess is smaller than 1  or greater than 'sides', and a
% whole number. Remember that the '|' symbol means 'OR' in Matlab
elseif guess < 1 || guess > sides || rem(guess,1)~=0    
    disp(['Please choose a whole number between 1 and ' int2str(sides)'])
    
% Otherwise, if the guess is between 1 and sides...
else
    
    % ...then for each roll of the dice...
    for roll    = 1 : rolls
        
        % Simulate one roll of the dice
        rolled  = ceil(sides*rand);     % Generate a random number between 1 and sides
                                        % Note that you could also use randi(6) here
        
        % Check if the rolled number matches the user's guess
        if rolled == guess                                              % If it does match...
            disp(['Congratulations, ' name ', you guessed correctly!']) % Display a winning message
        else                                                            % Otherwise, if it doesn't match...
            disp(['Sorry, ' name ', you guessed incorrectly'])          % Display a losing message
        end
        clear rolled                    % Clear anything we don't need to keep in memory
        
    end
    clear roll rolls sides guess        % Clear anything we don't need to keep in memory
    
end
clear guess name yearOfBirth           	% Clear anything we don't need to keep in memory



%  Problems [5] and [6]: Define a variable named ‘rolls’ at the top of the 
%  script to specify the number of rolls that will be simulated, and use 
%  this variable throughout the rest of the function
%  Define a variable named ‘sides’ at the top of the script to specify the 
%  number of sides on the dice, and use this variable to specify the scale 
%  of random numbers generated (i.e. to simulate rolling an 8-, 10- or 12- 
%  sided, instead of the standard 6 sided, dice). For additional points, 
%  use this variable to control when the ‘ERROR!’ warning above is 
%  triggered, and what text is displayed in that warning

%  As you can hopefully see, we have already done this from the start. It's
%  very good practice to get into defining all variables that will keep a
%  constant value at the top of your script, before the actual code begins,
%  as it makes it much easier to edit the code in future - should the value
%  of those variables change - rather than going through the whole script
%  and looking for every time you have used that constant value, running
%  the risk that if you miss one instance then your script will no longer
%  do what it is supposed to without generating any errors