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
EXPOSE 8081
WORKDIR /tmp/gitrepo
RUN git init
RUN git config --global user.email "network6g@gmail.com"
RUN git config --global user.name "revanthsadaram"
#RUN git branch dockerv1.6
RUN git add Dockerfile
RUN git commit -m "commit from dockerfile by creating dockerv1.6 branch"
RUN git checkout -b dockerv1.7 master
RUN git remote add origin https://github.com/revanthsadaram/dockerimage.git
RUN git push https://revanthsadaram:'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'@github.com/revanthsadaram/dockerimage.git dockerv1.7
