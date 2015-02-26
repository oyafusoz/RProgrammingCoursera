#getwd (pwd in git bash)
#setwd (cd in git bash)
#list.files (ls in git bash)

setwd('C://Users//Mervin//Google Drive//RProgrammingCoursera (1)')

###############
# Indexing
###############

#Vectors (a bit about recycling)
a = 1:4
a + c(1,2)

#dataframes
b = read.csv('001.csv')
head(b) #what does this return
b[1:6,]

b[,'nitrate'] #what does this return?
b[,c('nitrate', 'sulfate')] #What does this return?
names(b) #what does this return?

trunc = list.files()[1:5]

#Print the first 10 records for each csv.file
for(i in trunc) {
  #start at trunc[1]
  file = read.csv(i)
  print(head(file, n = 10))
  #increment index by 1 (i.e. trunc[2]) 
  #repeat loop
  #increment index by 1 (i.e. trunc[3])
  #repeat loop
  #stop loopwhen i hits the last element in trunc
}

#Same loop
for(i in 1:length(trunc)) {
  #start at i = 1
  file = read.csv(trunc[i])
  print(head(file, n = 10))
  #increment index from 1 to 2 
  #repeat loop
  #increment index from 2 to 3
  #repeat loop
  #stop loop after i hits 5 (breaks condition)
}

#Print the number of complete cases for each csv.file
for(i in trunc) {
  file = read.csv(i)
  print(sum(complete.cases(file)))
}

# Create two dataframes and row-bind them together
x = data.frame(x = 1:10, y = 2:11)
y = data.frame(x = c(3,2,5), y = c(5,23,6))
z = data.frame(x = 1:10, y = 2:11, z = 3:12)

#rbind x, y, and z
#rbind c(1,2) to x or y and c(1,2,3) to z