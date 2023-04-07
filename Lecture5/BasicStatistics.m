%% This script accompanies the "Basic Statistics" lecture from the UCL
%  Institute of Cognitive Neuroscience Matlab Course. All course details
%  and content - including pre-recorded lectures, slides, practical
%  exercises and solutions - can be found on the course website:
%  https://moodle.ucl.ac.uk/course/view.php?id=22765
%
%  Daniel Bush, UCL (2020) d.bush@ucl.ac.uk



%% Power Calculations
%  Before you carry out an experiment, it is often useful to perform a
%  power calculation, to get an idea of the sample size you will need (i.e.
%  how many participants you will need to test) to detect an effect of a
%  certain size - i.e. the effect you wish to investigate - with a given 
%  probability

%  For example, let's imagine we have an IQ test that should return an 
%  average value of 100 across the population, but we suspect that average 
%  values may be increasing over time (because, among other things, it's a 
%  terrible and pointless test). We want to test the possibility that the 
%  average IQ  across the population is now 110, and we know (from previous
%  studies) that IQ scores are normally distributed, and their standard 
%  deviation across the population is 20 points. How many people do we need
%  to test to determine if the average IQ is now 110?

%  Well, the fact that they are normally distributed tells us that we would
%  probably test our outcome with a t-test (of which, more below) - i.e. we
%  would measure IQ scores in a sample of the population, and then use a
%  one-sample t-test to ask if the mean of the distribution of scores
%  obtained from that sample differs from 100. Armed with that knowledge,
%  along with the size of the effect we wish to detect (i.e. the difference
%  between a mean of 100 and 110) and the variance (i.e. the standard
%  deviation of 20), we can now estimate the sample size we will need using
%  the sampsizepwr function:

sampSize	= sampsizepwr('t',[100 20],110);

%  The output 'sampSize' is an estimate of the size of the sample needed to 
%  detect the corresponding effect, in this case, 44 participants (which
%  seems feasible!) 

%  Note that, by default, the sampsizepwr function estimates the sample 
%  size needed for a power of 0.9 - that is, so that the probability of 
%  finding an effect (if an effect exists!) is 0.9, at the p < 0.05
%  significance level. However, each of these parameters can be manipulated
%  using additional inputs to the sampsizepwr function - check the help
%  information and extensive examples for more information

%  For example, we can change the desired power using the fourth input to
%  the function, so we could repeat the calculation above, but for a power
%  value of 0.8 (in which case we would expect a smaller sample size to be 
%  required), like so:

sampSize	= sampsizepwr('t',[100 20],110,0.8);

%  This illustrates an important trade off in study design - we are
%  reducing the size of our sample (and therefore, the time and cost of
%  acquiring more data) in return for a reduced probability of finding an
%  effect, if one exists

%  Alternatively, you can use the sampsizepwr function to compute the power
%  of a given study - i.e. given the effect size, variance, and sample
%  size, what is the probability of finding an effect, if one exists? To do
%  so, we provide a fifth input that corresponds to the sample size, and 
%  leave the fourth input empty (i.e. use an empty set of square brackets
%  as the fourth input). So, for example, we could compute the power of a 
%  study with only twenty participants, like so:

power       = sampsizepwr('t',[100 20],110,[],20);

%  This tells us that, if we test 20 people, we only have a ~56% chance of
%  detecting a mean IQ score of 110 at a significance level of p < 0.05, if 
%  that is the true mean IQ score across the population. It is important to
%  note, however, that establishing that your study was underpowered after
%  you have carried it out, and not found an effect, does not mean that an
%  effect necessarily exists...

%  Let's clear some variables that we don't need before we continue
clear power



