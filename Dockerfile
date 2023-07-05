FROM rocker/rstudio:4.0.2

COPY ./vignette/download_file.R .

RUN --mount=type=secret,id=GH_TOKEN \
echo "GH_TOKEN=$(cat /run/secrets/GH_TOKEN)" >> "${HOME}/.Renviron" \
&& Rscript download_file.R
