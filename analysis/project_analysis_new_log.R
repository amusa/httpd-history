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
projectAnalysis <- read.csv("project_analysis_all.csv", header=TRUE, sep=",")


###### Project Experience ########
print("Project Experience")
vulnerable <- projectAnalysis$ProjCommits[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ProjCommits[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("Project Experience Log")
vulnerable <- projectAnalysis$LogProjectCommits[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogProjectCommits[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)


###### Project TimePeriod ########
print('Project TimePeriod')
vulnerable <- projectAnalysis$TimePeriod[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$TimePeriod[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)

print('Project TimePeriod Log')
vulnerable <- projectAnalysis$LogTimePeriod[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogTimePeriod[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)


###### Project MajorRel########
print("Project MajorRel")
vulnerable <- projectAnalysis$MajorRel[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$MajorRel[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("Project MajorRel Log")
vulnerable <- projectAnalysis$LogMajorRel[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogMajorRel[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)


###### Project SecFix########
print('Project SecFix')
vulnerable <- projectAnalysis$SecFix[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$SecFix[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)

print('Project SecFix Log')
vulnerable <- projectAnalysis$LogSecFix[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogSecFix[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)


###### Project 30Day########
print("Project 30Day")
vulnerable <- projectAnalysis$ttDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ttDay[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("Project 30Day Log")
vulnerable <- projectAnalysis$LogTtDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogTtDay[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)


###### Project 60Day########
print("Project 60Day")
vulnerable <- projectAnalysis$stDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$stDay[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("Project 60Day Log")
vulnerable <- projectAnalysis$LogStDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogStDay[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)


###### Project 90Day########
print("Project 90Day")
vulnerable <- projectAnalysis$ntDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ntDay[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)

print("Project 90Day Log")
vulnerable <- projectAnalysis$LogNtDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogNtDay[projectAnalysis$VCC=="No"]
association(vulnerable, neutral)



