# R_biocLite_dockefile
This is an attempt to package a docker container with all the R library to run genomic pipeline such as the [methylation pipeline](https://github.com/GreenwoodLab/methylation450KPipeline)

To build the container
`docker build -t name_of_your_container .`

To get inside the container:
`docker run -it nbeck/450k_base /bin/bash`

To run R inside the container:
`R`

My idea is to complete the Dockerfile with something like:
`RUN git clone https://github.com/natacha-beck/biocLite_install.git`

Then install the package by using this file:
`biocLite_install/biocLite_install.R`

I'm not so sure about how to do it.