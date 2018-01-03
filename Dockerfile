FROM uolcz/ruby:latest

ENV APPDIR /app
RUN mkdir $APPDIR
WORKDIR $APPDIR

ENV BUNDLE_JOBS=2 \
    BUNDLE_PATH=/gems \
    # do GEM_PATHS se musí přidat cesta z gem_storu
    GEM_PATH=$GEM_PATH:/gems \
    PATH=$PATH:/gems/bin

ADD . .
