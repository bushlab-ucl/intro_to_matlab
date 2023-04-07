%% Lecture 4 Practical Exercise from the UCL Institute of Cognitive 
%  Neuroscience Matlab Course. All course details and content - including 
%  pre-recorded lectures, slides, practical exercises and solutions - can 
%  be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk

%  Firstly, you will need to load the PlottingData.mat file into the Matlab
%  workspace. If the folder in which that file is located is on the Matlab
%  path, you can do this with the simple 'load' command:
load('PlottingData.mat')

%  Otherwise, you can simply drag and drop the file into the workspace.
%  Once the data is loaded, we can now start creating the required plots.
%  There are several different possible methods of doing this - I will go
%  through one method here, but as long as your final plots look the same,
%  then any other method is equally as valid

%  Then, let's create a new figure:
figure

%  Now, we can plot the first bar chart with the requested 'EdgeColor'
%  (using the 'k' shortcut to indicate that we would like black lines), the
%  requested 'LineWidth' of 3, and a grey 'FaceColor' (i.e. fill), by 
%  defining a light grey in RGB coordinates (noting that grey colors tend 
%  to have the same values for red, green and blue, with lower values 
%  giving a darker grey):
bar(ErrorbarX,ErrorbarY,'EdgeColor','k','LineWidth',3,'FaceColor',[0.8 0.8 0.8])

%  Now, let's 'hold' the figure and add the error bars. Again, we can use
%  the 'k.' shortcut to indicate that we would like black dots, and set the
%  'LineWidth', all in one line when we create the plot:
hold on
errorbar(ErrorbarX,ErrorbarY,ErrorbarSE,'k.','LineWidth',3)
hold off

%  Next, let's add the x and y axis labels, change the 'FontSize' of the
%  whole plot, edit the y axis limits, make the figure square, and add the
%  requested title:
xlabel('LFP Phase Bin','FontSize',24,'FontName','Times')
ylabel('Normalised Amplitude','FontSize',24,'FontName','Times')
set(gca,'FontSize',18)
ylim([-1.5 1.5])
axis square
title('Phase Modulation of Signal Amplitude','FontSize',32,'FontName','Times')

%  Finally, let's generate a pdf copy of this figure using the 'print'
%  function, as described in the lecture:
print('-dpdf', 'PhaseAmpMod')

%  Now let's create our second figure:
figure

%  This time, we'll use handle axes to more easily control the properties
%  of each subplot. We assign the handle axes (h1, h2 and h3) when we
%  create the blank subplot, and then use the handle as the first input
%  when we call the 'plot' function, to tell that function which window we
%  would like to generate each plot in. Again, we can also set the colour
%  and width of the plotted lines when we first call the 'plot' function:
h1 = subplot(3,1,1);
plot(h1,PlotEEGTime,PlotEEG,'r','LineWidth',3)

h2 = subplot(3,1,2);
plot(h2,PlotEEGTime,PlotEEG2,'g','LineWidth',3)

h3 = subplot(3,1,3);
plot(h3,PlotEEGTime,PlotEEG3,'b','LineWidth',3)

%  Now, to set the x and y axis limits for all three plots at the same
%  time, we can use the 'linkaxes' function, which links the properties of
%  a set of figures, so that any changes to x and y limits etc. that are
%  made to any one figure from them on are applied to all of the figures:
linkaxes([h1 h2 h3])
xlim([min(PlotEEGTime) max(PlotEEGTime)])
ylim([-2000 2000])

%  Finally, we can add the requisite x and y axis labels:
xlabel(h3,'Time (s)','FontSize',18,'FontName','Arial')
ylabel(h1,'Signal Amplitude (uV)','FontSize',12,'FontName','Arial')
ylabel(h2,'Signal Amplitude (uV)','FontSize',12,'FontName','Arial')
ylabel(h3,'Signal Amplitude (uV)','FontSize',12,'FontName','Arial')

%  In this case, we can use the 'saveas' function to save a *.png copy of
%  this figure. The 'saveas' function needs us to specify the figure to be
%  saved, as the first input (in this case, we can use 'gca' or 'get
%  current axes' because this is the most recent figure we have edited, and
%  therefore the current axis); and the filename as the second input. The
%  function will automatically detect what format you wish to generate from
%  the filename extension that is specified:
saveas(gca,'EEGTraces.png')

%  Now let's generate the final figure. Again, we'll start with a new
%  figure window:
figure

%  In this case, because the MEG time series are stored in each column of
%  the matrix (rather than each row), we can directly generate a plot of
%  all five traces in different colours by passing the whole matrix to the
%  'plot' function in one step, and just specify the required 'LineWidth'
%  as an additional input:
plot(PlotMEGTime,PlotMEG,'LineWidth',2)

%  Now let's change the y axis limits and add our legend - remember that
%  the different labels need to be specified in a cell array (i.e. using
%  curly brackets):
ylim([-1500 1500])
legend({'MZF01','MLF21','MRF21','MZF02'})

%  Now we can add some text to the figure using the 'text' function by
%  specifying the x and y location we wish the text to be placed, the text
%  we wish to add (as a string variable, so in inverted commas), and we can
%  also specify the 'FontSize' at the same time:
text(0.15,1300,'Sample MEG Signals','FontSize',16)

%  Now we can change the x axis limits, add the other axis labels and make
%  the plot square:
xlim([-0.2 1])
xlabel('Time (s)','FontSize',16)
ylabel('Signal Amplitude (fT)','FontSize',16)
axis square

%  Then, once again, we can use the 'print' function to generate a pdf
%  version of this figure:
print('-dpdf','MEGTraces')

%  Finally, find the pdf and png image files we have created in your 
%  current Matlab folder and load them outside of Matlab - how do they 
%  look? 