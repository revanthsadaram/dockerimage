FROM ubuntu:latest
MAINTAINER network6g@gmail.com
RUN apt-get update
RUN apt-get install inetutils-ping net-tools vim git -y
RUN mkdir /tmp/gitrepo
COPY index.html /tmp
COPY Dockerfile /tmp/gitrepo
ENV my_vol="myvol"
VOLUME ${my_vol}
WORKDIR /myvol
RUN echo "hello world" > 1.txt
RUN echo "hello2" > 2.txt
RUN echo "hello3" > 3.txt
WORKDIR /tmp/gitrepo
RUN git init
RUN git config --global user.email "network6g@gmail.com"
RUN git config --global user.name "revanthsadaram"
RUN git add Dockerfile
RUN git commit -m "commit from dockerfile"
RUN git remote add origin https://github.com/revanthsadaram/dockerimage.git
RUN git push https://revanthsadaram:'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'@github.com/revanthsadaram/dockerimage.git master
