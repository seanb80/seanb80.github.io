On the lab wishlist was the joining of the primer database and primer location database. I figured I would take a stab at it. I have little experience in SQL, which would likely be the optimal way to do it, so I figured I'd take a stab at it with R and received moderate success.

A walkthrough of the code

```
PD <- read_csv("~/Documents/Roberts Lab/Primer Databse/PrimerDatabase - primers.csv")
primerbox <- read_csv("~/Documents/Roberts Lab/Primer Databse/primerbox.csv")

```

Brings in the two databases. The primerbox database had to be hand collated from a multi-tab Google Sheet.

```
PD <- PD[25:length(PD$`Primer Sequence`),1:17]

for( i in 1:ncol(PD))   {
  for(j in 1:nrow(PD))   {
      PD[j,i] <- tolower(PD[j,i])
      PD[j,i] <- gsub(" ", "_", PD[j,i])
      }
}

for( i in 1:ncol(primerbox))   {
  for(j in 1:nrow(primerbox))   {
      primerbox[j,i] <- tolower(primerbox[j,i])
      primerbox[j,i] <- gsub(" ", "_", primerbox[j,i])
      }
}

primerbox <- primerbox[-c(which(is.na(primerbox$Name) == TRUE)),]
```

The first line cleans up the primer database, as it had extraneous rows leftover from formatting from Google sheets.

The next two loops go through each database cell, forcing any text to lower case and removing any spaces, replacing them with underscores. This is largely to aid in matching in later steps.

The last line removes some extra rows from the primer location database, artifacts left over from the hand collating. 

```
PD.test <- PD
PB.test <- primerbox

for(i in 1:nrow(PB.test))   {
  for(j in 1:nrow(PD.test))   {
    if((!is.na(PD.test$sr_ID[j]) && !is.na(PB.test$`SR ID`[i])) && PD.test$sr_ID[j] == PB.test$`SR ID`[i])   {
      PD.test[j,18] <- PB.test$`Box Name`[i]
      PD.test[j,19] <- PB.test$Position[i]
      PD.test[j,20] <- PB.test$`IDT #`[i]
      PD.test[j,21] <- PB.test$Date[i]
      PD.test[j,22] <- PB.test$Notes[i]
    } else if(PD.test$`Primer name`[j] == PB.test$Name[i])  {
      PD.test[j,18] <- PB.test$`Box Name`[i]
      PD.test[j,19] <- PB.test$Position[i]
      PD.test[j,20] <- PB.test$`IDT #`[i]
      PD.test[j,21] <- PB.test$Date[i]
      PD.test[j,22] <- PB.test$Notes[i]
    } 
  }
}
colnames(PD.test)[18:22] <- c("Box_Name", "Box_Position", "IDT #", "Date", "Box_Notes")
```

Since this is a work in progress, I saved test copies of my cleaned databases and operated on them. The meat of this loop iterates first over the primer location database, and then over the primer database trying to match by SRLab ID number, and then gene name. If a match is sucessful, it saves relevant location information to the main primer database.

```
length(which(!PB.test$Name %in% PD.test$`Primer name`))
PB.test[which(!PB.test$Name %in% PD.test$`Primer name`),] -> leftovers
```

Finally, I look to see how many I sucessfully matched, and then save those which did not match to a third database, for further (hopefully not by hand) matching. In this case I matched 667 of the 1035 primers, leaving 368 unidentified. 
