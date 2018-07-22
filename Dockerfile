FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y qt5-default
RUN apt-get install make
RUN apt-get install build-essential g++ -y
RUN apt-get install cmake build-essential libboost-all-dev -y

RUN mkdir /app
WORKDIR /app

RUN git clone -b Linux https://github.com/nanopool/nheqminer.git
RUN cd nheqminer/cpu_xenoncat/Linux/asm/ && sh assemble.sh
#RUN cd nheqminer/nheqminer && mkdir build
WORKDIR /app/nheqminer/Linux_cmake/nheqminer_cpu

RUN cmake .
RUN make -j $(nproc)

#RUN qmake ../nheqminer/nheqminer.pro
