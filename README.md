```{r style, echo=FALSE, results='asis', message=FALSE, warning=FALSE}
BiocStyle::markdown()
knitr::opts_chunk$set(tidy = FALSE,
                      message = TRUE,
                      warning = FALSE)
options(knitr.duplicate.label = "allow")
```


First we must load the data from Omix for the vignette:

```{r results='asis', message=FALSE, warning=FALSE}
synapser::synLogin(email=Sys.getenv("SYNAPSE_ID"), password=Sys.getenv("SYNAPSE_PASSWORD"))
rawdata_rna <- read.csv(synapser::synGet('syn3191087')$path, header=T, stringsAsFactors = F, row.names=1)
print(head(rawdata_rna))

```
