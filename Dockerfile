RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:jonathonf/texlive-2016
RUN apt-get update

RUN apt-get -yq update && apt-get install -y python-pip wget librsvg2-bin

RUN wget https://github.com/jgm/pandoc/releases/download/2.1/pandoc-2.1-1-amd64.deb && \
    dpkg -i pandoc-2.1-1-amd64.deb && \
    wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.0.1/linux-ghc80-pandoc20.tar.gz -q -O - | tar xz && \
    mv pandoc-crossref /usr/bin/ && \
    pip install pandocfilters && \
    apt-get clean -y && \
    rm -rf pandoc-2.1-1-amd64.deb /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["--help"]
