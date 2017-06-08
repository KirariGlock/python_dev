FROM centos:latest

MAINTAINER KirariGlock

RUN yum -y update

RUN yum -y install gcc \
                zlib-devel \
                bzip2 \
                bzip2-devel \
                readline \
                readline-devel \
                sqlite \
                sqlite-devel \
                openssl \
                openssl-devel \
                git


RUN yum -y install git bzip2 && \
                   git clone https://github.com/yyuu/pyenv.git ~/.pyenv

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
RUN eval "$(pyenv init -)"

RUN pyenv install 3.6.1

RUN pyenv global 3.6.1
RUN pyenv rehash

CMD ["python","--version"]
