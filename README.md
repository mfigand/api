# README

# API PROJECT

Api base project with JWT, Device, Pundit, JSONSchema and RSpec. All containerized an ready to be use with whatever api project.

## Install steps

From root:

Build the image
* ./run.sh build

Create the database (./run.sh db help)
* ./run.sh db create

Boot the app (./run.sh dev help)
* ./run.sh dev server

Run specs (./run.sh test help)
* ./run.sh test

Run lints
* ./run.sh lint

Run rubocop
* ./run.sh lint rubocop

Run reek
* ./run.sh lint reek

Things you may want to cover:

* Ruby version

* System dependencies
  - docker
  - docker-compose

