FROM rocker/rstudio:4.0.2

RUN apt-get update \
&& apt-get install -y --no-install-recommends apt-utils \
&& apt-get install -y --no-install-recommends \
python3 \
python3-setuptools \
python3-dev \
python3-pip \
python3-venv \
libpng-dev \

#Install CRAN pkgs

&& install2.r -e \
png \
reticulate \
&& R -e "install.packages('synapser', repos=c('http://ran.synapse.org', 'http://cran.fhcrc.org'))"

COPY ./vignette/download_file.R .

RUN --mount=type=secret,id=GH_TOKEN \
--mount=type=secret,id=SYNAPSE_ID \
--mount=type=secret,id=SYNAPSE_PASSWORD \
--mount=type=secret,id=SYNAPSE_TOKEN \
echo "GH_TOKEN=$(cat /run/secrets/GH_TOKEN)" >> "${HOME}/.Renviron" \
&& echo "SYNAPSE_ID=$(cat /run/secrets/SYNAPSE_ID)" >> "${HOME}/.Renviron" \
&& echo "SYNAPSE_PASSWORD=$(cat /run/secrets/SYNAPSE_PASSWORD)" >> "${HOME}/.Renviron" \
&& echo "SYNAPSE_TOKEN=$(cat /run/secrets/SYNAPSE_TOKEN)" >> "${HOME}/.Renviron" \
&& Rscript download_file.R
