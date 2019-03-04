FROM elixir:1.8.0-slim

RUN apt-get update -yqq &&  apt-get install -yqq --no-install-recommends \
  git

RUN mix local.hex --force
RUN mix local.rebar --force

COPY config /usr/src/app/
COPY mix.exs /usr/src/app/

WORKDIR /usr/src/app

RUN mix deps.get
RUN mix
COPY . /usr/src/app/

CMD ["mix", "test"]
