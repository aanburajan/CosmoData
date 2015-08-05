The unprocessed data is found in paper75.csv and type form survey83.csv

file: paperProcessing.R is run using the paper75.csv to change the features so that we can aggregate it with the type form data

file: typeFormProcessing does the same for the survey83 data

after processing, the folder should create 2 new cvs files
processedPaper.csv and processedOnline.csv

aggregateProcessedData.r is run using the 2 above files to aggregate the cvs files into a single one.

aggregatedData.csv is the resulting dataset.



servicesForProduct.csv is another data set that lists each individuals persons preferences of data exchange. 0 means no and 1 means yes


