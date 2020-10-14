FROM elixir:1.10.4-alpine

RUN apk add git vim tree

WORKDIR /home

RUN git clone https://github.com/elixir-editors/vim-elixir
RUN cd vim-elixir && sh manual_install.sh
RUN rm -rf vim-elixir/

COPY .vimrc ~/

CMD ["/bin/sh"]
