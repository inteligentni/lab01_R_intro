###############################
# Vectors
###############################

# Numeric
x <- 41.5
x
print(class(x))

# Integer
x <- 5L
x
print(class(x))

# Character
x <- "Hello"
x
print(class(x))

# Logical (true/false)
x <- TRUE
x
print(class(x))

# Creating vector with more elements
v <- c(1.5, 5, 3)
v

###############################
# Vector arithmetics
###############################

# (+, -, *, /, ^)
v + 1
-v
2*v + 2
v/2
v^2

# get the max value
v1 <- c(1, 2, 3, 4, 5)
max(v1)

# get the min value
min(v1)

# get the range of values
range(v1)

# calculate the sum of all elements
sum(v1)

# calculate the product of all elements
prod(v1)

################################
# Generating regular sequences
################################

# generate a sequence from 1 to 10
1:10

# generate a sequence from 10 to 1
10:1

# generate a sequence from 3.2 to 4.7, with a step 0.2
seq(3.2, 4.7, by = 0.2)

################################
# Factor values
################################

# create a vector and convert to factor
v2 <- c("cold", "mild", "mild", "hot", "cold")
temp <- factor(v2)

# print all levels 
levels(temp)

# print the summary
summary(temp)

################################
# Missing values
################################

# check which values are NAs
v3 <- c(1, NA, 3, 4, NA)
is.na(v3)

# NaN missing value
0/0

################################
# Data frame
################################

# create a data frame
data1 <- data.frame(
  days = c("Mon", "Tue", "Wen", "Thu", "Fri"), 
  temp = c(25, 28, 30, 29, 34))
data1

# create a data frame from existing vectors
data2 <- data.frame(v1, v2, v3)
data2

################################
# Task 1
################################

# Create a dataframe called *co2.emissions* containing two columns: *years* (2000, 2002, 2004, 2006, 2008, 2010) and *emission* (2.7, 2.9, 4, 4.9, 5.3, 6.2).

# Answer:
co2.emissions <- data.frame(
  year = c(2000, 2002, 2004, 2006, 2008, 2010),
  emission = c(2.7, 2.9, 4, 4.9, 5.3, 6.2)
)
co2.emissions

################################
# Loading data frame from a file
################################

# reading a data frame from the CSV file
beatles <- read.csv("data/beatles_v1.csv", stringsAsFactors = FALSE)
beatles

# print the number of rows
nrow(beatles)

# print the number of columns
ncol(beatles)

# summary function
summary(beatles)

# str function
str(beatles)

# head and tail functions
head(beatles)
tail(beatles)

# retrieve and change column names
names(beatles)

beatles1 <- beatles
names(beatles1) <- c("song_name", "release_year", "duration")
beatles1

# remove column duration
beatles1$duration <- NULL
beatles1

################################
# Subsetting
################################

# get an element from the row 3, column 1 
song <- beatles[3, 1]
song

# get the third row
beatles.subset <- beatles[3,]
beatles.subset

# get rows at positions from 3 to 6 
beatles.subset1 <- beatles[3:6,]
beatles.subset1

# get rows at positions 3 and 6 
beatles.subset2 <- beatles[c(3,6),]
beatles.subset2

# get the second column
years <- beatles[,2]
years

# get the Year column
years <- beatles$Year
years

# retrieve all songs released before year 1965
songsBefore1965 <- beatles[beatles$Year < 1965,]
songsBefore1965

# retrieve all songs released before year 1965 with duration lower than 150 seconds
shortSongsBefore1965 <- beatles[beatles$Year < 1965 & beatles$Duration < 150,]
shortSongsBefore1965

################################
# Task 2
################################
# Print a number of songs from 1963 that last more than 2 minutes (120 seconds).

# Answer:
nrow(beatles[beatles$Year == 1965 & beatles$Duration > 120,])

################################
# Plotting
################################

# create a plot for the given vectors 
plot(c(2, 8, 5), c(25, 10, 30))

# include ggplot2 library
install.packages("ggplot2")
library(ggplot2)

# render a plot for the given data frame (columns Year and Duration)
ggplot(beatles, aes(x=Year, y=Duration))

# render a scatter plot for Year and Duration 
ggplot(beatles, aes(x=Year, y=Duration)) + geom_point()

# render a scatter plot with custom title and axes labels  
ggplot(beatles, aes(x=Year, y=Duration)) + 
  geom_point() +
  xlab("Song release years") + ylab("Song duration") +
  ggtitle("Duration of songs throughout the years")

# render a bar chart displaying the number of songs in each year
beatles$Year <- as.factor(beatles$Year)
ggplot(beatles, aes(x=Year)) + 
  geom_bar() +
  xlab("Song release years") + ylab("Number of songs") +
  ggtitle("Number of songs throughout the years")

# render a line chart for the first five songs with specific line and points properties
ggplot(beatles[1:5,], aes(x=Year, y=Duration, group = 1)) +
  geom_line(colour = "blue", linetype = "dotted", size = 2) + 
  geom_point(colour="green", size = 4, shape = 22, fill = "yellow") +
  xlab("Song release years") + ylab("Song duration") +
  ggtitle("Duration of songs throughout the years") +
  theme_minimal()

################################
# Task 3
################################

# Create a line chart from a dataset *co2.emissions* (created in Task 1) with the x-axis representing the years, and the y-axis representing the values of CO2 emissions.
# Chart title should be "China CO2 Emissions" and y-axis should have a label "CO2 Emissions".

# Answer:
ggplot(co2.emissions, aes(x = year, y = emission, group = 1)) +
  geom_line()  +
  ggtitle("China CO2 Emissions") + 
  ylab("CO2 Emissions")

################################################################
# Homework - Complete interactive R tutorials with Swirl
################################################################
install.packages("swirl")
library("swirl")
swirl()