# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new\\")


# load the csv file
projectAnalysis <- read.csv("project_analysis_all.csv", header=TRUE, sep=",")

###### Project Experience ########
print("Project Experience")

vulnerable <- projectAnalysis$ProjCommits[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ProjCommits[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("project_ext_boxplot.png")
par(cex.lab=1.5)
par(cex.axis=1.5)
par(cex.sub=1.5)
boxplot(boxdata, las = 1, names = c("VCC","Neut"))
# Put our title on
mtext(text="Project Experience",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=2.0 # text size    
      )


dev.off() # writes the SVG file to the working directory


###### Project TimePeriod ########
print('Project TimePeriod')
vulnerable <- projectAnalysis$TimePeriod[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$TimePeriod[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("project_timeperiod_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Project Timeperiod",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project MajorRel########
print("Project MajorRel")
vulnerable <- projectAnalysis$MajorRel[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$MajorRel[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("majrel_log_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Major Release (VCC)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project SecFix########
print('Project SecFix')
vulnerable <- projectAnalysis$SecFix[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$SecFix[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("secfix_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Security Fix",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### Project 30Day########
print("Project 30Day")
vulnerable <- projectAnalysis$ttDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ttDay[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("ttday_proj_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))


# Put our title on
mtext(text="Proj Recent 30-Day",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



###### Project 60Day########
print("Project 60Day")
vulnerable <- projectAnalysis$stDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$stDay[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("stday_proj_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Proj Recent 60-Day",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### Project 90Day########
print("Project 90Day")
vulnerable <- projectAnalysis$ntDay[projectAnalysis$VCC=="Yes"]
neutral <- projectAnalysis$ntDay[projectAnalysis$VCC=="No"]

boxdata<-data.frame(cbind(VCC=vulnerable, Neutral=neutral))
jpeg("ntday_proj_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC","Neut"))

# Put our title on
mtext(text="Proj Recent 90-Day",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



