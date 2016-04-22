FROM centos:6.6

# Install prerequisite
RUN yum update  -y

# Install basic packages
RUN yum install -y gcc \
                   perl \
                   make \
                   autoconf \
                   automake \
                   gcc-gfortran \
                   compat-gcc-34-g77.x86_64 \
                   wget \
                   tar \
                   gcc-c++ \
                   readline-devel \
                   libXt-devel \
                   java-1.8.0-openjdk-devel \
                   which \
                   git \
                   libcurl libcurl-devel \
                   openssl-devel \
                   libxml2-devel \
                   libpng-devel \
                   mesa-libGLU-devel.x86_64 \
                   texlive-latex \
                   pango \
                   pango-devel \
		   libX11-devel \
                   libxt-dev

RUN yum -y groupinstall "X Window System" "Desktop" "Fonts" "General Purpose Desktop"

# Install rstudio
RUN wget https://download2.rstudio.org/rstudio-server-rhel-0.99.896-x86_64.rpm
RUN yum install -y --nogpgcheck rstudio-server-rhel-0.99.896-x86_64.rpm

RUN ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc /usr/local/bin
RUN ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc-citeproc /usr/local/bin

# Install R-3.2.0
RUN wget http://cran.r-project.org/src/base/R-3/R-3.2.0.tar.gz; tar -zxvf R-3.2.0.tar.gz; cd R-3.2.0; ./configure; make; cp /R-3.2.0/bin/R /bin/; cp /R-3.2.0/bin/Rscript /bin/

# Install all biocLite R packages
RUN echo 'source("http://bioconductor.org/biocLite.R"); biocLite(ask=FALSE); biocLite(c("minfi","minfiData","wateRmelon","shinyMethyl","shinyMethylData"), ask=FALSE)' > /tmp/packages_bioc.R
RUN Rscript /tmp/packages_bioc.R

# Install all other R packages
RUN echo 'install.packages(c("httpuv", "devtools", "matrixStats", "RColorBrewer", "shiny", "rmarkdown", "knitr", "DT"), repos= "http://cran.us.r-project.org")' > /tmp/packages.R
RUN Rscript /tmp/packages.R

