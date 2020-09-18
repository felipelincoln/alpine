FROM elixir:1.10.4-alpine

RUN apk add git vim tree

WORKDIR /home

RUN git clone https://github.com/elixir-editors/vim-elixir
RUN cd vim-elixir && sh manual_install.sh

RUN git clone https://github.com/felipelincoln/alpine
RUN mv alpine/.vimrc ~/

RUN rm -rf alpine/ vim-elixir/

CMD ["/bin/sh"]
