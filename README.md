

### Description
This project includes custom code files for the manuscript *"Decoding of Kinase-Adverse Event Associations for Small Molecule Kinase Inhibitors"*. 


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

For **vimp.R** 

```r
install.packages("randomForestSRC")
install.packages("survminer")
```
For **cindex_CI.R** 

```r
install.packages("survival")
install.packages("BiocManager")
BiocManager::install("survcomp")
```

### Instruction for use / Demo
Custom codes (i.e., vimp.R and cindex_CI.R) for reproducing the results reported in the manuscript regarding representative AE *Hypertension*. 

**hypertension_data.RData**: example input data

  * Integrated patient population dataset (please refer to *Data integration* in METHODS for details), with *Hypertension* as the representative AE.
  + The example data was derived from multiple registrational clinical trial data that carry proprietary and business sensitive information from pharmaceutical firms. As such, the data has been encrypted and may be made available upon the request sent to corresponding author and the availability of non-disclosure agreement.


**vimp.R**: generate VIMP plot for AE (Fig. 2a) and AE probability stratified by kinase inhibition (Fig. 2b)\
- Expected run time: ~4 minutes

**cindx_CI.R**: calculate prediction performance of ML model on patient population data (Table 1)\
- Expected run time:  ~20 minutes on 500x cross-validation

Change directories to the current folder to run the R scripts, e.g.,

```r
setwd("ml4ki")
```
