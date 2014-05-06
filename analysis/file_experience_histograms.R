# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")

fileAnalysis <- read.csv("file_anlysis_vuln_gitlog.csv", header=TRUE, sep=",")
fileAnalysisNonVCC <- read.csv("file_anlysis_neut_gitlog.csv", header=TRUE, sep=",")

#type="count", col="red", main="Vulnerable NumDevs", freq=TRUE, xlab="Number of Developers"

###### File Experience ########
print("File Experience")
vulnerable <- fileAnalysis$FileCommits
neutral <- fileAnalysisNonVCC$FileCommits

jpeg("file_exp_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Experience (Vuln) Histogram", freq=TRUE, xlab="Lines of Java Code, Added+Deleted", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_exp_neu_hist.png")
hist(neutral, breaks=10, col="blue", main="File Experience (Neut) Histogram", freq=TRUE, xlab="CVSS Score", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()
###################################


###### File Dir ########
print('File Dir')
vulnerable <- fileAnalysis$Dir
neutral <- fileAnalysisNonVCC$Dir

jpeg("dir_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="Directory Experience (Vuln) Histogram", freq=TRUE, xlab="Lines of Java Code, Added+Deleted", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("dir_neu_hist.png")
hist(neutral, breaks=10, col="blue", main="Directory Experience (Neut) Histogram", freq=TRUE, xlab="CVSS Score", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()



###### File 30Day########
print("File 30Day")
vulnerable <- fileAnalysis$ttDay	
neutral <- fileAnalysisNonVCC$ttDay
jpeg("file_ttday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 30-Day (Vuln) Histogram", freq=TRUE, xlab="Lines of Java Code, Added+Deleted", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_ttday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="File Recent 30-Day (Neut) Histogram", freq=TRUE, xlab="CVSS Score", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()


###### File 60Day########
print("File 60Day")
vulnerable <- fileAnalysis$stDay
neutral <- fileAnalysisNonVCC$stDay
jpeg("file_stday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 60-Day (Vuln) Histogram", freq=TRUE, xlab="Lines of Java Code, Added+Deleted", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_stday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="File Recent 60-Day (Neut) Histogram", freq=TRUE, xlab="CVSS Score", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()


###### File 90Day########
print("File 90Day")
vulnerable <- fileAnalysis$ntDay
neutral <- fileAnalysisNonVCC$ntDay
jpeg("file_ntday_vul_hist.png")
hist(vulnerable, breaks=20, col="red", main="File Recent 90-Day (Vuln) Histogram", freq=TRUE, xlab="Lines of Java Code, Added+Deleted", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,500,20))
dev.off()

jpeg("file_ntday_neu_hist.png")

hist(neutral, breaks=10, col="blue", main="File Recent 90-Day (Neut) Histogram", freq=TRUE, xlab="CVSS Score", labels=TRUE, axes=FALSE) 
axis(2) 
axis(1, at=seq(0,10,1))
dev.off()

