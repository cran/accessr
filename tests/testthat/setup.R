# Copy the example.Rmd file to be used in tests
ex_file <- system.file(package = "accessr", "examples", "example.Rmd")
# Copy example.Rmd to a temporary directory
file.copy(ex_file, testFolder <- tempdir(check = TRUE), overwrite = TRUE)
# Extract the path this this file
ex_file <- list.files(testFolder, pattern = "example.Rmd", full.names = TRUE)
# Remove the .Rmd extension
ex_file <- sub(".Rmd", "", ex_file)

# Check for packages needed for the tests
got_hux <- requireNamespace("huxtable", quietly = TRUE)
got_flex <- requireNamespace("flextable", quietly = TRUE)
got_pandoc <- rmarkdown::pandoc_available("1.14")
got_all <- got_hux && got_flex && got_pandoc
got_all <- FALSE
