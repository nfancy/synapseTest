outputDir <- tempdir()
GO_fp <- file.path(outputDir, "GO_Biological_Process_2021.txt")
download.file(url = "https://raw.githubusercontent.com/eleonore-schneeg/OmixData/main/GO_Biological_Process_2021.txt",
              destfile=GO_fp ,
              headers = c(Authorization = paste("token", Sys.getenv("GH_TOKEN"))))
head(read.delim(GO_fp))

#synapser::synLogin(email=Sys.getenv("SYNAPSE_ID"), password=Sys.getenv("SYNAPSE_PASSWORD"))
synapser::synLogin(authToken=Sys.getenv("SYNAPSE_TOKEN"))
head(read.csv(synapser::synGet('syn3191087')$path, header=T, stringsAsFactors = F, row.names=1))

