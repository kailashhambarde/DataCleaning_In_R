
Harmed <- readLines("C:\\Users\\Panu\\Documents\\Earthquake.txt")
Harmed

df <- data.frame(Harmed)
df

class(df)

length(df)

nrow(df)

ncol(df)

nrow(df)

str(df)

comments <- grepl("^%",Harmed)

comments

display <- Harmed[!comments]
display

comments_grepl<- grepl("^%",Harmed)
comments_grepl
commets_grep<- grep("^%",Harmed)
commets_grep

display_grepl <- Harmed[!comments_grepl]
display_grepl

display_grep <- Harmed[!commets_grep]
display_grep

display[1]
p <- display[1]
p
