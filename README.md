

### Description
This project includes two folders (i.e., **./DemoDataCode** and **./Code_Shiny_ml4ki**) containing custom code files and demo data for the manuscript *"Big (Registrational) Data based Decoding of Kinase-Adverse Event Associations for Small Molecule Kinase Inhibitors"*. 

The folder **./DemoDataCode** contains custom codes (i.e., vimp.R and cindex_CI.R) and an example data (hypertension_data.RData) for reproducing the results reported in the manuscript. Of note, the example data was derived from multiple registrational clinical trial data that carry proprietary and business sensitive information from pharmaceutical firms. As such, the data has been encrypted and can be made available for reviewers upon the request and the availability of non-disclosure agreement. Sorry for the inconvenience!

The folder **./Code_Shiny_ml4ki** contains custom code files for implementing an interactive web application “Identification of Kinase-Specific Signal” ([link](https://gongj.shinyapps.io/ml4ki)). This web application based on **Shiny R** has been reported in the manuscript, where we made the results of estimated association between 442 kinases with 2145 adverse events publicly accessible. Of note, the Shiny app backend data files in sub-folder ***./data*** were derived from multiple third-party registrational clinical trial thus have been removed. 


### System requirement
The codes have been tested on Windows operating systems, and should be compatible with Windows, Mac, and Linux operating systems.

R environment and version the codes has been tested under:
```bash
platform       x86_64-w64-mingw32          
arch           x86_64                      
os             mingw32                     
system         x86_64, mingw32             
R version 4.1.1 (2021-08-10)
```

### Installation 
Before running the codes, users should have R version 3.4.0 or higher, and several packages set up.

For **vimp.R** (**./DemoDataCode**)

```r
install.packages("randomForestSRC")
install.packages("survminer")
```
For **cindex_CI.R** (**./DemoDataCode**)

```r
install.packages("survival")
install.packages("BiocManager")
BiocManager::install("survcomp")
```
For **Shiny app** (**./Code_Shiny_ml4ki**)

```r
"global.R" provides a list of required packages
```
Expected installation time:  < 20 minutes

### Instruction for use / Demo
Custom codes (i.e., vimp.R and cindex_CI.R) and an example data (hypertension_data.RData) are for reproducing the results reported in the manuscript regarding representative AE *Hypertension*. 

**hypertension_data.RData**: example input data

  * Integrated patient population dataset (please refer to *Data integration* in METHOD for details), with *Hypertension* as the representative AE.
  + The example data was derived from multiple registrational clinical trial data that carry proprietary and business sensitive information from pharmaceutical firms. As such, the data has been encrypted and can be made available for reviewers upon the request and the availability of non-disclosure agreement.


**vimp.R**: generate VIMP plot for AE (Fig. 2a) and AE probability stratified by kinase inhibition (Fig. 2b)\
- Expected run time: ~4 minutes

**cindx_CI.R**: calculate prediction performance of ML model on patient population data (Table 1)\
- Expected run time:  ~20 minutes on 500x cross-validation

Change directories to the current folder to run the R scripts, e.g.,

```r
setwd("DemoDataCode")
```
<br> 

**Shiny App** (**./Code_Shiny_ml4ki**) 

In the manuscript, we systematically evaluated the potential association between 442 kinases with 2145 adverse events. The results have been made publicly accessible through an interactive web application “Identification of Kinase-Specific Signal” ([link](https://gongj.shinyapps.io/ml4ki)).  
  
* Folder **./Code_Shiny_ml4ki** contains custom code files for implementing the Shiny app
* The Shiny appbackend data files in sub-folder ***./data*** were derived from multiple third-party registrational clinical trial thus have been removed. 
