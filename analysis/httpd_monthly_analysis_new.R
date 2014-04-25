# Clear all existing variables from memory
rm(list=ls())

# Set working directory for the csv file
setwd("C:\\data\\httpd\\experience_report\\")


# load the csv file
httpdMonthlyAnalysis <- read.csv("httpd_monthly_analysis_gitlog.csv", header=TRUE, sep=",")

data<-data.frame(NewAuthors=httpdMonthlyAnalysis$new_authors,
VCCs=httpdMonthlyAnalysis$no_vcc)

# Kendal Co-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$no_vcc, method="kendall",na.rm=FALSE)

# Spearman Co-linearity
cor.test(httpdMonthlyAnalysis$new_authors, httpdMonthlyAnalysis$no_vcc, method="pearson",na.rm=FALSE)

# set the output type and size -- good for standardizing outputs
jpeg("monthly_analysis_new.png")


boxplot(data, las = 1, names = c("New Authors","VCCs"))

# Put our title on
mtext(text="Monthly Analysis",
      side = 3, # Top
      adj=0, # Combined with top implies left alignment
      line=1.5, # Controls what margin line, essentially moves the text up and down
      cex=1.1 # text size
      )

dev.off() # writes the SVG file to the working directory