%% Tests of Normality
%  Having carried out your study, one of the first things you may need to
%  check - in order to determine which statistical tests are suitable for
%  your data - is whether your results are normally distributed or not 
%  (assuming that you are dealing with continuous rather than categorical
%  measurements). A number of different tests have been proposed to 
%  establish whether a set of data adhere to a normal distribution (each of 
%  which is loosely related to the more general Kolmogorov–Smirnov test,
%  which measures the distance between two distributions). These include
%  the Lilliefors test (implemented using the lillietest function), the
%  Anderson-Darling test (implemented using the adtest function), and the
%  Jarque-Bera test (implemented using the jbtest function)

%  In the simplest case, each of these functions will take a single input -
%  the data that you wish to test for normality - and return a single
%  logical output which tells you whether or not you can reject the null
%  hypothesis at a significance level of p < 0.05. In effect, if the value
%  that is returned is false (i.e. 0), then your data is normally 
%  distributed; and if the value that is returned is true (i.e. 1), then 
%  your data is NOT normally distributed

%  As an example, let's create some arbitrary data distributions using the
%  various Matlab functions that generate random numbers, and then test
%  whether those distributions are normal or not:

nSamps      = 100; 
unifData    = rand(nSamps,1);
normData    = randn(nSamps,1);
expData     = exp(randn(nSamps,1));

%  First, let's try using the Lilliefors test to establish whether each
%  distribution is normal:

h_unif      = lillietest(unifData);
h_norm      = lillietest(normData);
h_exp       = lillietest(expData);

%  ...hopefully, what you will see is that a value of 1 (i.e. true, the
%  null hypothesis can be rejected, the data is not normally distributed)
%  for h_unif and h_exp and a value of 0 (i.e. false, the null hypothesis
%  cannot be rejected) for h_norm - although I would like to emphasise that
%  this will not always be the case, due to stochasticity in the
%  distributions we have generated

%  In addition, we can ask for two other outputs from the lillietest
%  function (and, similarly, from the equivalent functions I will introduce
%  below) that specify the p-value and test statistic, like so:

[h_unif,p_unif,st_unif]	= lillietest(unifData);
[h_norm,p_norm,st_norm]	= lillietest(normData);
[h_exp,p_exp,st_exp]	= lillietest(expData);

%  Note that you may see some warnings when you execute those lines of
%  code, because these tests use look-up tables to establish the p-value
%  given the computed test statistic and, in some cases - where that test
%  statistic is very large or very small - values fall outside of that look
%  up table

%  Next, let's run the equivalent analysis using the Anderson-Darling test,
%  using the adtest function, and see how the output compares:

[h_unif,p_unif,st_unif]	= adtest(unifData);
[h_norm,p_norm,st_norm]	= adtest(normData);
[h_exp,p_exp,st_exp]	= adtest(expData);

%  As you can (hopefully) see, the results of this test are fairly similar
%  to those produce by the Lilliefors test above. Similarly, if we try
%  running the Jarques-Bera test using the jbtest function:

[h_unif,p_unif,st_unif]	= jbtest(unifData);
[h_norm,p_norm,st_norm]	= jbtest(normData);
[h_exp,p_exp,st_exp]	= jbtest(expData);

%  ...then results should again be fairly similar - although, of course,
%  there will be some small variations in the p-values generated by each
%  test, and the values of the test statistic are specific to each test

%  Let's clear some variables that we don't need before we continue
clear expData h_* nSamps p* st_* unifData



%% Comparing the means (parametric)
%  Now, if you have collected experimental data that is continous, rather 
%  than categorical (i.e. where the samples can take a range of values, 
%  like test scores or reaction times, as opposed to yes / no or true / 
%  false outcomes) and your data is normally distributed, the next step in 
%  your statistical analysis would generally be to compare the mean of that
%  distribution of measurements - whatever they might be - either to some 
%  constant value, between two conditions, or between groups of
%  participants. To do so, under most circumstances, you would use the 
%  Student's t-test. This test comes in two forms, depending whether it is 
%  applied to one sample / paired / dependent samples (i.e. to one set of 
%  measurements, or two sets of measurements from the same participants) or
%  two sample / unpaired / independent samples (i.e. two sets of
%  measurements from different participants). These tests are implemented
%  with the Matlab functions ttest and ttest2, respectively. The syntax is
%  identical in both cases, although the assumptions - and therefore the
%  output - will differ. 

