# requires packages - tm, wordcloud, RColorBrewer
#setting up graphic device paramters
#par(mar=c(1,1,1,1))

# overall

overall_level<-readLines("overall.txt") #read the text file

overall_level_corpus<-Corpus(VectorSource(overall_level)) # load the text file as corpus

overall_level_corpus <- tm_map(overall_level_corpus, content_transformer(tolower)) # convert text to lower level

overall_level_corpus <- tm_map(overall_level_corpus, removeNumbers) # remove number

overall_level_corpus <- tm_map(overall_level_corpus, removeWords, stopwords("english")) # remove common english stop words

overall_level_corpus <- tm_map(overall_level_corpus, removeWords, c("rhesus", "due", "there", "will", "also", "can", "this", "one", "they", "the", "however", "macaques", "now", "hence")) # remove your own stop words

overall_level_corpus <- tm_map(overall_level_corpus, removePunctuation)  # remove punctuations

overall_level_corpus <- tm_map(overall_level_corpus, stripWhitespace) # remove white space


dtm_overall_level <- TermDocumentMatrix(overall_level_corpus)
m_overall_level <- as.matrix(dtm_overall_level)
v_overall_level <- sort(rowSums(m_overall_level),decreasing=TRUE)
d_overall_level <- data.frame(word = names(v_overall_level),freq=v_overall_level)

set.seed(1234)
wordcloud(words = d_overall_level$word, freq = d_overall_level$freq, scale=c(2.4,.3), min.freq = 2, random.order = FALSE,rot.per = 0.3, use.r.layout=TRUE, fixed.asp = TRUE,
          colors=1)


#upper level

upper_level<-readLines("upper.txt") #read the text file

upper_level_corpus<-Corpus(VectorSource(upper_level)) # load the text file as corpus

upper_level_corpus <- tm_map(upper_level_corpus, content_transformer(tolower)) # convert text to lower level

upper_level_corpus <- tm_map(upper_level_corpus, removeNumbers) # remove number

upper_level_corpus <- tm_map(upper_level_corpus, removeWords, stopwords("english")) # remove common english stop words

upper_level_corpus <- tm_map(upper_level_corpus, removeWords, c("rhesus", "due", "there", "will", "also", "can", "this", "one", "they", "the", "however", "macaques", "now", "hence")) # remove your own stop words

upper_level_corpus <- tm_map(upper_level_corpus, removePunctuation)  # remove punctuations

upper_level_corpus <- tm_map(upper_level_corpus, stripWhitespace) # remove white space


dtm_upper_level <- TermDocumentMatrix(upper_level_corpus)
m_upper_level <- as.matrix(dtm_upper_level)
v_upper_level <- sort(rowSums(m_upper_level),decreasing=TRUE)
d_upper_level <- data.frame(word = names(v_upper_level),freq=v_upper_level)

set.seed(1234)
wordcloud(words = d_upper_level$word, freq = d_upper_level$freq, scale=c(2.4,.3), min.freq = 2, random.order = FALSE,rot.per = 0.3, use.r.layout=TRUE, fixed.asp = TRUE,
          colors=1)

# middle level

middle_level<-readLines("middle.txt") #read the text file

middle_level_corpus<-Corpus(VectorSource(middle_level)) # load the text file as corpus

middle_level_corpus <- tm_map(middle_level_corpus, content_transformer(tolower)) # convert text to lower level

middle_level_corpus <- tm_map(middle_level_corpus, removeNumbers) # remove number

middle_level_corpus <- tm_map(middle_level_corpus, removeWords, stopwords("english")) # remove common english stop words

middle_level_corpus <- tm_map(middle_level_corpus, removeWords, c("rhesus", "due", "there", "will", "also", "can", "this", "one", "they", "the", "however", "macaques", "now", "hence")) # remove your own stop words

middle_level_corpus <- tm_map(middle_level_corpus, removePunctuation)  # remove punctuations

middle_level_corpus <- tm_map(middle_level_corpus, stripWhitespace) # remove white space


dtm_middle_level <- TermDocumentMatrix(middle_level_corpus)
m_middle_level <- as.matrix(dtm_middle_level)
v_middle_level <- sort(rowSums(m_middle_level),decreasing=TRUE)
d_middle_level <- data.frame(word = names(v_middle_level),freq=v_middle_level)

set.seed(1234)
wordcloud(words = d_middle_level$word, freq = d_middle_level$freq, scale=c(2.4,.3), min.freq = 2, random.order = FALSE,rot.per = 0.3, use.r.layout=TRUE, fixed.asp = TRUE,
          colors=1)


#lower level

lower_level<-readLines("lower.txt") #read the text file

lower_level_corpus<-Corpus(VectorSource(lower_level)) # load the text file as corpus

lower_level_corpus <- tm_map(lower_level_corpus, content_transformer(tolower)) # convert text to lower level

lower_level_corpus <- tm_map(lower_level_corpus, removeNumbers) # remove number

lower_level_corpus <- tm_map(lower_level_corpus, removeWords, stopwords("english")) # remove common english stop words

lower_level_corpus <- tm_map(lower_level_corpus, removeWords, c("rhesus", "due", "there", "will", "also", "can", "this", "one", "they", "the", "however", "macaques", "now", "hence")) # remove your own stop words

