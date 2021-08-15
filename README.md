[<img src="https://img.shields.io/badge/DOI-10.17605%2FOSF.IO%2FQ4Z2F-blue" />](https://doi.org/10.17605/OSF.IO/Q4Z2F)
<img src="https://img.shields.io/badge/LICENSE-MIT-orange" />
[<img src="https://img.shields.io/badge/CITATION-Fox%2C%20R.%20(2021).%20BF%20%26%20cmP%20Calculator%3A%20A%20Web%20App%20for%20Calculating%20Bayes%20Factors%20and%20Approximate%20Correct%20Model%20Probability%20Values%20%5BComputer%20software%5D.%20https%3A%2F%2Fdoi.org%2F10.17605%2FOSF.IO%2FQ4Z2F-blueviolet" height="20" />](https://doi.org/10.17605/OSF.IO/Q4Z2F)

# BF & cmP Calculator 
### A Web App for Calculating Bayes Factors and Approximate Correct Model Probability Values

<br> 

## Accessing the App Online

#### **This app is available online [here](https://robert-fox.shinyapps.io/BF_cmP_Calculator/)**

<br> 

## Running the app from GitHub via RStudio
If you would prefer to launch this app via GitHub, you can run the following script in RStudio: 

```{r}
if (!require('shiny')) install.packages('shiny'); library('shiny')
if (!require('shinythemes')) install.packages('shinythemes')
if (!require('rmarkdown')) install.packages('rmarkdown')

runGitHub(rep = "BF_cmP_Calculator", username = "Robert-Fox1", ref = "main")
```
<br> 

## About this BF and cmP Calculator
This calculator estimates the *Bayes Factor* (*BF*) and *Approximate Correct Model Probability* (*cmP*) values by using the *Bayesian Information Criteria* (*BIC*) [1,2] values (which can be obtained by common statistical software, such as Mplus). These values can be useful in determining the appropriate number of latent classes in finite mixture models, such as latent class analysis and latent profile analysis. For an overview and description of these statistics see [2].

This calculator can be used as a quick means to estimate the *BF* and *cmP* values, which are not readily available in all structural equation modelling (SEM) software.

<br> 

## Instructions

All you need to calculate the BF and cmP values are the Bayesian Information Criterion (BIC) values for each model tested. 

1. Enter the number of models you wish to compare. 
2. Enter each of the BIC values from your output.
3. Once you have entered the BIC values, the BF and cmP values will be estimated. You can view these by switching to the 'BF Values' tab and the 'cmP Values' tab. 

<br> 

## Bayes Factor 
The *BF* can be used to make a pairwise comparison of relative fit between two adjacent models (*Model K* and *Model K + 1*, where *K* is the number of latent classes). 

* A BF less than 3 is generally considered as weak evidence in support of *Model K* over *Model K + 1*.  
* A BF greater than or equal to 3 and less than 10 is generally considered as moderate evidence in support of *Model K* over *Model K + 1*.  
* A BF greater than or equal to 10 is generally considered as strong evidence in support of *Model K* over *Model K + 1*. 

<br> 

## Approximate Correct Model Probability
The *cmP* estimates the probability of each model being the "correct" model, relative to all models tested, assuming that the "true" model is among those examined [2]. Based on the cmP, the model with the highest value is selected. 

<br> 

## References
1. Schwarz, G. (1978). Estimating the dimension of a model. *The Annals of Statistics*, *6*(2), 461-464. https://doi.org/10.1214/aos/1176344136 
2. Masyn, K. E. (2013). Latent class analysis and finite mixture modeling. In T. D. Little (Ed.), *The Oxford handbook of quantitative methods* (Vol. 2, pp. 551-611). Oxford University Press.

<br>

## Citation 
If you found this app useful, please use the following citation:  

Fox, R. (2021). *BF & cmP Calculator: A Web App for Calculating Bayes Factors and Approximate Correct Model Probability Values* [Computer software]. https://doi.org/10.17605/OSF.IO/Q4Z2F

<br>

## Author 

Dr Robert Fox is a Lecturer in Psychology at the National College of Ireland, Dublin, Ireland. 

**[ResearchGate](https://www.researchgate.net/profile/Robert-Fox-5) 
[GitHub](https://github.com/Robert-Fox1)**

<br> 
