FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get -y install \
  build-essential \
  git \
  python \
  python-apt \
  python-pip \
  vim

RUN pip install --upgrade pip
RUN pip install "ansible>=2.0,<3.0"

WORKDIR /sheepdoge-test

ADD defaults ./defaults
ADD files ./files
ADD handlers ./handlers
ADD tasks ./tasks
ADD vars ./vars
ADD tests/* ./

RUN groupadd -g 999 pup-test && \
    useradd --create-home -r -u 999 -g pup-test pup-test
RUN chown -R pup-test:pup-test .

USER pup-test

CMD ./test.sh
