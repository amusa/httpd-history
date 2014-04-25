# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new\\")


# load the csv file
fileAnalysis <- data.frame(read.csv("file_analysis_gitlog.csv", header=TRUE, sep=","))
fileAnalysisNonVCC <- data.frame(read.csv("file_analysis_nonvcc_gitlog.csv", header=TRUE, sep=","))


###### File Experience ########
print("File Experience")
vulnerable <- fileAnalysis$FileCommits
neutral <- fileAnalysisNonVCC$FileCommits

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("file_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="File Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### File Dir ########
print('File Dir')
vulnerable <- fileAnalysis$Dir
neutral <- fileAnalysisNonVCC$Dir

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("dir_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="Directory Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



###### File 30Day########
print("File 30Day")
vulnerable <- fileAnalysis$ttDay	
neutral <- fileAnalysisNonVCC$ttDay
association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("ttday_file_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="30-Day File Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### File 60Day########
print("File 60Day")
vulnerable <- fileAnalysis$stDay
neutral <- fileAnalysisNonVCC$stDay
association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("stday_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="60-Day Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



###### File 90Day########
print("File 90Day")
vulnerable <- fileAnalysis$ntDay
neutral <- fileAnalysisNonVCC$ntDay
association(vulnerable, neutral)

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("ntday_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="90-Day Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory








