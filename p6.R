df=airquality
dim(df)

sapply(df, class)

print("The missing values are:")
xcolnames <- colnames(df)
x <- colSums(is.na(df))
print(x)

which(is.na(df))
sum(is.na(df))
for(i in 1:4)
df[,i] = ifelse(is.na(df[,i]),mean(df[,i],na.rm = TRUE),df[,i])
df

x <- na.omit(df)
print(x)
