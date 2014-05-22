# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new\\")

association <- function(vulnerable, neutral){
  cat("Vuln. Mean:\t",mean(vulnerable, na.rm=TRUE),"\n")
  cat("Neutral Mean:\t",mean(neutral, na.rm=TRUE),"\n")
  cat("Vuln. Median:\t",median(vulnerable, na.rm=TRUE),"\n")
  cat("Neutral Median:\t",median(neutral, na.rm=TRUE),"\n")

  wilcox.test(vulnerable,neutral) 
}

# load the csv file
fileAnalysis <- data.frame(read.csv("file_analysis_all.csv", header=TRUE, sep=","))

###### File Experience ########
print("File Experience")
vulnerable <- fileAnalysis$FileCommits[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$FileCommits[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("File Experience Log")
vulnerable <- fileAnalysis$LogFileCommits[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogFileCommits[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)

###### File Dir ########
print('File Dir')
vulnerable <- fileAnalysis$Dir[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$Dir[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)

print('File Dir Log')
vulnerable <- fileAnalysis$LogDir[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogDir[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)

###### File 30Day########
print("File 30Day")
vulnerable <- fileAnalysis$ttDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$ttDay[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("File 30Day Log")
vulnerable <- fileAnalysis$LogTtDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogTtDay[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)



###### File 60Day########
print("File 60Day")
vulnerable <- fileAnalysis$stDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$stDay[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("File 60Day Log")
vulnerable <- fileAnalysis$LogStDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogStDay[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)


###### File 90Day########
print("File 90Day")
vulnerable <- fileAnalysis$ntDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$ntDay[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("File 90Day Log")
vulnerable <- fileAnalysis$LogNtDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogNtDay[fileAnalysis$VCC=="No"]
association(vulnerable, neutral)




