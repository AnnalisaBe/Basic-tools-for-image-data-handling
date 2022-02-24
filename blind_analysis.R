
# Author: Annalisa Bellandi

# Purpose: renaming files in a directory to allow for blind analysis.
# You need a copy of all the files that you want to be renamed in a folder
# The script will rename them with random numbers and save the old names-new names couples in an excel file

##===========================================================================================
## WARNING - files will be permanently renamed, the only information on the connection between new and old names will be in the excel file
## PRECAUTION - run this script on copies of your files, not on the original files, keep a safe copy somewhere safe

##===========================================================================================

setwd('...') #set directory containing the files to be renamed

#list the files names in the directory
oldnames <- list.files()
oldnames

#retrieves how many files you have (ie how many new file names you need!)
Lenght <- length(oldnames)

#draws out the correct numbers of new file names, from a hat containing 300 numbers
#each new file name will be a number between 1 and 300
sequence <- sample(x=1:300, size=Lenght)

newnames <- c()

#looping along the new file names, will create names with the correct extension
#this is set to produce .tiff files, you can change to the extension you would like
for (i in sequence) { 
  newname <- paste(i,".tiff") #change extension here if needed
  newnames <- c(newnames, newname)
  }

#this is a very important dataframe - contains the couples of new names - old names
names <- data.frame(cbind(oldnames,newnames))

#rename the files: each old name will be overwritten with one new name
file.rename(oldnames, newnames)

#saves the couples new names - old names in a .csv file (you cna open it with excel)
write.csv(names, file = "data.csv")