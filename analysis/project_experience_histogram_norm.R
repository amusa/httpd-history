# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")

projectAnalysis <- read.csv("project_analysis_all.csv", header=TRUE, sep=",")

#type="count", col="red", main="Vulnerable NumDevs", freq=TRUE, xlab="Number of Developers"

###### Project Experience ########
print("Project")
jpeg("project_exp_vul_hist.png")
vulnerable <- projectAnalysis$ProjCommits[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ProjCommits[projectAnalysis$VCC=="No"]

hist(vulnerable, breaks=10, col="red", main="Project Experience (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2, at=seq(0,200,10)) 
axis(1, at=seq(0,3000,100))
dev.off()

jpeg("project_exp_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Experience (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2, at=seq(0,30000,500)) 
axis(1, at=seq(0,3000,100))
dev.off()
###################################


###### Project TimePeriod ########
print('Project TimePeriod')
vulnerable <- projectAnalysis$TimePeriod[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$TimePeriod[projectAnalysis$VCC=="No"]
jpeg("project_tp_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="Time Period Experience (Vuln) Histogram", freq=TRUE, xlab="No of Years", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,100,1))
dev.off()

jpeg("project_tp_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="Time Period Experience (Neut) Histogram", freq=TRUE, xlab="No of Years", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,100,1))
dev.off()


###### Project MajorRel########
print("Project MajorRel")
vulnerable <- projectAnalysis$MajorRel[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$MajorRel[projectAnalysis$VCC=="No"]

jpeg("project_majorrel_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="MajorRel Experience (Vuln) Histogram", freq=TRUE, xlab="No of Major Releases", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,50,1))
dev.off()

jpeg("project_majorrel_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="MajorRel Experience (Neut) Histogram", freq=TRUE, xlab="No of Major Releases", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,20,1))
dev.off()



###### Project SecFix########
print('Project SecFix')
vulnerable <- projectAnalysis$SecFix[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$SecFix[projectAnalysis$VCC=="No"]
jpeg("project_secfix_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="Security Fix Experience (Vuln) Histogram", freq=TRUE, xlab="No of Fix", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,1))
dev.off()

jpeg("project_secfix_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="Security Fix Experience (Neut) Histogram", freq=TRUE, xlab="No of Fix", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,1))
dev.off()

###### Project 30Day########
print("Project 30Day")
vulnerable <- projectAnalysis$ttDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ttDay[projectAnalysis$VCC=="No"]
jpeg("project_ttday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="Project Recent 30-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_ttday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Recent 30-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,10))
dev.off()


###### Project 60Day########
print("Project 60Day")
vulnerable <- projectAnalysis$stDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$stDay[projectAnalysis$VCC=="No"]
jpeg("project_stday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="Project Recent 60-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_stday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Recent 60-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,10))
dev.off()


###### Project 90Day########
print("Project 90Day")
vulnerable <- projectAnalysis$ntDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ntDay[projectAnalysis$VCC=="No"]
jpeg("project_ntday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="Project Recent 90-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2, at=seq(0,100,10)) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("project_ntday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="Project Recent 90-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

