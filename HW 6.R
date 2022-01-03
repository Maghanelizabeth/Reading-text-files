Mlk <-read.csv("C:/Users/Magha/OneDrive/Desktop/mlk.csv")

install.packages("sqldf")
library(sqldf)

install.packages("wordcloud")
library(wordcloud)
install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("wordcloud2")
library(wordcloud2)

install.packages("tm")
library(tm)
docs <- Corpus(VectorSource(Mlk))
docs <- tm_map(docs, removeNumbers) 
docs <- tm_map(docs, removePunctuation) 
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)


set.seed(1234)
install.packages("wordcloud")
library(wordcloud)
wordcloud(words = df$word, freq = df$freq, min.freq = 1,   
          max.words=200, random.order=FALSE, rot.per=0.35,      
          colors=brewer.pal(8, "Dark2"))


install.packages("sqldf")
library(sqldf)

Mlk <-read.csv("C:/Users/Magha/OneDrive/Desktop/mlk.csv")


MLK <- sqldf("SELECT * FROM Mlk")
install.packages("syuzhet")
library('syuzhet')

TextDoc_dtm <- TermDocumentMatrix(docs)
dtm_m <- as.matrix(TextDoc_dtm)
dtm_v <- sort(rowSums(dtm_m),decreasing=TRUE)
dtm_d <- data.frame(word = names(dtm_v),freq=dtm_v)

head(dtm_d, 5)
library("ggplot2")
barplot(dtm_d[1:5,]$freq, las = 2, names.arg = dtm_d[1:5,]$word,
        col ="lightgreen", main ="Top 5 most frequent words",
        ylab = "Word frequencies")



