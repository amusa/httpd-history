# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")

association <- function(dev, vcc){
  cat("Vuln. Mean:\t",mean(dev, na.rm=TRUE),"\n")
  cat("Neutral Mean:\t",mean(vcc, na.rm=TRUE),"\n")
  wilcox.test(dev,vcc)

}


# load the csv file
httpdMonthlyAnalysis <- read.csv("monthly_project_analysis.csv", header=TRUE, sep=",")

print('new author, avg exp')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$new_authors, AvgExp=httpdMonthlyAnalysis$avg_exp)
association(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$avg_exp)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$avg_exp, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$avg_exp, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_0.png")

boxplot(data, las = 1, names = c("New Authors","Avg. Exp."))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



print('new author, no_vcc')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$new_authors, VCCRatio=httpdMonthlyAnalysis$no_vcc)
association(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$no_vcc)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$no_vcc, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$no_vcc, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_1.png")

boxplot(data, las = 1, names = c("New Authors","VCCs"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory


print('dev turnaround, no_vcc_ratio')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$dev_turnaround, VCCRatio=httpdMonthlyAnalysis$vcc_ratio)
association(httpdMonthlyAnalysis$dev_turnaround, httpdMonthlyAnalysis$vcc_ratio)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$dev_turnaround, httpdMonthlyAnalysis$vcc_ratio, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$dev_turnaround, httpdMonthlyAnalysis$vcc_ratio, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_2.png")

boxplot(data, las = 1, names = c("Dev Turnaround","VCC Ratio"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



print('author_exp, no_vcc')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$author_exp, VCCRatio=httpdMonthlyAnalysis$no_vcc)
association(httpdMonthlyAnalysis$dev_turnaround, httpdMonthlyAnalysis$vcc_ratio)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$author_exp, httpdMonthlyAnalysis$no_vcc, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$author_exp, httpdMonthlyAnalysis$no_vcc, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_3.png")

boxplot(data, las = 1, names = c("Dev Exp.","VCCs"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory


print('avg_exp, no_vcc')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$avg_exp, VCCRatio=httpdMonthlyAnalysis$no_vcc)
association(httpdMonthlyAnalysis$avg_exp, httpdMonthlyAnalysis$no_vcc)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$avg_exp, httpdMonthlyAnalysis$no_vcc, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$avg_exp, httpdMonthlyAnalysis$no_vcc, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_4.png")
boxplot(data, las = 1, names = c("Avg Dev. Exp.","VCCs"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



print('avg_exp, vcc_ratio')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$avg_exp, VCCRatio=httpdMonthlyAnalysis$vcc_ratio)
association(httpdMonthlyAnalysis$avg_exp, httpdMonthlyAnalysis$vcc_ratio)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$avg_exp, httpdMonthlyAnalysis$vcc_ratio, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$avg_exp, httpdMonthlyAnalysis$vcc_ratio, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_5.png")

boxplot(data, las = 1, names = c("Avg Dev. Exp.","VCC Ratio"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



print('avg_exp_log, vcc_ratio_log')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$avg_exp_log, VCCRatio=httpdMonthlyAnalysis$vcc_ratio_log)
association(httpdMonthlyAnalysis$avg_exp_log, httpdMonthlyAnalysis$vcc_ratio_log)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$avg_exp_log, httpdMonthlyAnalysis$vcc_ratio_log, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$avg_exp_log, httpdMonthlyAnalysis$vcc_ratio_log, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_6.png")

boxplot(data, las = 1, names = c("Avg Dev. Exp. Log","VCC Ratio Log"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



print('avg_exp_log, no_vcc_log')
data<-data.frame(NewAuthors=httpdMonthlyAnalysis$avg_exp_log, VCCRatio=httpdMonthlyAnalysis$no_vcc_log)
association(httpdMonthlyAnalysis$avg_exp_log, httpdMonthlyAnalysis$no_vcc_log)
# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$avg_exp_log, httpdMonthlyAnalysis$no_vcc_log, method="kendall",na.rm=FALSE)
# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$avg_exp_log, httpdMonthlyAnalysis$no_vcc_log, method="pearson",na.rm=FALSE)
# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_7.png")

boxplot(data, las = 1, names = c("Avg Dev. Exp. Log","VCCs Log"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory







