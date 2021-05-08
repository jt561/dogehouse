#!/bin/bash

docker-compose -f docker-compose.dbs.yml up -d
yarn install
cd shawarma
yarn install
yarn build
yarn start &
cd ../kebab
yarn build
cd ../kibbeh
yarn dev &
cd ../kousa
source .envrc
mix deps.get
mix ecto.migrate
iex -S mix