The purpose of this assignment is to clean messy data into tidy data which is 
•	The data is a collection of values of a given type
•	Every value belongs to a variable
•	Every variable belongs to an observation
•	Observations are variables for a unit (like an object or an event).
First : observe the data set
1.	Check data source like http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2.	Read read.me
3.	Hard to understand because it is messy data
4.	Open data in excel or notepad++
5.	Install data in r studio and check it in R
Second: find problems in data set and solve the questions
1.	The data set has no header/no column names
2.	The data set has been divided  into multiple parts 
Third: using R language to clean data
1.	Upzip and import
2.	Check the str() of data
3.	Combine data using rbind or cbind
4.	Use grep() or select( contains() )function to extract special column contains special characters
5.	Use factor()or order() to substitute factor variables or categorical variables
6.	Use the aggregate() function, and  by variables e in a list () to subset the data and calculate mean.
7.	Write.table to a txt file
