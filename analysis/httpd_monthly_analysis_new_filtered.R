# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\new")


# load the csv file
httpdMonthlyAnalysis <- read.csv("monthly_project_analysis_gitlog_filtered.csv", header=TRUE, sep=",")


data<-data.frame(NewAuthors=httpdMonthlyAnalysis$new_authors,
VCCs=httpdMonthlyAnalysis$no_vcc, VCCRatio=httpdMonthlyAnalysis$vcc_ratio
)

# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$no_vcc, method="kendall",na.rm=FALSE)
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$vcc_ratio, method="kendall",na.rm=FALSE)
cor.test(httpdMonthlyAnalysis$dev_turnaround, httpdMonthlyAnalysis$vcc_ratio, method="kendall",na.rm=FALSE)


# Spearman Co-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$no_vcc, method="pearson",na.rm=FALSE)
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$vcc_ratio, method="pearson",na.rm=FALSE)
cor.test(httpdMonthlyAnalysis$dev_turnaround, httpdMonthlyAnalysis$vcc_ratio, method="pearson",na.rm=FALSE)


# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_filtered.png")


boxplot(data, las = 1, names = c("New Authors","VCCs", "Ratio"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_turnaround_filtered.png")

data_turnaround<-data.frame(TurnAround=httpdMonthlyAnalysis$dev_turnaround, VCCRatio=httpdMonthlyAnalysis$vcc_ratio)

boxplot(data_turnaround, las = 1, names = c("Turn Around","VCC Ratio"))

# Put our title on
mtext(text="Turn Around",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_new_author_filtered.png")

data_author<-data.frame(NewAuthors=httpdMonthlyAnalysis$new_authors)

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
jpeg("monthly_analysis_new_vcc_filtered.png")

data_vcc<-data.frame(NewAuthors=httpdMonthlyAnalysis$no_vcc)
boxplot(data_vcc, las = 1, names = c("VCC"))

# Put our title on
mtext(text="Monthly Analysis - VCC",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory

# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_new_vccratio_filtered.png")

data_ratio<-data.frame(NewAuthors=httpdMonthlyAnalysis$vcc_ratio)
boxplot(data_ratio, las = 1, names = c("VCC Ratio"))

# Put our title on
mtext(text="Monthly Analysis - VCC Ratio",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory



