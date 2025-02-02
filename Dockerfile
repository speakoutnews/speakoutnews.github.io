FROM jekyll/jekyll:latest

RUN apk update
RUN apk add --no-cache imagemagick

WORKDIR /srv/jekyll

CMD ["jekyll", "build"]
