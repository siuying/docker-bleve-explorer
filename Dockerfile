FROM golang:1.4.2
MAINTAINER Francis Chong <francis@ignition.hk>

RUN git clone https://github.com/blevesearch/bleve-explorer.git /bleve-explorer
ADD Gomfile /bleve-explorer/Gomfile
RUN cd /bleve-explorer \
  && go get github.com/mattn/gom \
  && gom install \
  && gom build

VOLUME ["/bleve-explorer/data"]

EXPOSE 8095

CMD ["/bleve-explorer/bleve-explorer"]