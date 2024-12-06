################################################################################
### Cleaning data from the Himalayan Database ##################################
################################################################################

library(tidyverse)
library(foreign)
library(janitor)
library(httr)
library(jsonlite)
library(glue)

###_____________________________________________________________________________
### Utilize httr and foreign to gain access to the file and import
###_____________________________________________________________________________