FROM kernsuite/base:4

RUN docker-apt-install nvidia-cuda-toolkit python3-pip

RUN docker-apt-install nvidia-utils-390

RUN mkdir -p /packages/
ADD *.deb *.whl /packages/
RUN dpkg -i /packages/*.deb
RUN pip3 install /packages/*.whl
RUN rm -rf /tmp/*
