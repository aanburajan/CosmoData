paperCSV <- "paper75.csv"
paper <- read.csv(paperCSV)

adblockBinary <- c()
dNTrackBinary <- c()
adsEffectiveScale <- c()
purchaseProductBinary <- c()
intrusiveScale <- c()
personalizationBinary <- c()
for(i in 1:nrow(paper)){
  #Adblock convert to numeric
  if( paper[i,6] == ""){
    adblockBinary <- c(adblockBinary, -1)
  }
  else if(paper[i,6] == "Y"){
    adblockBinary <- c(adblockBinary, 1)
  } else{
    adblockBinary <- c(adblockBinary,0)
  } 
  
  #Do Not Track Convert to Numeric
  if( paper[i,7] == ""){
    dNTrackBinary <- c(dNTrackBinary, -1)
  } else if (paper[i,7] == "Y"){
    dNTrackBinary <- c(dNTrackBinary,1)
  } else {
    dNTrackBinary <- c(dNTrackBinary,0)
  }
  
  #adds effective -> convert to 1-5 scale
  if( paper[i,14] ==""){
    adsEffectiveScale <- c(adsEffectiveScale, -1)
  }
  else if(paper[i,14] == "Effective"){
    adsEffectiveScale <- c(adsEffectiveScale, 5)
  }
  else if (paper[i,14] == "Not Effective"){
    adsEffectiveScale <- c(adsEffectiveScale,1)
  }
  else {
    adsEffectiveScale <- c(adsEffectiveScale , 3)
  }
  
  if(paper[i,15] == ""){
    purchaseProductBinary <- c(purchaseProductBinary,-1)
  }else if (paper[i,15] =="Y"){
    purchaseProductBinary <- c(purchaseProductBinary,1)
  }else {
    purchaseProductBinary <- c(purchaseProductBinary,0)
  }
  
  if(paper[i,16] == ""){
    intrusiveScale <- c(intrusiveScale,-1)
  }else if(paper[i,16] == "Not Intrusive"){
    intrusiveScale <- c(intrusiveScale,1)
  } else {
    intrusiveScale <- c(intrusiveScale,9)
  }
  
  if(paper[i,17] == ""){
    personalizationBinary <- c(personalizationBinary,-1)
  } else if (paper[i,17] == "Y"){
    personalizationBinary <- c(personalizationBinary,1)
  } else {
    personalizationBinary <- c(personalizationBinary,0)
  }
}
paper[,6] <- adblockBinary
paper[,7] <- dNTrackBinary
paper[,14] <- adsEffectiveScale
paper[,15] <- purchaseProductBinary
paper[,16] <- intrusiveScale
paper[,17] <- personalizationBinary

write.csv(paper,"processedPaper.csv", row.names=F)
