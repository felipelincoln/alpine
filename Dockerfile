FROM elixir:1.10.4-alpine

RUN apk add git vim tree

WORKDIR /home

RUN git clone https://github.com/elixir-editors/vim-elixir
RUN sh vim-elixir/manual_install.sh && rm -rf vim-elixir/

COPY .vimrc ~/

RUN alias log='git log --oneline --graph' \
    alias s='git status' \
    alias d='git diff' \

CMD ["/bin/sh"]
