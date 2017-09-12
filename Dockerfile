FROM ubuntu:16.04
#! /bin/bash
RUN apt-get update && apt-get install -y --fix-missing git libuv1-dev libssl-dev gcc g++ cmake make git cppad
RUN git clone https://github.com/uWebSockets/uWebSockets 
WORKDIR uWebSockets
RUN git checkout e94b6e1
RUN mkdir build
WORKDIR build
RUN cmake .. && make && make install
WORKDIR /
RUN ln -s /usr/lib64/libuWS.so /usr/lib/libuWS.so
RUN rm -r uWebSockets
RUN apt-get install -y wget
RUN wget https://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.8.tgz && tar xvzf Ipopt-3.12.8.tgz
RUN apt-get install -y gfortran
COPY install_ipopt.sh /
RUN ls -ltrh /Ipopt-3.12.8
RUN /bin/bash install_ipopt.sh Ipopt-3.12.8
RUN /install_ipopt.sh
RUN apt-get install -y gdb
