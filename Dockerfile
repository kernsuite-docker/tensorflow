FROM kernsuite/base:4

RUN docker-apt-install nvidia-cuda-toolkit python3-pip nvidia-utils-390
RUN mkdir -p /packages/
ADD *.deb *.whl /packages/
RUN dpkg -i /packages/*.deb
RUN pip3 install --upgrade pip setuptools
RUN /usr/local/bin/pip install /packages/*.whl
#RUN rm -rf /packages/*