%  To begin with, let's have a look at the one sample t-test. To
%  demonstrate how this works, let's return to our theoretical study of IQ
%  scores, as described at the start of this script. Let's suppose we went
%  ahead, after our power calculation, and tested 44 participants; that the
%  mean IQ test score is 110, with a standard deviation of 20; and that we
%  seek to establish whether the mean of this sample is different from 100.
%  First, we can simulate our experimental data using the randn function,
%  as demonstrated several times earlier in the course:

nParts      = 44;
iqScores    = 110 + 20*randn(nParts,1);

%  We can now examine whether the mean of this distribution differs from a
%  value of 100 using the ttest function. This function can provide up to
%  four outputs - the result of the test, as either a value of 1 (true, the
%  null hypothesis can be rejected, and the mean of the distribution IS
%  different from 100) or 0 (false, the null hypothesis cannot be rejected,
%  the mean of the distribution IS NOT different from 100); the
%  corresponding p-value; confidence intervals; and statistical details,
%  including the degrees of freedom and t-statistic. To obtain these
%  outputs, in this example, we must provide two inputs - the data, and the
%  mean value under the null hypothesis (i.e. 100):

[h,p,ci,stats] = ttest(iqScores,100);

%  Hopefully, this should return a significant result - i.e. you should see
%  a value of h = 1 and p < 0.05 - although, again, this is not guaranteed
%  as the values in our iqScores distribution are generated at random

%  Importantly, if we only provide one input to the t-test function, it
%  will test for a mean value of zero under the null hypothesis. So, for
%  example, we can test whether the normal distribution we generated above
%  has a mean that differs from zero - which we would not expect (i.e. we
%  would anticipate an outcome of h = 0 and p > 0.05). In addition, we 
%  don't have to generate all four outputs of the t-test function - perhaps
%  the first two will suffice:

[h,p] = ttest(normData);

%  Now, it is also possible to use the t-test function to compare paired
%  samples - i.e. from the same group of participants. Let's suppose that
%  we tested the same group twice with different IQ tests, and we were
%  interested in whether there was any consistent difference in scores
%  between those tests. So, first, we can generate another set of simulated
%  results from the hypothetical group of participants:

iqScores2 = 110 + 20*randn(nParts,1);

%  ...and then, we can use the t-test function to establish whether there
%  is a significant difference between those two sets of scores. In this
%  case, we are asking whether the mean difference between those scores is
%  zero (i.e. that is the null hypothesis), and so we do not need to
%  specify that mean value an input to the ttest function (by default, it 
%  will test for a mean value of zero under the null hypothesis). In 
%  addition, we can either provide the two sets of scores as two separate 
%  inputs to the function:

[h,p] = ttest(iqScores,iqScores2);

%  ...or we can achieve the exact same output by providing one input,
%  corresponding to the difference between those two sets of scores:

[h,p] = ttest(iqScores-iqScores2);

%  In each case, we would not expect a significant result (i.e. we would
%  anticipate an output of h = 0 and p > 0.05, because these two sets of
%  scores were drawn from the exact same distribution)

%  Finally, let's suppose we have run a different experiment in which one
%  larger population has been given a memory test, for example; and we are
%  interested in establishing whether or not there is a difference in
%  performance between younger and older participants. First, let's
%  simulate some experimental data, and suppose that memory performance
%  does - in fact - decline slowly with age, in addition to exhibiting
%  variance between different participants. So we can generate a list
%  of ages - for 50 participants, aged between 20 and 60, let's say - and 
%  then use that to generate some simulated memory tests scores, which  
%  decline with age but also have a random component, like so:

