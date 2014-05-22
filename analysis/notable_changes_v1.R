# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd")

NotableChanges <- read.csv("notable_changes_v1.csv", header=TRUE, sep=",")

###### Mail Responses########
print("Mail Responses")

vulnerable <- NotableChanges$Responses[NotableChanges$VCC=="Yes"]
neutral <- NotableChanges$Responses[NotableChanges$VCC=="No"]

jpeg("responses_hist_vcc.png")
hist(vulnerable, breaks=10, col="red", main="Responses Histogram (Vuln)", freq=TRUE, xlab="No of Responses", labels=TRUE, axes=FALSE) 
axis(2, at=seq(0,100,10)) 
axis(1, at=seq(0,200,10))
dev.off()

jpeg("responses_hist_neut.png")

hist(neutral, breaks=10, col="blue", main="Responses Histogram (Neut)", freq=TRUE, xlab="No of Responses", labels=TRUE, axes=FALSE) 
axis(2, at=seq(0,100,1)) 
axis(1, at=seq(0,100,1))
dev.off()




###### Mail Responders########
print("Mail Responders")

vulnerable <- NotableChanges$Responders[NotableChanges$VCC=="Yes"]
neutral <- NotableChanges$Responders[NotableChanges$VCC=="No"]

jpeg("responders_vcc.png")
hist(vulnerable, breaks=10, col="red", main="Responders Histogram (Vuln)", freq=TRUE, xlab="No of Responders", labels=TRUE, axes=FALSE) 
axis(2, at=seq(0,100,10)) 
axis(1, at=seq(0,200,10))
dev.off()

jpeg("responders_neut.png")

hist(neutral, breaks=10, col="blue", main="Responders Histogram (Neut)", freq=TRUE, xlab="No of Responders", labels=TRUE, axes=FALSE) 
axis(2, at=seq(0,100,1)) 
axis(1, at=seq(0,100,1))
dev.off()

###################################

