# This is R script for getting the needed data in the "data"-folder
# This is needed only in beginning of the project
# later the data folder and files should come with the git repo files
if (!file.exists("data")) {
	dir.create("data")
}

# note that the zip file is modified to have the '_'-underscores in blank values also
if (!file.exists("./data/getdata_projectfiles_UCI_HAR_Dataset.zip")) {
	urli <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(urli, destfile="./data/getdata_projectfiles_UCI_HAR_Dataset.zip", method="curl")
}

dateDownloaded <- date()
dateDownloaded

unzip("./data/getdata_projectfiles_UCI_HAR_Dataset.zip", exdir=".")