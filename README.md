# Folsom St Events Virtual Webapp

## Components

- Rails 6
- Bootstrap
- Travis-CI
- Capistrano
- Rspec
- Capybara
- Docker
- Docker-compose

## How to set up a development environment

In order to contribute code changes to this application, you first need to be able to run the application on your own computer. That way you can break whatever you want.

### Install Prerequisites

- Docker
- Docker-compose
- Git

### Clone the repository

`git clone https://github.com/NedHenry/FSE_virtual.git`

### Load the docker containers

`docker-compose up`

### Make sure the application loads

Navigate to "http://localhost:3000". You should see our welcome page.

### Run Tests

`docker exec fse_webapp bundle exec rspec spec`

### Load Repl

`docker exec fse_webapp RAILS_ENV=development bundle exec rails c`

## How to contribute

- Set up a development environment
- Pick an issue from our set of open issues (preferably one marked "Good First Issue")
- Create a new branch for your code changes
- Write tests that will only pass once your work is fully complete
- Make code changes until the tests pass
- Submit a pull request, requesting to merge your branch into the 'staging' branch
- Once this is approved, the changes will be automatically deployed to our staging server (assuming the test suite passes). We will then run any manual quality assurance checks we might want. We may make or request changes based on this.
- When the code changes are working properly on the staging server, the project administrators deploy the code changes by merging the staging branch into the master branch. The code is then automatically deployed to our production servers.

