%% This script accompanies the "Plotting" lecture from the UCL Institute of
%  Cognitive Neuroscience Matlab Course. All course details and content - 
%  including pre-recorded lectures, slides, practical exercises and 
%  solutions - can be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk


%% Basic plotting
%  Before we start plotting, we need some data - so we'll begin by loading 
%  the 'PlottingData.mat' file (that can also be downloaded from the course 
%  website) into the Matlab workspace, using the 'load' function (as 
%  demonstrated in the last lecture):
load plottingData

%  First we're going to look at creating a very basic line plot. Type the 
%  following command into the command window and press return:
plot(PlotEEG)

%  This should immediately open a new graphics window entitled 'Figure 1'
%  with an EEG trace plotted as a thin blue line. Notice that the x-axis is
%  simply numbered from 1 to the size of the EEG trace variable (i.e.
%  1537). This is because we have not defined a corresponding x-axis. In
%  fact, this is a 3s EEG trace recorded at 512Hz, and comes with an
%  accompanying time stamp variable, so if we want to see how the signal
%  changes in 'real time', we can use the following command:
plot(PlotEEGTime,PlotEEG)

%  This uses a very basic plot(x,y) syntax. As you can see, the plot has
%  stayed the same, but the units of the x-axis have changed, and now 
%  correspond to the time in seconds since the beginning of the EEG
%  recording that this snippet was taken from. 

%  In the example above, we simply plotted one vector (i.e. there is only
%  one row / column in the 'PlotEEG' variable), but if we ask MATLAB to
%  plot a matrix, then it will automatically plot each column of the matrix
%  as a separate line, like so:
plot(PlotMEGTime,PlotMEG)

