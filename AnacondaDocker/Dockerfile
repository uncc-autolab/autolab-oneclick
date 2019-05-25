# Autolab - autograding docker image

FROM continuumio/anaconda3:5.2.0
MAINTAINER Archit Parnami

RUN apt-get update --fix-missing
RUN apt-get -y install sudo
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y build-essential
RUN apt-get -y install libgl1-mesa-glx
RUN apt-get -y install procps
RUN apt-get -y install vim

WORKDIR /app
ADD requirements.txt /app
ADD Test /app
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Install autodriver
WORKDIR /home
RUN useradd autolab
RUN useradd autograde
RUN mkdir autolab autograde output
ADD bashrc /home/autolab
RUN mv /home/autolab/bashrc /home/autolab/.bashrc
RUN chown autolab:autolab autolab
RUN chown autolab:autolab output
RUN chown autograde:autograde autograde
RUN apt-get install -y git
RUN git clone https://github.com/autolab/Tango.git
WORKDIR Tango/autodriver
RUN make clean && make
RUN cp autodriver /usr/bin/autodriver
RUN chmod +s /usr/bin/autodriver

# Clean up
WORKDIR /home
RUN apt-get remove -y git
RUN apt-get -y autoremove
RUN rm -rf Tango/

# Check installation
RUN ls -l /home
RUN which autodriver
