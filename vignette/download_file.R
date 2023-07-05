outputDir <- tempdir()
GO_fp <- file.path(outputDir, "GO_Biological_Process_2021.txt")
download.file(url = "https://raw.githubusercontent.com/eleonore-schneeg/OmixData/main/GO_Biological_Process_2021.txt",
              destfile=GO_fp ,
              headers = c(Authorization = paste("token", Sys.getenv("GH_TOKEN"))))
head(read.delim(GO_fp))
