#Step 1

#get some data
url = "http://teaching.cs.uow.edu.au/~markus/data/info411Lab3Data.zip"
download.file(url, "info411Lab3Data.zip") # download file
unzip("info411Lab3Data.zip", exdir = "") # unzip files
file.remove("info411Lab3Data.zip") # tidy up by removing the zip file


#read the dataset, Warning: This takes about 8 minutes
start.time <- Sys.time()
data = read.fwf("info411.dat", widths= c(17,2,17,2,10,5,3,2,2),col.names=c("CardNumber","CardIssue","PIN","gender","DOB","postcode","homecode","enrolment", "payee"), strip.white=TRUE, n=-1)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

#Question: Assume that we are not interested in the attributes "CardIssue" and "enrolment".
#          How would you change the call to read.fwf in order to avoid loading those 
#          two columns?

