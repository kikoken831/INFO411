r1 <- 2+2
r1

v1 <- c(1,2,3,4,5,6,7,8,9,10)
v1
v2 <- c(11,12,13,14,15,16,17,18,19,20)
v2

v1[2]
v1[2:5]
v1[c(3,6,2)]
v1[-2]
v1[-(2:5)]
v1 <- v1[-(2:5)]
v1 <- 1:10
v1 >= 4
v1 < 4
!(v1 >= 4)
which(v1 >= 4)
v2[v1 >= 4]
summary(v1)
mean(v1)
sd(v1)
sum(v1)
length(v1)
length(v2)
v1 + v2
v1 * v2
r1 + v1
r1 * v1
m1 <- matrix(v1,2,5)
m1
matrix(v1,2,5,byrow=TRUE)
dim(m1)
m1[1,1]
m1[1,]
m1[,1]
a1 <- array(1:24, c(3,4,2))
a1
apply(m1,1,sum)
apply(m1,2,sum)
apply(a1,c(1,2),sum)
a1[,,1]+a1[,,2]
df1 <- data.frame(v1,v2)
df1
head(df1)
colnames(df1) <- c("A","B")
df1
df1$B
df1[,2]
df1[,"B"]
df1[["B"]]
df1$B[3]
df1[3,2]
df1[3,"B"]
df1[["B"]][3]
attach(df1)
A
with(df1,A+B)
with(df1,{
  tmp <- A + B
  sum(tmp*tmp)
})
df1[df1$A >= 4, ]
subset(df1,A >= 4)
for (i in v2)
{
  print(i);
}


if(2+2 == 4) print("correct") else print("wrong")


data1 <- read.table("Lab1_plane_excel.csv", sep = ",", header = TRUE)
head(data1)
dim(data1)
data2 <- read.csv("Lab1_plane_excel.csv")
head(data2)

sulphur_data <- read.csv("Lab1_sulphur_oxide.txt", sep = " ")
sulphur_data
sulphur_data <- sulphur_data[,-2]
sulphur_data