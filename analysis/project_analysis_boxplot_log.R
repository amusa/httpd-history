# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new\\")


# load the csv file
projectAnalysis <- read.csv("project_analysis_all.csv", header=TRUE, sep=",")

###### Project Experience ########
print("Project Experience")

vulnerable <- projectAnalysis$LogProjectCommits[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogProjectCommits[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("project_ext_log_boxplot.png")
par(cex.lab=1.5)
par(cex.axis=1.5)
par(cex.sub=1.5)
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Project Experience (Log)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=2.0 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project TimePeriod ########
print('Project TimePeriod')
vulnerable <- projectAnalysis$LogTimePeriod[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogTimePeriod[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("project_timeperiod_log_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Project Timeperiod (Log)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project MajorRel########
print("Project MajorRel")
vulnerable <- projectAnalysis$LogMajorRel[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogMajorRel[projectAnalysis$VCC=="No"]


boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("majrel_log_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Major Release (Log)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project SecFix########
print('Project SecFix')
vulnerable <- projectAnalysis$LogSecFix[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogSecFix[projectAnalysis$VCC=="No"]


boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("secfix_log_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Security Fix (Log)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project 30Day########
print("Project 30Day")
vulnerable <- projectAnalysis$LogTtDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogTtDay[projectAnalysis$VCC=="No"]


boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("ttday_proj_log_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Proj Recent 30-Day (Log)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project 60Day########
print("Project 60Day")
vulnerable <- projectAnalysis$LogStDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogStDay[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("stday_proj_log_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Proj Recent 60-Day (Log)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project 90Day########
print("Project 90Day")
vulnerable <- projectAnalysis$LogNtDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$LogNtDay[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("ntday_proj_log_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Proj Recent 90-Day (Log)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory
