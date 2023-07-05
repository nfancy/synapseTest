FROM rocker/rstudio:4.0.2

COPY ./vignette/download_file.R .

RUN --mount=type=secret,id=GH_TOKEN \
echo "Sys.setenv(GH_TOKEN=$(cat /run/secrets/GH_TOKEN ))" >> "${HOME}/.Rprofile" \
&& Rscript download_file.R