nParts      = 50;
ages        = 20 + 40*rand(nParts,1);
memScore    = 100 - 0.2*ages + 5*randn(nParts,1);

%  Then we can use logical indexing to identify the younger and older
%  participants, using a median split:

medAge      = median(ages);
youngParts  = ages <= medAge;
oldParts    = ages > medAge;

%  We may also want to check that there are roughly equal numbers of
%  particpants in each (young and old) group, and report the median age:

nYoung      = sum(youngParts);
nOld        = sum(oldParts);

%  Finally, we can now compare the memory scores between these groups. In
%  this case, because the samples are independent (i.e. from different
%  participants), we will use the ttest2 function. The syntax is exactly
%  the same as above - in that we can extract up to four outputs,
%  corresponding to the test result, p value, confidence intervals and
%  statistical details; given either two or three inputs, corresponding to 
%  the two sets of data, and the mean value of the difference between 
%  groups under the null hypothesis (if that is different from zero). In
%  this case we only need two inputs, as we just want to know whether there
%  is any difference (i.e. if the difference is non-zero):

[h,p,ci,stats] = ttest2(memScore(youngParts),memScore(oldParts));

%  Hopefully, you should find a significant difference in this case, given
%  that we explicitly generated data where memory test scores decline with
%  age above (although, as ever there is a random element to these data
%  that means that is not guaranteed)

%  Let's clear some variables that we don't need before we continue
clear ci h iqScores* medAge nOld nYoung normData oldParts p sampSize stats youngParts



%% Comparing the medians (non-parametric)
%  Now, if you have collected experimental data that is continous, and your
%  data is NOT normally distributed, the next step in your statistical 
%  analysis would generally be to compare the median of that distribution,
%  either to some constant value, between two conditions, or between groups
%  of participants. To do so, you would use the Wilcoxon signed rank test, 
%  for one sample / paired / dependent samples; or the Mann-Whitney U test
%  (also known as the Wilcoxon ranked sum test), for two samples / unpaired 
%  / independent samples. These tests are implemented with the Matlab 
%  functions signrank and ranksum, respectively. In both cases, the syntax 
%  is very similar to that described above for ttest and ttest2 (with one 
%  important difference, described below), although the assumptions - 
%  and therefore the output - will differ

%  So, in order to demonstrate how these functions work, we'll need some
%  data. Let's suppose that we run an experiment that collects test scores
%  from two different groups of participants - one with a clinical
%  diagnosis, another without - and then you try some intervention in the
%  clinical cohort, and then test them again a month after the original
%  data set is collected. Let's also suppose that the test produces scores
%  that are uniformly distributed, so we can use the 'rand' function to
%  generate some synthetic experimental data:

nClin               = 30;                           % Number of participants in the clinical group
nControl            = 30;                           % Number of participants in the control group
clinGroupScores_1	= 100 * rand(nClin,1) - 20;     % Synthetic test scores for the clinical group
contGroupScores     = 100 * rand(nControl,1);       % Synthetic test scores for the control group
clinGroupScores_2   = 100 * rand(nClin,1) - 10;     % Synthetic test scores for the clinical group, second test

%  Finally, let's imagine that the test which has been administered is
%  designed to produce a median score of 50. The first thing we may wish to
%  do is examine whether test scores in the clinical or control group
%  differ from this median value. To do so, we can use the signrank
%  function (to administer the Wilcoxon signed rank test), as this would be
%  a one sample test designed to ask whether the median of a single
%  distribution differs from some specific value. In this case, we can ask 
%  for up to three outputs - the p value, the test result, as a 0 or 1, and
%  the value of the test statistic, similar to the output of ttest and 
%  ttest2 above. In this case, however, the order of the first two outputs 
%  is reversed, so we get the p value and then the test result, like so:

[p_cont,h_cont,st_cont]     = signrank(contGroupScores,50);
[p_clin1,h_clin1,st_clin1]  = signrank(clinGroupScores_1,50);
[p_clin2,h_clin2,st_clin2]  = signrank(clinGroupScores_2,50);

