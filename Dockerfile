FROM jekyll/jekyll:latest

RUN apk update
RUN apk add --no-cache imagemagick

WORKDIR /srv/jekyll

ENV JEKYLL_ENV=production

CMD ["jekyll", "build"]
