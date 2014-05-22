# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new\\")


# load the csv file
expLearning <- data.frame(read.csv("dev_experience_learning.csv", header=TRUE, sep=","))



###### Developer Experience Learning ########
print("Developer Experience Learning boxplot")
repeatFreq <- expLearning$cveCount

boxdata<-data.frame(Freq=repeatFreq)
jpeg("dev_experience_learning_boxplot.png")
boxplot(boxdata, las = 1, names = c("Repeat Mistakes"))

# Put our title on
mtext(text="Developer Vulnerability Frequency",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.5 # text size
      )
dev.off() # writes the SVG file to the working directory


print("Developer Experience Learning histogram")

jpeg("dev_experience_learning_hist.png")
hist(repeatFreq , breaks=10, col="blue", main="Developer Vulnerability Frequency", freq=TRUE, xlab="Repeat Mistakes", labels=TRUE, axes=FALSE, cex.lab=1.5, cex.axis=1.5, cex.sub=1.5, cex.main=2.0) 
axis(2, at=seq(0,200,10)) 
axis(1, at=seq(0,100,1))
dev.off()