%  What I would expect, in this case, is that you may see a significant
%  result (i.e. indicating that the null hypothesis can be rejected, and 
%  the median value of the data is different from 50, indicated by a value
%  of h_clin1 = 1 and p_clin1 < 0.05) for the first set of scores from the 
%  clinical group (clinGroupScores_1), but not for the second set of scores
%  from that group, or those from the control group

%  Next, we could ask a different question - has the median test score 
%  changed significantly as a result of the intervention, i.e. between the 
%  first and second test administered to the clinical group? This can be
%  examined using the same Matlab function, as these scores are dependent
%  (or paired) samples, obtained from the same group of participants at
%  different time points. In this case, however, we provide two inputs to
%  the signrank function - corresponding to the two sets of test scores -
%  but do not need to specify the median under the null hypothesis as a 
%  third input, because it  is zero (i.e. the null hypothesis is that there
%  is no difference in the median value of the first two inputs):

[p_diff,h_diff,st_diff] = signrank(clinGroupScores_1,clinGroupScores_2);

%  Again, note that the exact same output is produced if you do decide to 
%  specify the median value under the null hypothesis (zero, in this case),
%  and if you run the test on the difference between the two sets of test
%  scores, provided as a single input to the signrank function, rather than
%  entering the two sets of test scores separately:

[p_diff,h_diff,st_diff] = signrank(clinGroupScores_1-clinGroupScores_2,0);

%  Alternatively, we can also compare the test scores from the clinical
%  group - both before and after the intervention - with those from the
%  control group. In this case, the two sets of test scores are independent
%  samples (i.e. obtained from different groups of participants), so we
%  must use the ranksum function to run the Mann-Whitney U test (also known
%  as the Wilcoxon ranked sum test). Other than the function name, the
%  syntax is identical, so let's see if there was any difference between
%  the two groups before and after the intervention:

[p_1,h_1,st_1] = ranksum(clinGroupScores_1,contGroupScores);
[p_2,h_2,st_2] = ranksum(clinGroupScores_2,contGroupScores);

%  What I would expect, in this case, is that you would find a significant
%  difference before - but not after - the intervention (i.e. p_1 < 0.05 
%  and h_1 = 1 but p_2 > 0.05 and h_2 = 0). Note that, in each of the
%  cases above, we also have the test statistic within the 'st_' output
%  from either function, equipping us with all the information we need to
%  report the statistical outcome of our study in our manuscript

%  Let's clear some variables that we don't need before we continue
clear contGroupScores h_* nClin nControl p_* st_*



%% Examining Correlations
%  Next, depending on the kind of data you are collecting, you may also
%  wish to examine the covariance between two different sets of data - i.e.
%  to ask whether two parameters show a statistically consistent (linear)
%  relationship with one another. Depending on the type of data you have,
%  this can be addressed using either the Pearson's or Spearman's rank
%  correlation coefficient. Each of these analyses can be implemented with
%  the Matlab corr function which, in the simplest case, simply requires
%  two inputs, corresponding to your two sets of measurements

