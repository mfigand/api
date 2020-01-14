# README

# API PROJECT

Api base project with JWT, Device, Pundit, JSONSchema and RSpec. All containerized an ready to be use with whatever api project.

## Install steps

From root:

Build the image
* docker-compose build

Create the database.
* docker-compose run web rake db:create

Boot the app
* docker-compose up

Run specs
(--rm tell Docker daemon that once its done running, erase everything related to it and save the disk space)
* docker-compose run --rm web rspec

Run rubocop
(--rm tell Docker daemon that once its done running, erase everything related to it and save the disk space)
* docker-compose run --rm web rubocop

Things you may want to cover:

* Ruby version

* System dependencies
  - docker
  - docker-compose

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

