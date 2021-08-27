## Requirements

Make sure you have installed:

* Ruby 3.0.2
* Postgresql 10 or latest
* Yarn

For Rails version and gems see Gemfile.

## Setup
1. Clone the Repo
2. bundle install
3. Update databse credentials in config/database.yml
4. bundle exec rails db:create
5. bundle exec rails db:migrate
6. Start Rails server `rails s`


### Running Test Cases

We are using Rspec for test cases.

`RAILS_ENV=test rake db:test:prepare`

`bundle exec rspec spec`# blogger_app
