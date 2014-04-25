# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\")


# load the csv file
#data <-data.frame(ProjExp=read.csv("project_analysis.csv", header=TRUE, sep=","))
projectAnalysis <- read.csv("project_analysis_gitlog.csv", header=TRUE, sep=",")
projectAnalysisNonVCC <- read.csv("project_analysis_nonvcc_gitlog.csv", header=TRUE, sep=",")


###### Project Experience ########
print("Project Experience")
vulnerable <- projectAnalysis$ProjCommits
neutral <- projectAnalysisNonVCC$ProjCommits

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("project_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="Project Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project TimePeriod ########
print('Project TimePeriod')
vulnerable <- projectAnalysis$TimePeriod
neutral <- projectAnalysisNonVCC$TimePeriod

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("timeperiod_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="Time Period Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project MajorRel########
print("Project MajorRel")
vulnerable <- projectAnalysis$MajorRel
neutral <- projectAnalysisNonVCC$MajorRel

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("majrel_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="Major Release Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project SecFix########
print('Project SecFix')
vulnerable <- projectAnalysis$SecFix
neutral <- projectAnalysisNonVCC$SecFix

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("secfix_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="Security Fix Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project 30Day########
print("Project 30Day")
vulnerable <- projectAnalysis$ttDay
neutral <- projectAnalysisNonVCC$ttDay

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("ttday_proj_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="30-Day Project Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project 60Day########
print("Project 60Day")
vulnerable <- projectAnalysis$stDay
neutral <- projectAnalysisNonVCC$stDay

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("stday_proj_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="60-Day Project Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project 90Day########
print("Project 90Day")
vulnerable <- projectAnalysis$ntDay
neutral <- projectAnalysisNonVCC$ntDay

boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
jpeg("ntday_proj_experience_new.png")
boxplot(boxdata, las = 1, names = c("VCC","Neutral"))

# Put our title on
mtext(text="90-Day Project Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



