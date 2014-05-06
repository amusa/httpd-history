# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new\\")


# load the csv file
fileAnalysis <- data.frame(read.csv("file_analysis_all.csv", header=TRUE, sep=","))



###### File Experience ########
print("File Experience")
vulnerable <- fileAnalysis$FileCommits[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$FileCommits[fileAnalysis$VCC=="No"]

#boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
boxdata<-data.frame(VCC=vulnerable)
jpeg("file_exp_vcc_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC"))

# Put our title on
mtext(text="File Experience (VCC)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



boxdata<-data.frame(Neutral=neutral)

jpeg("file_exp_neut_boxplot.png")
boxplot(boxdata, las = 1, names = c("Neutral"))

# Put our title on
mtext(text="File Experience (Neutral)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### File Dir ########
print('File Dir')
vulnerable <- fileAnalysis$Dir[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$Dir[fileAnalysis$VCC=="No"]

#boxdata<-data.frame(VCC=vulnerable, Neutral=neutral)
boxdata<-data.frame(VCC=vulnerable)
jpeg("dir_exp_vcc_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC"))

# Put our title on
mtext(text="Directory Experience (VCC)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



boxdata<-data.frame(Neutral=neutral)

jpeg("dir_exp_neut_boxplot.png")
boxplot(boxdata, las = 1, names = c("Neutral"))

# Put our title on
mtext(text="Directory Experience (Neutral)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



###### File 30Day########
print("File 30Day")
vulnerable <- fileAnalysis$ttDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$ttDay[fileAnalysis$VCC=="No"]

boxdata<-data.frame(VCC=vulnerable)
jpeg("ttday_file_vcc_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC"))

# Put our title on
mtext(text="File Recent 30-Day (VCC)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



boxdata<-data.frame(Neutral=neutral)

jpeg("ttday_file_neut_boxplot.png")
boxplot(boxdata, las = 1, names = c("Neutral"))

# Put our title on
mtext(text="File Recent 30-Day (Neutral)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory

###### File 60Day########
print("File 60Day")
vulnerable <- fileAnalysis$stDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$stDay[fileAnalysis$VCC=="No"]

boxdata<-data.frame(VCC=vulnerable)
jpeg("stday_file_vcc_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC"))

# Put our title on
mtext(text="File Recent 60-Day (VCC)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



boxdata<-data.frame(Neutral=neutral)

jpeg("stday_file_neut_boxplot.png")
boxplot(boxdata, las = 1, names = c("Neutral"))

# Put our title on
mtext(text="File Recent 60-Day (Neutral)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory


###### File 90Day########
print("File 90Day")
vulnerable <- fileAnalysis$ntDay[fileAnalysis$VCC=="Yes"]
neutral <- fileAnalysis$ntDay[fileAnalysis$VCC=="No"]

boxdata<-data.frame(VCC=vulnerable)
jpeg("ntday_file_vcc_boxplot.png")
boxplot(boxdata, las = 1, names = c("VCC"))

# Put our title on
mtext(text="File Recent 90-Day (VCC)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory



boxdata<-data.frame(Neutral=neutral)

jpeg("ntday_file_neut_boxplot.png")
boxplot(boxdata, las = 1, names = c("Neutral"))

# Put our title on
mtext(text="File Recent 90-Day (Neutral)",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )
dev.off() # writes the SVG file to the working directory







