



setwd('D:/Annalisa/Bombardment/Col0 vs PLUG blind/07_27_2019')

oldnames <- list.files()

oldnames

Lenght <- length(oldnames)

sequence <- sample(x=1:300, size=Lenght)

newnames <- c()

for (i in sequence) { 
  newname <- paste(i,".tiff")
  newnames <- c(newnames, newname)
  }

names <- data.frame(cbind(oldnames,newnames))

file.rename(oldnames, newnames)

write.csv(names, file = "data.csv")