%  To demonstrate, let's return to the age and memory test data that we
%  simulated above. In this case, rather than looking for a difference
%  between memory test scores in a median split of older and younger
%  participants, we could ask if there was any correlation between age and
%  memory scores. To do so, we simply provide these two variables as the
%  two inputs to the corr function (which will, by default, compute the
%  Pearson's correlation between those variables), and ask for both a
%  correlation coefficient (r) and p value (p) as two outputs of the
%  function, like so:

[r,p] = corr(ages,memScore);

%  In this case, what I would expect is a significant negative correlation
%  - i.e. p < 0.05 and r < 0. One thing to note, before we continue, is
%  that you can also provide one or matrices of data as input to this
%  function, in which case, it will compute the correlation between every 
%  pair of columns and return a matrix of correlation coefficients and 
%  p-values. To demonstrate what I mean, let's try providing a single
%  input, which is the ages and memory scores concatenated into one matrix:

[r,p] = corr([ages memScore]);

%  What you should see is that the outputs r and p are now 2 x 2 matrices
%  of values, with the same values that we computed above in the
%  off-diagonal entries (i.e. first row, second column and second row,
%  first column), indicating the correlation coefficient and p value
%  between the first and second columns of the input matrix; and values of
%  1 in the diagonal entries, indicating that each column of values is
%  perfectly correlated with itself

%  Finally, it's important to note that you can also use the corr function 
%  to compute Spearman's rank correlation, which is typically used when 
%  your data is ordinal, or if your data is not normally distributed. In
%  this case, we simply ask the corr function to compute Spearman's, rather
%  than Pearson's, correlation coefficient using a single pair of name / 
%  value inputs to the function, after we provide the data to analyse. To
%  demonstrate, let's ask whether the two sets of clinical test scores we
%  simulated above (i.e. before and after some intervention) are correlated
%  - that is, if a participant did relatively well on the test before the
%  intervention, would they do relatively well on the test after the
%  intervention, and vice versa? In most cases, we would hope that any such
%  test would have good test - retest reliability (i.e. we would hope for a
%  strong correlation here), but in this case, the data were simulated at
%  random, so we would not expect to see such a correlation (i.e. p > 0.05 
%  and r ~ 0):

[r,p] = corr(clinGroupScores_1,clinGroupScores_2,'Type','Spearman');

%  Let's clear some variables that we don't need before we continue
clear clinGroupScores* p r



%% Fitting General Linear Models
%  Lastly, I would like to briefly examine how to fit a general linear 
%  model (GLM) to your data in Matlab. GLMs are widely used in Psychology,
%  Neuroscience and Machine Learning to characterise the relationship 
%  between a set of one or more 'predictors' (i.e. independent variables) 
%  and a set of 'responses' (i.e. a dependent variable). There are several
%  different functions that can be used to fit GLMs in Matlab, but I will
%  focus on those with more straightforward syntax, which should be
%  sufficient to carry out most statistical analyses that you wish to
%  perform

%  As an example, let's use a GLM to characterise the relationship between
%  the age and memory score data that we simulated above. In addition, 
%  let's generate an additional variable relating to our simulated
%  participants that has no relationship with the memory scores - for
%  example, let's suppose that we also collected the height of each
%  participant, like so:

height = 170 + 10*randn(nParts,1);

%  I will start by describing the regress function, which is the most 
%  straightforward function used to fit GLMs in Matlab. The regress 
%  function takes two inputs - corresponding to the responses / dependent 
%  variable, and the predictors / independent variables - and return 
%  several different outputs. We will focus on two of those outputs, which 
%  tend to be most commonly used in statistical analyses - the beta 
%  coefficients (of which there is one for each set of  predictors, which 
%  indicates the slope of the relationship between those predictors and the
%  responses), and statistics relating to the goodness of fit (i.e. how 
%  well the predictors can account for variance in the responses). For the 
%  regress function, these are the first and fifth outputs, respectively 
%  (see the help information for details of the other outputs that are
%  generated, and what they might be useful for)

%  In addition, it is important to mention that, when using the regress 
%  function, you must always incorporate a column of ones in your matrix of 
%  predictors, in order to extract the intercept of the relationship 
%  between predictors and responses. If you omit this column of ones, then 
%  the output of the regress function will not be correct. 

%  To begin with, as an illustration, let's just ask for the beta
%  coefficients, and focus on the relationship between age and memory
%  scores. We can fit a GLM to these data using the regress function, like 
%  so:

b   = regress(memScore,[ones(size(ages)) ages]);

%  Note that the first input is our list of responses, i.e. the dependent
%  variable, memory scores; and the second input is our 'model', i.e. the
%  list of predictors, including a column of ones and the ages of each
%  participant. In terms of output, what you should see in this case is two
%  entries in the variable b, which correspond to the beta coefficients, 
%  and indicate the intercept and slope of the linear relationship between 
%  ages and memory scores. The first entry in b indicates the intercept (as
%  this is the beta coefficient for the first column of predictors, which 
%  is a column of ones), and the second entry in b indicates the slope (as 
%  this is the beta coefficient for the second column of predictors, which 
%  is the age data). If you remember from above, the memory scores were 
%  generated to follow a relationship of 100 - 0.2 * ages, plus some 
%  normally distributed noise with zero mean, so we'd expect the first two 
%  entries in b to be close to 100 and -0.2, as these are the intercept and
%  the slope of the age v memory score relationship, respectively. In
%  addition, we can use some of the plotting functions from  the previous 
%  lecture to check that this output looks reasonable:

ageRange    = [20 60];
scatter(ages,memScore,200,'k.')
hold on
plot(ageRange,b(1) + b(2)*ageRange,'r','LineWidth',3)
hold off
set(gca,'FontSize',18)
xlabel('Age (yrs)','FontSize',24)
ylabel('Test Score','FontSize',24)
legend({'Raw Data','Linear Fit'},'FontSize',24)
axis square

%  Next, we can fit a GLM to a more complex model of our memory test score
%  data that also includes the height of each participant, and extract some
%  statistical details of that GLM, using the regress function, and
%  remembering that the tilde symbol, ~, is used to prevent outputs that we
%  don't want being sent to the workspace), like so:

[b,~,~,~,stats] = regress(memScore,[ones(size(ages)) ages height]);

%  Again, the resulting beta coefficients output by the regress function
%  (and stored in the variable b) indicate the slope of the relationship 
%  between each predictor and the response - but now, those beta
%  coefficients include a third value, which indicates the slope of the
%  relationship between height and memory test scores. Given that we know,
%  in this case, that no such relationship exists, we'd expect that entry
%  to have a value close to zero, while the first and second entries should
%  retain similar values to those above (i.e. 100 for the intercept and
%  -0.2 for the slope of the age vs memory test scores relationship)

%  In addition, the stats variable returned by the regress function 
%  contains the R^2 value, F statistic, p-value, and mean squared error of 
%  our linear fit to the data. Importantly, the F statistic and 
%  corresponding p-value tell you whether your model of the responses - 
%  i.e. all of the predictors together - are significantly better than a 
%  'constant' model - i.e. one that includes only an intercept term. In 
%  other words, the null hypothesis is that all beta coefficients (except 
%  the intercept) are zero. In this case, we know there is a significant 
%  relationship between one of the predictors (age) and the responses 
%  (memory test scores), so we would expect the third entry in stats - i.e.
%  the p-value - to be < 0.05

%  Now, although the regress function is straightforward and quick to run, 
%  it cannot tell us which - if any - of our predictors has a significant 
%  relationship with our responses - only whether at least one does, i.e 
%  whether the overall model has some predictive power (if p < 0.05) or,
%  alternatively, whether the beta coefficients are not significantly
%  different from zero (if p > 0.05). To address this issue, we could try 
%  removing one predictor  from our model at a time and see how this 
%  affected the F test result - for example, have a look at how the stats
%  output changes if you remove the age data from your model of test
%  scores, like so:

[b_height,~,~,~,st_height] = regress(memScore,[ones(size(ages)) height]);

%  However, it would be more efficient to use one of the other GLM 
%  functions, which offer a greater range of statistical outputs, to get a
%  more accurate picture of the fit between each predictor in our model and
%  the responses (although these functions can be slower to run)

%  First, let's have a look at the regstats function - which can produce a 
%  much greater range of statistical outputs. The syntax is very similar to 
%  the regress function, in that we provide our responses as the first 
%  input, then our model (i.e. our matrix of predictors) as the second 
%  input. In this case, however, we only get a single output - a structure
%  which contains all of the regression results; and we do not need
%  to include a column of ones - this is incorporated automatically within
%  the regstats function. To demonstrate, let's fit the same GLM as above:

stats2 = regstats(memScore,[ages height]);

%  If you have a look within the stats2 strucutre, you might notice two 
%  things: first, there is a much greater range of statistical outputs 
%  relating to the GLM we have just fit; and second, several of these are 
%  the same as those produced by the regress function above. Specifically, 
%  the beta coefficients (now stored in stats2.beta) should be identical, 
%  as should the R^2 value (now stored in stats2.rsquare), the F statistic 
%  (now stored in stats2.fstat.f), and the mean squared error (now stored 
%  in stats.mse). In this case, however, we also get a separate t-statistic 
%  and corresponding p-value for each predictor - in stats2.tstat - which 
%  characterises the relationship between each predictor and the response
%  variable. In our example, this output should indicate that the intercept 
%  is significantly non-zero, and the relationship between age and memory 
%  scores also is significant, but that between height and memory scores is
%  not (i.e. the first two entries in stats2.tstat.pval should be < 0.05 
%  but the last entry should be > 0.05). As an aside, however, it's 
%  important to note that, if your F statistic for the whole model is not 
%  significant, then you shouldn't really look at or report any significant
%  t-statistics for individual predictors

%  Importantly, we can limit the number of statistical outputs produced by 
%  the regstats function, which makes the function run faster. This may not
%  seem like much of an issue now, but the regstats function can take a
%  very long time to compute all of the different statistical outputs when
%  used with larger input variables. In any case, to choose the specific
%  statistics relating to our GLM that we wish the function to return, we
%  simply list the corresponding field names (i.e. as seen in the stats2 
%  structure above) within a single cell array that is provided to the 
%  regstats function as the fourth input. So, for example, we could just 
%  ask the function to compute the beta coefficients, F and t statistics 
%  for our GLM, like so:

stats2 = regstats(memScore,[ages height],[],{'beta','tstat','fstat'});

%  Note that the third input to the regstats function, which we have left 
%  empty here, specifies the type of model you wish to use. This is linear 
%  by default, but there are options to include an interaction term, for
%  example - see the help information for more details

%  Finally, I'd like to briefly introduce the glmfit function. Again, this
%  function uses a fairly similar syntax to regress and regstats, in that 
%  we provide two inputs corresponding to our predictors and responses, but
%  in this case we don't need to add a column of ones to the predictors 
%  and, more importantly, the order of inputs is reversed compared to the 
%  functions described above, in that we specify the model first and the 
%  responses second. The outputs of the glmfit function are also similar - 
%  we can ask for beta coefficients, a measurement of the goodness of fit
%  (which I will ignore by using a tilde symbol to suppress that output, in
%  this case), and a set of statistical results. To demonstrate, let's try 
%  fitting the same GLM to our simulated memory test score data again:

[b3,~,stats3] = glmfit([ages height],memScore);

%  As before, the beta coefficients generated by the glmfit function should
%  be identical to those produced by the regress and regstats functions 
%  above - i.e. b, stats2.beta, and b3 should all contain exactly the same
%  values. The glmfit function does not produce an F statistic, so we
%  cannot compare that to the output generated above, but it does produce
%  the same set of t-statistics that characterise the (linear) relationship
%  between each predictor and the responses as generated by the regstats
%  function above - so, in this case, stats2.tstat.pval and stats3.p should
%  also be identical, and allow us to determine which of our beta
%  coefficients was significantly non-zero (i.e. which of our predictors
%  had a significant linear relationship with our response data)

%  Finally, it's important to note that the glmfit function is more 
%  flexible than regress or regstats, as it can also be used to fit other 
%  forms of relationship between predictors and responses - i.e. a
%  logistic, rather than a linear relationship, for example. Again, have a
%  look at the help information for the glmfit function for more details