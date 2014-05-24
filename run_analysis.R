# Read data
train = read.table('train/X_train.txt',header=F)
test = read.table('test/X_test.txt',header=F)
full = rbind(train,test)

features = read.table('features.txt')
mean_std_feat = grepl("mean\\(\\)|std\\(\\)",features$V2)
mean_std = full[,mean_std_feat]

y_train = read.table('train/y_train.txt')
y_test = read.table('test/y_test.txt')
y = rbind(y_train,y_test)
y_labels = character(length(y$V1))
activities = read.table('activity_labels.txt')

#
for (i in 1:6) {
  y_labels[y==i] = as.character(activities[i,'V2'])
}
names(mean_std) = features[mean_std_features,'V2']
mean_std$label = y_labels


#
subjects_train = read.table('train/subject_train.txt')
subjects_test = read.table('test/subject_test.txt')
subjects = rbind(subjects_train,subjects_test)
final = NULL
for (i in 1:6) {
  for (j in 1:30) {
    for (var in features[mean_std_feat,'V2']) {
      average = mean(mean_std[mean_std$label==as.character(activities[i,'V2']) & (subjects$V1==j),var])
      final = rbind(final, c(as.character(activities[i,'V2']),j,var,average))
    }
    
  }
}
final = data.frame(final)
names(final) = c('Activity','Subject','Variable','Average')
write.csv(final,'tidy_set.csv')
