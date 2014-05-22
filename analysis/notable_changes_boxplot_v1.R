# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd")


# load the csv file
NotableChanges <- read.csv("notable_changes_v1.csv", header=TRUE, sep=",")

###### Mail Responses ########
print("Mail Responses")
vulnerable <- NotableChanges$Responses[NotableChanges$VCC=="Yes"]
neutral <- NotableChanges$Responses[NotableChanges$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("responses_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))


# Put our title on
mtext(text="Responses",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



###### Mail Responders ########
print('Mail Responders')

vulnerable <- NotableChanges$Responders[NotableChanges$VCC=="Yes"]
neutral <- NotableChanges$Responders[NotableChanges$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("responders_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))


# Put our title on
mtext(text="Responders",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


