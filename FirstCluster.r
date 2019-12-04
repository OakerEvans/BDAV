# tell R where your file is located
setwd('C:/Users/metl026/Desktop/SImOut/analysis')

# tell R what file to use
mydata <- read.csv("moble_devices.csv")

mydata<- subset(mydata, select= c("battery_power","blue"))

# convert to a R data frame
mydata <- data.frame(mydata)

# fit the K-means model to mydata
fit <- kmeans(mydata, 4) #3 cluster solution

# get cluster means
means <- aggregate(mydata, by=list(fit$cluster), FUN=mean)

# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)

# write the data back out to Excel
write.csv(mydata, file="mobiledevice.csv", row.names=FALSE) # full data file with cluster assignments
write.csv(means, file="mobiledevicemean.csv", row.names=FALSE) # list of means by cluster

#end

