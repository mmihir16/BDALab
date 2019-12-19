#Write a program to create the csv file for storing Employee data. Containing the data  
#(EmpID, EmpName , DOJ, EmpCode, Dept, Desig.)
#a. Read the suitable number of employee details from the user.
#b. Create a dataframe of Employee
#c. Store the dataframe in the csv file
#d. Check the difference between csv and csv2 file
#e. Read the data from csv and Display the contents
#f. Append a new row into the csv file


limit <- as.integer(readline("Limit: "))

i <- 0
dfo <- data.frame(ID="",NAME="",DOJ="",CODE="",DEPT="",DESG="")

while ( i < limit){
  id <- readline("empid: ")
  name <- readline("ename: ")
  doj <- readline("doj: ")
  code <- readline("code: ")
  dept <- readline("dept: ")
  desg <- readline("desg: ")
  
  print("writing records in csv... ")
  datav <- c(id,name,doj,code,dept,desg)
  dfn <- data.frame(ID=id,NAME=name,DOJ=doj,CODE=code,DEPT=dept,DESG=desg)
  dfo <- rbind(dfo,dfn)
  i <- i +1
}
dfo
write.csv(dfo,"csv1.csv")
write.csv2(dfo,"csv2.csv")

print(read.csv("csv1.csv"))
