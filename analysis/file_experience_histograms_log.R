# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")

fileAnalysis <- data.frame(read.csv("file_analysis_all.csv", header=TRUE, sep=","))

###### File Experience ########
print("File Experience")
vulnerable <- fileAnalysis$LogFileCommits[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogFileCommits[fileAnalysis$VCC=="No"]

jpeg("file_exp_vul_hist_log.png")
hist(vulnerable, breaks=20, col="red", main="File Experience (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, width=2.5, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()

jpeg("file_exp_neu_hist_log.png")
hist(neutral, breaks=20, col="blue", main="File Experience (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5,  cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()
###################################


###### File Dir ########
print('File Dir')
vulnerable <- fileAnalysis$LogDir[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogDir[fileAnalysis$VCC=="No"]

jpeg("dir_vul_hist_log.png")
hist(vulnerable, breaks=20, col="red", main="Directory Experience (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()

jpeg("dir_neu_hist_log.png")
hist(neutral, breaks=20, col="blue", main="Directory Experience (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()



###### File 30Day########
print("File 30Day")
vulnerable <- fileAnalysis$LogTtDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogTtDay[fileAnalysis$VCC=="No"]

jpeg("file_ttday_vul_hist_log.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 30-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()

jpeg("file_ttday_neu_hist_log.png")

hist(neutral, breaks=20, col="blue", main="File Recent 30-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()


###### File 60Day########
print("File 60Day")
vulnerable <- fileAnalysis$LogStDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogStDay[fileAnalysis$VCC=="No"]
jpeg("file_stday_vul_hist_log.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 60-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()

jpeg("file_stday_neu_hist_log.png")

hist(neutral, breaks=20, col="blue", main="File Recent 60-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()


###### File 90Day########
print("File 90Day")
vulnerable <- fileAnalysis$LogNtDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$LogNtDay[fileAnalysis$VCC=="No"]
jpeg("file_ntday_vul_hist_log.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 90-Day (Vuln) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()

jpeg("file_ntday_neu_hist_log.png")

hist(neutral, breaks=20, col="blue", main="File Recent 90-Day (Neut) Histogram", freq=TRUE, xlab="No of Commits", labels=FALSE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2) 
axis(1, at=seq(0,10,0.1))
dev.off()

