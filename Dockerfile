FROM hypriot/rpi-golang:1.4.2
MAINTAINER Francis Chong <francis@ignition.hk>

ADD build /build
RUN chmod +x /build
RUN mkdir /bleve-explorer
RUN mkdir /bleve-explorer/data

RUN git clone https://github.com/blevesearch/bleve-explorer.git /tmp/bleve-explorer \
  && cd /tmp/bleve-explorer \
  && /build \
  && mv /tmp/bleve-explorer/bleve-explorer /bleve-explorer/bleve-explorer \
  && mv /tmp/bleve-explorer/static /bleve-explorer/static \
  && rm -rf /tmp/bleve-explorer

VOLUME ["/bleve-explorer/data"]
WORKDIR "/bleve-explorer"

EXPOSE 8095

CMD ["/bleve-explorer/bleve-explorer"]