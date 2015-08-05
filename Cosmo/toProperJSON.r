#Ziquan Miao 6-9-2015

#this is a script to properly establish json format of the datadump during the November 14-28 weeks

#here is the JSON reading package needed. To install package write: install.packages("jsonlite") in console

library("jsonlite")
filenames <- c("prodDataDump_20141114_json.txt","prodDataDump_20141121_json.txt","prodDataDump_20141128_json.txt")

#make the 2 matrices
customerInfo <- matrix(data = NA, nrow = 0, ncol = 12, row.names=FALSE) 
colnames(customerInfo) <- c("first_name", "last_name","city","email","cookie_been_enable_https","cookie_been_engage_log",  
                            "cookie_been_recording","facebook_access_token","facebook_id",         
                             "last_seen","private_beta_invitation" ,"username")
clickMat <- matrix(data = NA, nrow = 0, ncol = 5, row.names=FALSE)
colnames(clickMat) <- c("url", "referrer_id", "page_id", "localtime", "username")
for(file in filenames){
  print(paste("Starting File:",file,sep=" "))
  #This code basically collapses the improperly set files
  #source for code below: http://stackoverflow.com/questions/26519455/error-parsing-json-file-with-the-jsonlite-package
  tempData <- fromJSON(sprintf("[%s]",paste(readLines(file), collapse=",")))
    #for each user i
  for (i in 1:length(dat[[1]])){
    print(paste("adding Customer:", dat[[1]][i]))
    #store username as foreign key
    tempUserName <- dat[[12]][i]
      #for each nonclickstream field (12 instead of 13) j
      #hold a vector that stores all the information about the client except clickstream
    
    #add to clientData matrix only if its not already there. Check by email
    if (tempUserName %in% customerInfo[,12]){
      print("customer already added!")
    }else{
      #create a storage vector
      tempClientData <- c()
      
      #append to that vector
      for(j in 1:12){
        if(j == 6){ tempClientData <- c(tempClientData,TRUE)}
        else{tempClientData<- c(tempClientData,dat[[j]][i])}
      }
      
        #bind storage vector to end of customerInfo Matrix
      customerInfo <- rbind(customerInfo, tempClientData)
    }
    
    
    #add clickstream Data
    tempClickData <- dat$clickstream[[i]]
    tempURLDat <- unlist(tempClickData[1])
    tempRefDat <- unlist(tempClickData[2])
    tempPageDat <- unlist(tempClickData[3])
    tempTimeDat <- unlist(tempClickData[4])
    numClicks <- length(tempURLDat)
    for(k in 1:numClicks){
      tempClickStreamInstance <- c(tempURLDat[k],tempRefDat[k],tempPageDat[k],tempTimeDat[k],tempUserName)
      clickMat <- rbind(clickMat,tempClickStreamInstance)
    }
  }
  print(paste("Done with file: ", file, sep = ""))
}


#append the 20141110.csv file
data10 <- read.csv("prodDataDump_20141110.csv",header=T)
userNames10 <- as.vector(data10$username)
userIndexes <- userNames10 != ""
userIndicies <- c()
userNameVector10 <- c()
tempUserName <- ""
#for each first name, if it is not blank then store it!
for (i in 1:length(userIndexes)){
  if(userIndexes[i]){
    userIndicies <- c(userIndicies, i)
    tempUserName <- as.character(data10[i,12])
    tempUserName <- gsub("\"",'',tempUserName)
    tempUserName <- substring(tempUserName,2)
  }
  userNameVector10 <- c(userNameVector10, tempUserName)
}

#write client data together
clientData10 <- data10[userIndicies,1:12]
clientData10 <- as.matrix(clientData10)
clientData10 <- gsub("\"", '', clientData10)
clientData10 <- substring(clientData10, 2)
for(i in 1:length(clientData10[,12])){
  if(clientData10[i,12] %in% customerInfo[,12]){print("yes its in")}
  else {
    customerInfo <- rbind(customerInfo,clientData10[i,])
    print("adding customer now")
  }
}


#main helper function.
#takes a row index and reverses it.
#goal of this function is to find the index that contains the timestamp.
findLastIndex <- function (vector){
  workingVector <- rev(vector)
  tempIndex <- -1
  for(i in 1:length(workingVector)){
    if (workingVector[i] != "" & !is.na(workingVector[i])){
      print(paste(workingVector[i],length(workingVector) - i + 1,sep = " "))
      return(length(workingVector)-i+1)
    }
  }
  stop("had trouble here")
}

#collect activity data
clientActivity <- table[, 13:16]
#correspond activity data with correct client
clientActivity <- cbind(clientActivity,userNameVector10)
clientActivity <- as.matrix(clientActivity)
