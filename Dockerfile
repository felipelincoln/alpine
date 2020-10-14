FROM elixir:1.10.4-alpine

RUN apk add git vim tree

WORKDIR /home

COPY .vimrc ~/

CMD ["/bin/sh"]
