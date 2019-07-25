FROM ruby:2.5.1

RUN apt-get update && apt-get install -y nodejs nano openssl zip unzip git wget curl git-ftp

RUN cd /tmp && git clone https://github.com/git-ftp/git-ftp.git && cd git-ftp \
    && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
    && git checkout "$tag" \
    && mv git-ftp /usr/local/bin && chmod +x /usr/local/bin

RUN gem install bundler

WORKDIR /usr/src/app

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* /var/tmp/*

CMD ["bash"]