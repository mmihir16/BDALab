data()
data("mtcars")
nrow(mtcars)
ncol(mtcars)
sum(mtcars$am==0)
sum(mtcars$am==1)
x=mtcars$hp
y=mtcars$wt
plot(x,y,main="LaLa",xlab = "Hey",ylab = "Hi",pch=19,frame=FALSE)
newmt=transform(mtcars,am=as.integer(am))
newmt[(newmt$cyl<5),]