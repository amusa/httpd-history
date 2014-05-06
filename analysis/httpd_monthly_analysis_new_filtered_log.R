# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")


# load the csv file
httpdMonthlyAnalysis <- read.csv("monthly_project_analysis_gitlog_filtered_log.csv", header=TRUE, sep=",")


data<-data.frame(NewAuthors=httpdMonthlyAnalysis$log_new_authors, VCCRatio=httpdMonthlyAnalysis$log_no_vcc)

# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$log_new_authors, httpdMonthlyAnalysis$log_no_vcc, method="kendall",na.rm=FALSE)


# PearsonCo-linearity
cor.test(httpdMonthlyAnalysis$log_new_authors, httpdMonthlyAnalysis$log_no_vcc, method="pearson",na.rm=FALSE)


# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_filtered_log.png")


boxplot(data, las = 1, names = c("New Authors","VCCs"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_new_author_filtered_log.png")

data_author<-data.frame(NewAuthors=httpdMonthlyAnalysis$log_new_authors)

boxplot(data_author, las = 1, names = c("New Authors"))

# Put our title on
mtext(text="Monthly Analysis - Authors",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory


# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_new_vcc_filtered_log.png")

data_vcc<-data.frame(NewAuthors=httpdMonthlyAnalysis$log_no_vcc)
boxplot(data_vcc, las = 1, names = c("VCC"))

# Put our title on
mtext(text="Monthly Analysis - VCC",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory
