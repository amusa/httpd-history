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

#boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
boxdata<-data.frame(VCC=vulnerable)
jpeg("project_ext_vcc_boxplot.png")
boxplot(vulnerable, las = 1, names = c("VCC"))

# Put our title on
mtext(text="Project Experience (VCC)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

boxdata<-data.frame(Neutral=neutral)
jpeg("project_ext_neut_boxplot.png")
boxplot(boxdata, las = 1, names = c("Neutral"))

# Put our title on
mtext(text="Project Experience (Neutral)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory




