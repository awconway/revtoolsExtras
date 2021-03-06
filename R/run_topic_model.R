# function to run a topic model with specified parameters
# old name
run_LDA <- function(
  dtm,
  type = "lda",
  n_topics = 5,
  iterations = 2000
){
  run_topic_model(dtm, type, n_topics, iterations)
}

# new name
run_topic_model <- function(
	dtm,
	type = "lda",
	n_topics = 5,
	iterations = 2000
){
	LDA_control <- list(
    iter = iterations
  )
	switch(type,
		"ctm" = {
      topicmodels::CTM(
        dtm,
        k = n_topics
      )
    },
		"lda" = {
      topicmodels::LDA(
        dtm,
        k = n_topics,
        method = "Gibbs",
        control = LDA_control
      )
    }
  )
}