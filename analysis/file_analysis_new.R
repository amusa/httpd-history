library(lattice)
 

# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new\\")

association <- function(vulnerable, neutral){
  cat("Vuln. Mean:\t",mean(vulnerable, na.rm=TRUE),"\n")
  cat("Neutral Mean:\t",mean(neutral, na.rm=TRUE),"\n")
  wilcox.test(vulnerable,neutral)
 
}


# load the csv file
fileAnalysis <- data.frame(read.csv("file_analysis_gitlog.csv", header=TRUE, sep=","))
fileAnalysisNonVCC <- data.frame(read.csv("file_analysis_nonvcc_gitlog.csv", header=TRUE, sep=","))


###### File Experience ########
print("File Experience")
vulnerable <- fileAnalysis$FileCommits
neutral <- fileAnalysisNonVCC$FileCommits

association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("file_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))



###### File Dir ########
print('File Dir')
vulnerable <- fileAnalysis$Dir
neutral <- fileAnalysisNonVCC$Dir
association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))



###### File 30Day########
print("File 30Day")
vulnerable <- fileAnalysis$ttDay	
neutral <- fileAnalysisNonVCC$ttDay
association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))


###### File 60Day########
print("File 60Day")
vulnerable <- fileAnalysis$stDay
neutral <- fileAnalysisNonVCC$stDay
association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))



###### File 90Day########
print("File 90Day")
vulnerable <- fileAnalysis$ntDay
neutral <- fileAnalysisNonVCC$ntDay
association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))








