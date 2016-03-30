FROM centos:6.6

# Install prerequisite
RUN yum update  -y
RUN yum install -y gcc
RUN yum install -y perl 
RUN yum install -y make
RUN yum install -y autoconf
RUN yum install -y automake
RUN yum install -y gcc-gfortran
RUN yum install -y compat-gcc-34-g77.x86_64
RUN yum install -y wget
RUN yum install -y tar
RUN yum install -y gcc-c++
RUN yum install -y readline-devel
RUN yum install -y libXt-devel
RUN yum install -y java-1.8.0-openjdk-devel
RUN yum install -y which
RUN yum install -y git
RUN yum install -y libcurl libcurl-devel
RUN yum install -y openssl-devel
RUN yum install -y libxml2-devel
RUN yum install -y libpng-devel
RUN yum install -y mesa-libGLU-devel.x86_64
# Install R-3.2.0
RUN wget http://cran.r-project.org/src/base/R-3/R-3.2.0.tar.gz; tar -zxvf R-3.2.0.tar.gz; cd R-3.2.0; ./configure; make; cp /R-3.2.0/bin/R /bin/; cp /R-3.2.0/bin/Rscript /bin/
