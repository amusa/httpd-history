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
projectAnalysis <- read.csv("project_analysis_vuln_gitlog.csv", header=TRUE, sep=",")
projectAnalysisNonVCC <- read.csv("project_analysis_neut_gitlog.csv", header=TRUE, sep=",")


###### Project Experience ########
print("Project Experience")
vulnerable <- projectAnalysis$ProjCommits
neutral <- projectAnalysisNonVCC$ProjCommits
association(vulnerable, neutral)

###### Project TimePeriod ########
print('Project TimePeriod')
vulnerable <- projectAnalysis$TimePeriod
neutral <- projectAnalysisNonVCC$TimePeriod
association(vulnerable, neutral)

###### Project MajorRel########
print("Project MajorRel")
vulnerable <- projectAnalysis$MajorRel
neutral <- projectAnalysisNonVCC$MajorRel
association(vulnerable, neutral)

###### Project SecFix########
print('Project SecFix')
vulnerable <- projectAnalysis$SecFix
neutral <- projectAnalysisNonVCC$SecFix
association(vulnerable, neutral)

###### Project 30Day########
print("Project 30Day")
vulnerable <- projectAnalysis$ttDay
neutral <- projectAnalysisNonVCC$ttDay
association(vulnerable, neutral)

###### Project 60Day########
print("Project 60Day")
vulnerable <- projectAnalysis$stDay
neutral <- projectAnalysisNonVCC$stDay
association(vulnerable, neutral)

###### Project 90Day########
print("Project 90Day")
vulnerable <- projectAnalysis$ntDay
neutral <- projectAnalysisNonVCC$ntDay
association(vulnerable, neutral)



