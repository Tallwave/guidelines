FROM jekyll/builder

WORKDIR /srv/jekyll

COPY ./docs /srv/jekyll

RUN wget http://github.com/pietromenna/jekyll-cayman-theme/archive/master.zip

RUN unzip jekyll-cayman-theme-master.zip

RUN cd jekyll-cayman-theme-master

RUN bundle install

EXPOSE 4000

CMD ["jekyll", "serve"]
