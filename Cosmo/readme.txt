Preprocessed material:
The dataset consists of 4 file groups considering the week for:
	- prodDataDump_20141110.csv
	- prodDataDump_20141114_json.txt
	- prodDataDump_20141128_json.txt
	- prodDataDump_20141121_json.txt

Preprocessing:

The four datasets were not aggregated in a meaningful way that allowed for analysis

The csv file is not in first normal form (a property from relational databasing that would allow for each access to information)
The JSON files are also not in correct JSON format
	( we have objects per line {…} \n {…} \n {…} rather than the proper form of [{…},{…},{…}…] so processing was done to achieve this. 

	script toProperJSON.r (running this file takes about an hour) reads the _json.txt files and spits 2 CSV files that properly label the 

The end result is 
 
clientInfo.csv and aggregatedClickStreamData.csv

the primary key is the client’s userName found in clientInfo.csv and is used to determine which click activity in aggregatedClickStreamData.csv belongs to which customer.


Use finalAggregation.csv for data analytics purposes found in the Prepared data folder.

youtubelinks.csv is a dataset created as a result of parsing through finalAggregation.csv and looking for only youtubelinks 