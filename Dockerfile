FROM ubuntu:16.04

RUN apt update; apt upgrade -y; apt install python3 python3-pip python3-numpy wget -y
RUN pip3 install -U pip
RUN pip3 install -U tensorflow-gpu

RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn6_6.0.21-1%2Bcuda8.0_amd64.deb
RUN wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn6-dev_6.0.21-1%2Bcuda8.0_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN dpkg -i libcudnn6_6.0.21-1+cuda8.0_amd64.deb
RUN dpkg -i libcudnn6-dev_6.0.21-1+cuda8.0_amd64.deb
RUN apt update
RUN apt install cuda=8.0.61-1 -y
RUN apt install libcudnn6-dev -y

RUN export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
RUN export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
