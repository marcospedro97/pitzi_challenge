# README

This project was made from the Pitzi code challenge, and I've also used the exercise to test a archtectural model that could make a project more health in the long term, I've used CQRS as a base, also a few characteristics of a domain driven design, wich can not be the best, but as far as I can see it would solve a lot of trouble that I've run into on my time as rails dev

* Ruby version: 3.0.1

* Configuration: bin/setup should be enough

* Database creation
  - this project uses postgres, please set the vars DB_USERNAME, DB_PASSWORD and DB_HOST

* How to run the test suite: bundle exec rspec


## Changes in a V2
* Better tests suite
- this project relies highly on integration tests, a better tests suite should have more
unit tests

* Remove uses of OpenStruct
- this use of OpenStruct is not ideal, it reaches the goal of not letting ActiveRecord instances leak, wich is necessary to have a good repository pattern implementation, but it's not great, since some of the attributes still being a hash or it makes quite a smell in the overall codebase as the project grows

* Have a frontend
- It would take too long to do it right now, my fault