%  If your data happens to be arranged in rows, then you can use the
%  apostrophe shortcut (') to transpose the data so that it plots 
%  correctly, for example, compare the output from the previous command 
%  with this:
plot(PlotMEG')

%  ...which now plots each of the 361 rows of the 'PlotMEG' variable as
%  separate lines on the graph, and hence looks like a very colourful mess!

%  Another plotting function that can be useful for displaying experimental
%  results is 'errorbar', which will add error bars of user-defined length
%  to each point plotted on a line, like so:
errorbar(ErrorbarX,ErrorbarY,ErrorbarSE)

%  Note that the length of each error bar is defined by the corresponding
%  value in the third input to the function, 'ErrorbarSE'.

%  The next plotting function we will introduce is a scatter plot, created 
%  with 'scatter' function, which you must provide with both x and y axis
%  data points, like so:
scatter(ScatterX,ScatterY)



%% Figure Handling
%  You might have noticed while entering the 'plot' commands above, that no
%  new Figure window was opened. Instead, each 'plot' command immediately 
%  over-wrote the previously displayed figure. MATLAB will always use a 
%  single figure window to output any plotting commands you enter, unless 
%  you instruct it to open a new Figure window. This is done with the 
%  'figure' command, as follows:
figure

%  Hopefully, this should open a new plotting window. We're not going to
%  use it for now, so we can also get rid of it by using the close
%  function, as follows:
close

%  Note that this only closes the most recent figure panel that we have
%  been working on, i.e. that which is considered currently in use by
%  MATLAB. Hence, if we open another figure window...
figure

%  ... but then click on the 'Figure 1' window which we have plotted 
%  several lines in, and enter the command again:
close

%  ...MATLAB will close that window, instead of the one we just opened. It
%  is also worth noting that, if we have several figure windows open:
figure
figure
figure

%  Then the following command can be used to close all of them at once:
close all

%  Now, if you have several data sets that you wish to plot on the same 
%  graph, but held in separate variables, you can also use the 'hold' 
%  function to tell MATLAB that you wish to add to the current figure, 
%  rather than continually over-write the previously plotted data. For 
%  example, keep an eye on the figure panel while you enter the following 
%  commands, one at a time:
plot(PlotEEGTime,PlotEEG)           % This plots the first line

hold on                             % This tells MATLAB that you wish to 
                                    % 'hold' the current figure and add
                                    % more lines to it

plot(PlotEEGTime,PlotEEG2)          % Plot the second line

plot(PlotEEGTime,PlotEEG3)          % Plot the third line

hold off                            % This tells MATLAB to stop 'holding'
                                    % the current figure, which means that
                                    % the next time you plot something, it
                                    % will overwrite the whole existing
                                    % figure, like so:
                                    
plot(PlotEEGTime,PlotEEG3)          % Plot the third line again



%% Axis limits
%  Now, you might notice that the limits (i.e. scale) of the x and y axes 
%  are automatically assigned by MATLAB each time you enter a 'plot' 
%  command to fit the data you are plotting. However, in many cases, we 
%  would like to define the axis limits ourselves, to fit the data better, 
%  for example. To do this, we can use the commands 'xlim([min max])' and 
%  'ylim([min max])'. We can directly use numbers for the 'min' and 'max' 
%  values, or pass elements from an existing variable, for example:
ylim([-2000 2000])
xlim([PlotEEGTime(1) PlotEEGTime(end)])

%  Hopefully, this should change the x-limits to exactly match the data (as
%  we have used the maximum and minimum values taken directly from the 
%  x-axis labels in 'PlotTime', and stretched the y-axis limits somewhat.
%  There are several other commands that can be useful to modify the axis
%  limits of a plot that you have created, including the following:
axis tight          % This sets the axis limits to exactly match the range 
                    % of the data

axis square         % This makes the plot window square in appearance

axis off            % This removes all axes, axis labels and the background
                    % from a plot, which can be useful under certain
                    % circumstances

%  In addition, you may sometimes wish to add grid lines to your plots, to
%  more easily visualise the relative location of different points in your
%  figure, for example. Grid lines can easily be toggled on and off in any
%  figure using the 'grid on' and 'grid off' commands. To demonstrate, try
%  executing the following lines of code, one at a time:
grid on

grid off
                    
%  Finally, there is a useful command for eliminating the secondary x and y
%  axes (at the top and right hand side of the figure), for a more
%  conventional appearance:
box off

%  Although these axes can also be easily restored, if you change your
%  mind:
box on

                    
                    
%% Figure text
%  Now, in many cases, we will wish to label our axes, put a title on our
%  figure, and perhaps even add some text on the plot itself to deescribe
%  what is being shown in more detail. First, labels can be added to each
%  axis using the commands 'xlabel' and 'ylabel', followed by the string
%  you wish to display. Let's set up a new graph and examine these 
%  commands, as follows:
close all
scatter(ScatterX,ScatterY)
xlabel('Independent Variable')
ylabel('Dependent Variable')

%  Alternatively, we can display the text over multiple lines by entering
%  the string into a cell, as follows:
xlabel({'Independent';'Variable'})

%  Now, we can create a title for the figure using the 'title' command,
%  like so:
title('Lots of nice blue circles')

%  ...we can add a legend to the figure, using the 'legend' command, like
%  so:
legend('Experiment 1 Data')

%  ...and we can add some text to the plot itself, using the 'text' 
%  function, which requires x and y positions as well as a string as input.
%  For example, try entering the following, one at a time:
text(0.8,0,'Text at [0.8,0]!')
text(0,0.8,'Text at [0,0.8]!')
text(0,0,'Text at the origin!')

%  Each of these functions ('xlabel','ylabel','title' and 'text') also take
%  additional inputs to specify the format of the text, as name / value 
%  pairs. There are a large number of formatting options (which you can 
%  browse by typing "Text Properties" into MATLAB help), but some of the 
%  most important include:

%  'FontSize', which specifies the size of the font, in points, like so:
title('Lots of nice blue circles','FontSize',24)

%  'FontName', which specifies the font used for the text, like so:
title('Lots of nice blue circles','FontSize',24,'FontName','Courier')

%  ...noting that you can display a list of available fonts by entering:
listfonts

%  'FontWeight', which specifies whether font is 'bold' or 'demi':
xlabel({'Independent';'Variable'},'FontSize',24,'FontName','Times','FontWeight','bold')

%  'FontAngle', which specifies whether the font is 'italic' or 'oblique',
%  like so:
title('Lots of nice blue circles','FontSize',24,'FontName','Comic Sans MS','FontAngle','italic')

%  One final thing to note, which might have become apparent with the last
%  example - Matlab will display figure titles in bold font by default,
%  although of course this can be adjusted using the 'FontWeight' option
%  described above:
title('Lots of nice blue circles','FontSize',24,'FontName','Comic Sans MS','FontAngle','italic','FontWeight','demi')


%% Editing figure properties
%  We are now going to look at how to edit the various properties of a
%  figure - i.e. the weight, colour and style of the plotted line, the
%  labels on the x and y axis, the colour of the background etc. To do
%  this, we first need a figure to play with, so let's plot our sample MEG 
%  data again:
close all
plot(PlotMEGTime,PlotMEG)

%  First, the most straightforward way to edit figure properties is to
%  click on 'Edit -> Figure Properties...' in the toolbar of the Figure
%  window. This will bring up an additional panel at the bottom of the
%  Figure window which we can use to browse and change each property of the
%  figure. For example, open the panel, click on one of the plotted lines,
%  and you should see the panel change to display the properties of that 
%  line. On the right hand side, you can now change the weight (i.e.
%  thickness), colour, and style of the line, add individual markers of
%  various kinds to each point plotted, and so on, using the individual
%  drop down menus. Have a play around with these and see how the graph
%  changes, then try doing the same thing on the other plotted lines.

%  Now, if you click on the white background of the figure, the panel at
%  the bottom of the screen will change again, and you can edit the axis
%  labels, figure title and font format. Try adding some labels and a title
%  to get an idea of how these options work. Note that by clicking on the
%  'Ticks...' box on the right hand side, you can manually adjust the
%  position of each 'tick' on the x and y axes to suit your needs. 

%  When you have finished editing the properties of the figure to meet your
%  needs, just close the editing panel by clicking on the little 'x' in the
%  top right hand corner.

%  Second, a more direct way of editing figure properties is directly from
%  the command line, either before or after you plot the figure. To examine
%  this, let's close the figure we have just been editing, and start
%  afresh:
close

%  Now, when we first plot a figure, we can pass additional inputs as 
%  name / value pairs to the 'plot', 'errorbar', 'scatter', or other 
%  plotting commands to define properties of the figure that is produced. 
%  For simple line plots, we will most commonly want to edit the colour, 
%  weight and style of the plotted line. To do this, we provide a list of 
%  additional inputs to the 'plot' command, each time specifying the 
%  property we wish to adjust, and the value we wish it to take, as 
%  follows:
plot(PlotEEGTime,PlotEEG,'LineWidth',3,'Color','r','LineStyle','--')

%  This should plot the sample EEG trace as a thick, red, dashed line. Note
%  that the order in which we define these properties is not important, as
%  the 'name' of each option is declared immediately before the 'value' we
%  wish to assign that option, in turn. Hence, you should get exactly the 
%  same output by entering:
close all
plot(PlotEEGTime,PlotEEG,'Color','r','LineStyle','--','LineWidth',3)

%  Also note that, by using the 'hold on / hold off' command above, we can
%  plot additional lines with different specifications in the same window,
%  for example:
hold on
plot(PlotEEGTime,PlotEEG2,'Color','g','LineStyle',':','LineWidth',2)
hold off

%  A full list of the identifiers for colours, line styles, marker styles
%  etc. can be found in the accompanying slides. Moreover, a full list of 
%  the properties that can be defined when you call the 'plot' function, 
%  and the various values they can take, can be found by searching for
%  "Lineseries properties" in the MATLAB Help window.

%  Also note that colours do not need to be defined with an identifier 
%  shortcut (i.e. letter), they can be specified using the relative 
%  saturation of red, green and blue in square brackets (i.e. [R G B]), as 
%  follows:
plot(PlotEEGTime,PlotEEG,'Color',[0.1 0.5 0.8],'LineWidth',3)
hold on
plot(PlotEEGTime,PlotEEG2,'Color',[0.7 0.7 0.7],'LineWidth',3)
hold off

%  We can use these properties to plot an error bar graph with no adjoining
%  line, for example:
errorbar(ErrorbarX,ErrorbarY,ErrorbarSE,'LineStyle','none','Marker','o','MarkerSize',10,'MarkerFaceColor','k','MarkerEdgeColor','k','Color','k')

%  Finally, as the colour, line and marker style are the properties most 
%  commonly adjusted, there is a shortcut syntax to specify these alone, by
%  placing them as input within a single pair of apostrophes, for example:
plot(PlotEEGTime,PlotEEG,'r--*')
hold on
plot(PlotEEGTime,PlotEEG2,'b:o')
hold off

%  More complex properties of a figure can then be adjusted from the
%  command line using the 'set' function. A list of these properties can be
%  found by searching for 'Axes Properties' in MATLAB help, and the current
%  value of each property can be viewed by typing the 'get' command into
%  the workspace. The 'set' and 'get' commands require us to tell MATLAB
%  which figure we are referring to, however. Rather than go into the
%  details of figure handles, for now, we will just use the shortcut 'gca',
%  which refers to 'get current axis'. This shortcut tells MATLAB that we
%  want to 'set' or 'get' the properties of the current 'axis' (i.e. plot). 
%  For example, try entering the following command:
get(gca)

%  This should output a long list of all the properties associated with the
%  current 'axis' (i.e. plot) in the command window. Most of these 
%  properties are far beyond the scope of this course, but a couple are 
%  more straightforward and may be useful for basic plotting. For example, 
%  we may want the ticks on our x and y axis to point outside of the 
%  figure, rather than inside. We can change this 'TickDir' property using 
%  the 'set' function, as follows:
set(gca,'TickDir','out')

%  We may also want to eliminate the labels of one or many of our axes, as
%  follows:
set(gca,'XTickLabel',[])

%  ...or change them to arbitrary text, which we enter as a cell array,
%  like so:
set(gca,'YTickLabel',{'one','two','three','four','five','six','seven'})



%% Subplots
%  MATLAB also has a function for displaying several different figures in
%  separate panels but within a single global Figure window. This function
%  is called 'subplot'. The syntax for using 'subplot' is to specify how
%  many rows and columns of panels you would like in your figure window
%  (in exactly the same way as assigning a variable in MATLAB), and then
%  specifying which panel or set of panels you wish to plot in with the
%  next command. For example, the following code sets up a figure window
%  with two rows and two columns of panels (i.e. four panels in total), and
%  then plots a different figure in each panel in turn:
subplot(2,2,1)
plot(PlotEEGTime,PlotEEG)

subplot(2,2,2)
plot(PlotEEGTime,PlotEEG2)

subplot(2,2,3)
plot(PlotEEGTime,PlotEEG3)

subplot(2,2,4)
plot(PlotMEGTime,PlotMEG)

%  To more easily control and edit each separate panel, you can assign an
%  'axis handle' to each panel, that subsequently allows you to send 
%  commands directly to that panel from the command line. This is achieved
%  by simply assigning a variable as the output of each subplot command,
%  and then using that variable as the first input to any subsequent
%  'plot' and 'set' command, like so:
close
h1 = subplot(2,2,1);
h2 = subplot(2,2,2);
h3 = subplot(2,2,3);
h4 = subplot(2,2,4);

plot(h1,PlotEEGTime,PlotEEG)
plot(h2,PlotEEGTime,PlotEEG2)
plot(h3,PlotEEGTime,PlotEEG3)
plot(h4,PlotMEGTime,PlotMEG)

set(h1,'XLim',[min(PlotEEGTime) max(PlotEEGTime)])
set(h2,'YLim',[-2000 2000])
set(h4,'YLim',[-2000 2000])
axis(h3,'tight')
xlabel(h1,'Time (s)')

%  Finally, it is important to note that subplots can span any number of
%  different panels, and this does not have to be equal between plots. This
%  is achieved by passing all of the panels we wish to plot a single figure
%  across as the third input to the 'subplot function'. For example, we can
%  do the following:
h1 = subplot(2,3,1:2);
h2 = subplot(2,3,[3 6]);
h3 = subplot(2,3,4);
plot(h1,PlotEEGTime,PlotEEG)
plot(h2,PlotEEGTime,PlotEEG2)
plot(h3,PlotEEGTime,PlotEEG3)



%% Bar charts and histograms
%  MATLAB has many other plotting functions, to generate a multitude of
%  different graphical outputs. We will briefly introduce some of these
%  other commonly used plotting functions here. Firstly, we can plot bar
%  charts and histograms using the 'bar' (or 'barh') and 'histogram' 
%  functions, with much the same syntax as that discussed for 'plot', 
%  'errorbar' and  'scatter' above. For example, with the 'bar' function, 
%  we can generate a bar chart with a single input:
close
bar(BarY)

%  ...or we can choose to specify the positions of each bar on the x-axis:
bar(BarX,BarY)

%  ...we can pass the function a third input to define the width of the
%  bars:
bar(BarX,BarY,0.4)

%  ...and we can define aditional properties of the bar chart, such as 
%  colour and line width, adjust the scale of the axes etc. as outlined
%  above:
bar(BarX,BarY,0.4,'FaceColor','w','EdgeColor','k','LineWidth',3)
xlim([0 1.1])
ylim([0 18])

%  The syntax for the 'histogram' function is slightly different, as it  
%  always takes the data that we wish to histogram as the first input. As 
%  an example, let's generate a large array of normally distributed random
%  numbers and then examine their frequency distribution:
Gaussian = randn(10000,1);
histogram(Gaussian)

%  In addition, we can specify either the total number of bins we would 
%  like, as the second input to the 'histogram' function:
histogram(Gaussian,101)

%  ...or the positions of the edges of those bins, as the second input to
%  the 'histogram' function:
histogram(Gaussian,-5:0.1:5)



%% 2D plots
%  Finally, MATLAB can be used to generate more complex colour plots of two
%  or three dimensional data. There are many functions available to do
%  this, but some of the most commonly used are 'contourf' and 'imagesc'.
%  Again, the syntax used to execute these functions and adjust the
%  resultant plots is very similar to that described above. For example, we
%  can plot a filled 'contour' plot of some two-dimensional data with by
%  providing a single input:
contourf(Morlet)

%  ...or we can provide additional inputs that specify the x and y axis
%  data, as follows:
contourf(MorletTime,MorletFreq,Morlet)

%  Specific to the 'contourf' function, we can also specify the number of
%  different z-axis gradations that we require, i.e. the colour resolution
%  being applied. This is given as a fourth (or second), numeric input:
contourf(Morlet,50)
contourf(MorletTime,MorletFreq,Morlet,50)

%  You will notice that, by default, 'contourf' draws a black line around
%  each different contour. This can obscure the figure itself when a larger
%  number of gradations are used, so we can use the syntax described above
%  to get rid of these lines:
contourf(MorletTime,MorletFreq,Morlet,50,'LineStyle','none')

%  If we wish to see the numerical value of each z-axis contour (i.e the 
%  value which each colour represents), we can add a colour axis to the 
%  figure using the 'colorbar' command:
colorbar

%  We can then add axis labels and a title of a defined size, and change
%  the y-axis to have a logarithmic scale, for example, as outlined
%  previously:
xlabel('Time since stimulus onset (s)','FontSize',14)
ylabel('Frequency (Hz)','FontSize',14)
title('Spectrogram of Hippocampal LFP','FontSize',20)
set(gca,'YScale','log')

%  The 'imagesc' function works in a very similar manner:
figure
imagesc(MorletTime,MorletFreq,Morlet)
xlabel('Time since stimulus onset (s)','FontSize',14)
ylabel('Frequency (Hz)','FontSize',14)
title('Spectrogram of Hippocampal LFP','FontSize',20)

%  However, note that - by default - the 'imagesc' function reverses the
%  direction of the y axis, so that it starts at the top left hand corner
%  and the values increase as you move down the axis. We can correct this
%  using the 'set' function again:
set(gca,'YScale','log','YDir','normal')



%% Saving a figure from the command line or a Matlab script
%  There are several different ways to save figures from the command line,
%  or from within a Matlab script or function. The two main functions used
%  are 'saveas' and 'print'. Each  of these will generate an image file, of
%  a format specified by you. The 'saveas' function is fairly
%  straightforward, simply requiring you to specify which figure to save,
%  the name of the file and the format. You can specify which figure you
%  would like to save using the figure handle, as described above, or by 
%  specifying the currently active figure using 'gca'. The figure format 
%  can be specified by simply using the appropriate extension to the file 
%  name. For example, try:

saveas(gca, 'Spectrogram.jpg')

%  Now have a look in your currently active folder, and a jpeg image file
%  of the spectrogram figure from above should have appeared.
%  Alternatively, we can try closing all currently active figures,
%  generating a new figure with a specific figure handle, and saving that
%  in a different format:

close all
Fig1  = plot(PlotEEGTime,PlotEEG,'k','LineWidth',2);
saveas(Fig1, 'LinePlot.pdf');

%  To see a list of the different file formats that can be produced by
%  Matlab, just have a look at the help documentation for the 'saveas'
%  function. 

%  A slightly more versatile alternative to 'saveas' is 'print', which can
%  be used to either print figures directly from a physical printer, or
%  generate image files of varying formats and quality. The 'print' 
%  function again requires you to specify the file format and file name. 
%  For example, try:

print('LinePlot2','-dpdf')

%  For more examples on the kind of files that 'print' can produce, and the
%  other inputs that it takes (to specify the file resolution etc.), have a
%  look at the help file either online or from within Matlab