lower_level_corpus <- tm_map(lower_level_corpus, removePunctuation)  # remove punctuations

lower_level_corpus <- tm_map(lower_level_corpus, stripWhitespace) # remove white space


dtm_lower_level <- TermDocumentMatrix(lower_level_corpus)
m_lower_level <- as.matrix(dtm_lower_level)
v_lower_level <- sort(rowSums(m_lower_level),decreasing=TRUE)
d_lower_level <- data.frame(word = names(v_lower_level),freq=v_lower_level)

set.seed(1234)
wordcloud(words = d_lower_level$word, freq = d_lower_level$freq, scale=c(2.4,.3), min.freq = 2, random.order = FALSE,rot.per = 0.3, use.r.layout=TRUE, fixed.asp = TRUE,
            colors=1)  


# species

species_level<-readLines("species.txt") #read the text file

species_level_corpus<-Corpus(VectorSource(species_level)) # load the text file as corpus

species_level_corpus <- tm_map(species_level_corpus, content_transformer(tolower)) # convert text to lower level

species_level_corpus <- tm_map(species_level_corpus, removeNumbers) # remove number

species_level_corpus <- tm_map(species_level_corpus, removeWords, stopwords("english")) # remove common english stop words

species_level_corpus <- tm_map(species_level_corpus, removeWords, c("rhesus", "due", "there", "will", "also", "can", "this", "one", "they", "the", "however", "macaques", "now", "hence")) # remove your own stop words

species_level_corpus <- tm_map(species_level_corpus, removePunctuation)  # remove punctuations

species_level_corpus <- tm_map(species_level_corpus, stripWhitespace) # remove white space


dtm_species_level <- TermDocumentMatrix(species_level_corpus)
m_species_level <- as.matrix(dtm_species_level)
v_species_level <- sort(rowSums(m_species_level),decreasing=TRUE)
d_species_level <- data.frame(word = names(v_species_level),freq=v_species_level)

set.seed(1234)
wordcloud(words = d_species_level$word, freq = d_species_level$freq, scale=c(2.4,.3), min.freq = 2, random.order = FALSE,rot.per = 0.3, use.r.layout=TRUE, fixed.asp = TRUE,
          colors=1)


# dept

dept_level<-readLines("dept.txt") #read the text file

dept_level_corpus<-Corpus(VectorSource(dept_level)) # load the text file as corpus

dept_level_corpus <- tm_map(dept_level_corpus, content_transformer(tolower)) # convert text to lower level

dept_level_corpus <- tm_map(dept_level_corpus, removeNumbers) # remove number

dept_level_corpus <- tm_map(dept_level_corpus, removeWords, stopwords("english")) # remove common english stop words

dept_level_corpus <- tm_map(dept_level_corpus, removeWords, c("rhesus", "due", "there", "will", "also", "can", "this", "one", "they", "the", "however", "macaques", "now", "hence")) # remove your own stop words

dept_level_corpus <- tm_map(dept_level_corpus, removePunctuation)  # remove punctuations

dept_level_corpus <- tm_map(dept_level_corpus, stripWhitespace) # remove white space


dtm_dept_level <- TermDocumentMatrix(dept_level_corpus)
m_dept_level <- as.matrix(dtm_dept_level)
v_dept_level <- sort(rowSums(m_dept_level),decreasing=TRUE)
d_dept_level <- data.frame(word = names(v_dept_level),freq=v_dept_level)

set.seed(1234)
wordcloud(words = d_dept_level$word, freq = d_dept_level$freq, scale=c(2.4,.3), min.freq = 2, random.order = FALSE,rot.per = 0.3, use.r.layout=TRUE, fixed.asp = TRUE,
          colors=1)

# citizen
citizen_level<-readLines("citizen.txt") #read the text file

citizen_level_corpus<-Corpus(VectorSource(citizen_level)) # load the text file as corpus

citizen_level_corpus <- tm_map(citizen_level_corpus, content_transformer(tolower)) # convert text to lower level

citizen_level_corpus <- tm_map(citizen_level_corpus, removeNumbers) # remove number

citizen_level_corpus <- tm_map(citizen_level_corpus, removeWords, stopwords("english")) # remove common english stop words

citizen_level_corpus <- tm_map(citizen_level_corpus, removeWords, c("rhesus", "due", "there", "will", "also", "can", "this", "one", "they", "the", "however", "macaques", "now", "hence")) # remove your own stop words

citizen_level_corpus <- tm_map(citizen_level_corpus, removePunctuation)  # remove punctuations

citizen_level_corpus <- tm_map(citizen_level_corpus, stripWhitespace) # remove white space


dtm_citizen_level <- TermDocumentMatrix(citizen_level_corpus)
m_citizen_level <- as.matrix(dtm_citizen_level)
v_citizen_level <- sort(rowSums(m_citizen_level),decreasing=TRUE)
d_citizen_level <- data.frame(word = names(v_citizen_level),freq=v_citizen_level)

set.seed(1234)
wordcloud(words = d_citizen_level$word, freq = d_citizen_level$freq, scale=c(2.4,.3), min.freq = 2, random.order = FALSE,rot.per = 0.3, use.r.layout=TRUE, fixed.asp = TRUE,
          colors=1)

