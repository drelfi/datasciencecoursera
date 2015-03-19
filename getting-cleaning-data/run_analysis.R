read.ucidataset <- function( dir, xfile = file.path("test","X_test.txt"), yfile = file.path("test","y_test.txt"), subject = file.path("test","subject_test.txt")) {
  # Reading measures labels
  xfile.data <- read.table(file.path(dir, xfile) )
  
  # Reading labels
  yfile.data <- read.table(file.path(dir,yfile))
  names(yfile.data) <- c("labels")
  
  # Reading subject who executed the test
  subject.data <- read.table(file.path(dir,subject))
  names(subject.data) <- "subject"
  
  # Combining all the data into a single table
  result <- cbind( xfile.data, yfile.data, subject.data)
  result
}

publish.varnames <- function( .data, dir, features.file = "features.txt" ) {
  require("dplyr")
  
  # Assign the right names to variables
  var.names <- 
    read.table(file.path(dir,features.file)) %>% 
    rbind(data.frame("V1" = c(562, 563), "V2" = c("labels", "subject")))

  names(.data) <- make.names(var.names[["V2"]], unique=TRUE)
    
  .data
}

add.activitylabels <- function( .data, dir, activitylabels.file = "activity_labels.txt" ) {
  require("dplyr")
  
  # Read the activity names
  activity.names <- read.table(file.path(dir,activitylabels.file))
  names(activity.names) <- c("labels", "activity.name")
  
  # Apply names to data
  .data %>%
    inner_join(activity.names, by="labels") 
}

get.relevantcolumns <- function( .data, dir, features.file = "features.txt" ) {
  require("dplyr")
  
  # Since the search will be by mean() and std(), the original set of names is required
  filter.names <- read.table( file.path(dir,features.file)) %>%
    filter(grepl("(mean|std)\\(\\)",V2)) %>%
    rbind(data.frame(V1=c(563,564),V2=c("subject", "activity.name")))
  
  select(.data, filter.names[["V1"]])
}

tidy.ucidataset <- function( dir ) {
  require("dplyr")
  
  # Read full dataset
  complete.data <- rbind( read.ucidataset(dir), read.ucidataset(dir, file.path("train","X_train.txt"), file.path("train","y_train.txt"), file.path("train","subject_train.txt") ) )

  # Clean data names
  complete.data %>%
    publish.varnames(dir) %>%
    add.activitylabels(dir) %>%
    get.relevantcolumns(dir)
}

summarize.ucidataset <- function( .data ) {
  require("data.table")
  
  # Summarizing all the data by subject and activity
  dt <- data.table(.data)
  dt[, lapply( .SD, mean ), by=c("subject","activity.name")]
}
