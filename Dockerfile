FROM elixir:1.10.4-alpine

RUN apk add git vim tree

WORKDIR /home

RUN git clone https://github.com/elixir-editors/vim-elixir
RUN cd vim-elixir && sh vim-elixir/manual_install.sh
RUN rm -rf vim-elixir/

COPY .vimrc ~/

RUN alias log='git log --oneline --graph' \
    alias s='git status' \
    alias d='git diff'

CMD ["/bin/sh"]
