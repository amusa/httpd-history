# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")

projectAnalysis <- read.csv("project_analysis_all.csv", header=TRUE, sep=",")

#type="count", col="red", main="Vulnerable NumDevs", freq=TRUE, xlab="Number of Developers"

###### Project Experience ########
print("Project")
jpeg("project_exp_vul_log_hist.png")
vulnerable <- projectAnalysis$LogProjectCommits[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogProjectCommits[projectAnalysis$VCC=="No"]

hist(vulnerable, breaks=20, col="red", main="Project Experience (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_exp_neu_log_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Experience (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()
###################################


###### Project TimePeriod ########
print('Project TimePeriod')
vulnerable <- projectAnalysis$LogTimePeriod[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogTimePeriod[projectAnalysis$VCC=="No"]
jpeg("project_tp_vul_log_hist.png")
hist(vulnerable, breaks=20, col="red", main="Time Period Experience (Vuln) Histogram", freq=TRUE, xlab="No of Years", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_tp_neu_log_hist.png")

hist(neutral, breaks=10, col="blue", main="Time Period Experience (Neut) Histogram", freq=TRUE, xlab="No of Years", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()


###### Project MajorRel########
print("Project MajorRel")
vulnerable <- projectAnalysis$LogMajorRel[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogMajorRel[projectAnalysis$VCC=="No"]

jpeg("project_majorrel_vul_log_hist.png")
hist(vulnerable, breaks=20, col="red", main="MajorRel Experience (Vuln) Histogram", freq=TRUE, xlab="No of Major Releases", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_majorrel_neu_log_hist.png")

hist(neutral, breaks=10, col="blue", main="MajorRel Experience (Neut) Histogram", freq=TRUE, xlab="No of Major Releases", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()



###### Project SecFix########
print('Project SecFix')
vulnerable <- projectAnalysis$LogSecFix[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogSecFix[projectAnalysis$VCC=="No"]
jpeg("project_secfix_vul_log_hist.png")
hist(vulnerable, breaks=20, col="red", main="Security Fix Experience (Vuln) Histogram", freq=TRUE, xlab="No of Fix", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_secfix_neu_log_hist.png")

hist(neutral, breaks=10, col="blue", main="Security Fix Experience (Neut) Histogram", freq=TRUE, xlab="No of Fix", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()



###### Project 30Day########
print("Project 30Day")
vulnerable <- projectAnalysis$LogTtDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogTtDay[projectAnalysis$VCC=="No"]
jpeg("project_ttday_vul_log_hist.png")
hist(vulnerable, breaks=20, col="red", main="Project Recent 30-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_ttday_neu_log_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Recent 30-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()


###### Project 60Day########
print("Project 60Day")
vulnerable <- projectAnalysis$LogStDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogStDay[projectAnalysis$VCC=="No"]
jpeg("project_stday_vul_log_hist.png")
hist(vulnerable, breaks=20, col="red", main="Project Recent 60-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_stday_neu_log_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Recent 60-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()


###### Project 90Day########
print("Project 90Day")
vulnerable <- projectAnalysis$LogNtDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogNtDay[projectAnalysis$VCC=="No"]
jpeg("project_ntday_vul_log_hist.png")
hist(vulnerable, breaks=20, col="red", main="Project Recent 90-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_ntday_neu_log_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Recent 90-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()

