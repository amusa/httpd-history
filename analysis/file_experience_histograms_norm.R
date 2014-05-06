# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")

fileAnalysis <- data.frame(read.csv("file_analysis_all.csv", header=TRUE, sep=","))

###### File Experience ########
print("File Experience")
vulnerable <- fileAnalysis$FileCommits[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$FileCommits[fileAnalysis$VCC=="No"]

jpeg("file_exp_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Experience (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_exp_neu_hist.png")
hist(neutral, breaks=10, col="blue", main="File Experience (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()
###################################


###### File Dir ########
print('File Dir')
vulnerable <- fileAnalysis$Dir[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$Dir[fileAnalysis$VCC=="No"]

jpeg("dir_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="Directory Experience (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("dir_neu_hist.png")
hist(neutral, breaks=10, col="blue", main="Directory Experience (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()



###### File 30Day########
print("File 30Day")
vulnerable <- fileAnalysis$ttDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$ttDay[fileAnalysis$VCC=="No"]

jpeg("file_ttday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 30-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_ttday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="File Recent 30-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()


###### File 60Day########
print("File 60Day")
vulnerable <- fileAnalysis$stDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$stDay[fileAnalysis$VCC=="No"]

jpeg("file_stday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 60-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_stday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="File Recent 60-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()


###### File 90Day########
print("File 90Day")
vulnerable <- fileAnalysis$ntDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$ntDay[fileAnalysis$VCC=="No"]
jpeg("file_ntday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 90-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_ntday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="File Recent 90-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()

