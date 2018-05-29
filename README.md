# DataCleaning_In_R

title 	output
Data Cleaning (Text Format)-Kailash Hambarde(School Of Compuational Sciences,SRTMUN
	
html_notebook

Harmed<- readLines("C:\\Users\\Panu\\Documents\\Earthquake.txt")

Additional Siblings of 'readLines' These are some of the readLines functions supported R.

    Read.csv :- For Comma separted values with period as decimal sepaator.
    read.csv2 :- For semicolon separated values with comma as decimal separator.
    read.delim :- Tab Delimated Fiiles with period as decimal separted.
    read.delim2:- Tab Delimated Fiiles with period as decimal separted.
    read.fwf :- Data with predetermind numbers of bytes per columns.

Data Cleaning Now lets try to create Data Frame.

d <- as.data.frame(Harmed)

A newly created data frame should always be inspected. Before Proceeding forward let see what is that.

d

Data Cleaning: Data Inspection:-

Data Inspection:- -It Involves Inspecting data due to understand its structure, number of attributes and oberservations for each attributes and the data types for each these attributes.

-After reviewing this properties of data you are able to judge whether the raw data is representing aptly by the object inspected (lists,vectors,matrices,and data frame).

-d is the data frame but how good a data frame it is.? the following function will tell

class(d)

class function tells the data type of variable.

length(d)

length function returns the length of the object(vector,lists)

nrow(d)

nrow function return the number of rows.

ncol(d)

ncol function return the number of columns.

dim(d)

dim function returns the dimesion of the object i:e number of rows and number of cloumns.

str(d)

str() gives the structure of the data frame and tells that d conatins 9 oberservtions(rows) and 1 varibles(column).

So, after inspecting your data frame, the following conclusion

    Data Frame have comments.

    The Attribute are not defined in separate columns.

    The data types are compromised.

Lets cleaning the data first.

The Raw data that we want to analyze is in the txt format.

You wish to tackle the following problems.

    Step 1:- Select the lines containing Data

    Step 2:- Remove the comments lines

    Step 3:- Split the lines into separated fields

    Step 1:- Transform into a data frame

    Step 1:- Normalize and coerce to correct type

Data Cleaning : Select the lines containing data.

    grepl() function:- it is one of the string manipulation function in R.

Syntax :- grepl("^%",txt)

comments <- grepl("^%",Harmed)

    Here, the first argument of grepl is a search pattern, where the caret(^) indicates a start-of-line

    The result of grepl is a logical vector that indicates which element of text contain the pattern' start-of-line' followed by a percent sign i:e (%)comments

    grepl() returns TRUE if a string contains pattern, otherwise FALSE; is the parameter is a string vector, returns a logical vector

comments

    To Remove the selected comments we simple remove the vectors containing the comments form the text.

display <- Harmed[!comments]
comments

    String Manipulation Functions:-

    grep():- This Function searches for matches to pattern within each element of a character vector.

    Syntax:- grep("^,txt")

    Let us run these functions and obeserve the outputs.

comments_grepl <- grepl("^%",Harmed)
comments

display_grepl <- Harmed[!comments_grepl]
display_grepl

comments_grep <- grep("^%",Harmed)
comments_grep

display_grep <- Harmed[!comments_grep]
display_grep

    Problem 1:- Suppose if we want to remove the very first digit from the string.
    Example :- We have the following data.

display[1]

    One way can be :- Run for loop until the total length of the string and replace the occurrence of the digit the whitespace.

-Solution :- Another way is to use the sub() built-in function in R.

p <- display[1]
p

    Syntax :- sub(pattern, replacement , x)

    This functions finds patterns within string in a similar mannar in grep(), but then substitutes the first instance of a match with specified string.

R <- sub("[[:digit:]]","",p)
R

    Problem 2 :- What if you want to replace all the occurrance of digit from the string.

    Solution :- Use gsub() built in function in R .

    Syntax :- gsub(pattern, replacement, x)

This function works in exactly the same manner as sub(),but replaces all matches to pattern rather than replacing only the first match.We refer to this as global replacement.

R <- gsub("[[:digit:]]","",p)
R

Syntax :- sub(pattern. Replcement,x) Syntax :- gsub(pattern. Replcement,x)

    Pattern : A pattern to search for, which is assumed to be a regular expression. Use an additinal argument fixed = TRUE to look for a pattern without using regular expression.

    Replecement : A character string to replace to occurrence(or occurrences for gsub) of pattern.

    x : A chaacter vector to search the pattern. Each elecment will be searched separately

    replace the first occurrence of pattern with sub or replace all occurrences with gsub.

    Problem 3 :- If you wish to know the character position of occurrence of 4 in the following.

display[4]

    Solution :- Use regexpr() function

    This function reports the character postion in the provided strings where the start of the match with pattern occurs.

    The function also returns the length of the match

reg <- regexpr("4", display[4])
reg

    Problem 4 :- As you can see here that there are 2 occurrence of 4. How can all such occurrence can be known?

    Solution :- Use grexpr() function

    This is globalversion of regexpr(). This function reports all matches to pattern rather than only the first match. A list is returned in this case because if more than one match in an element of the provided charater vector is possible.

    grepl() :- this function searches for matches to pattern and returns a logical vector containing the match

    grep() :- Similar to grep() but returns an integer vector containing the match

    Sub() :- Similar to grep(), but it substituted the first instance of a match with a specified string

    gsub() :- Tab-ame as sub(), but replaces all matches to pattern

    regexpr :- Returns the character position in the given strings where the start of the match with pattern occurs. Also returns length of the macth

    Data Cleaning : Split the lines in separate fields....

So far, we have resolved the folowing problems with the data.

    Problem 1 : Select the lines containing data
    Problme 2 : Remove the comment lines

and have following data with us:

display

    Problem 3 : we need a function which accepts a character vector and splits it into a list of character vectors

    Solution : Strsplit() does that

    This function accepts a character vector and a split argument which tells strsplit how to split a string into substrings. The result is a list character vectors.

splitData <- strsplit(display,split = ",")
splitData

    Problem 4 :- Trasform Into a Data Frame.

    The lines after splitting now are ready to be converted into a data frame.

    So, first all the elements are copied into matrix which is then coerced a data frame

Lines<- matrix(unlist(splitData), nrow=length(splitData),byrow = TRUE)

    the function 'unlist' concatenates all the vectors in a list inti one large character vector That vector is then used to fill a matrix of class character

    byrow +TRUE : as the data is stored with rows concatenated

    stringAsFactor=FALSE: No interpretation of value is done

Lines

colnames(Lines) <- c("Name","DateOfBirth","DeathOfYear")

