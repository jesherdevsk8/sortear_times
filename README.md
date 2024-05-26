## Sortear Times - Beta
#### Beta

---

### Examples - commands launched on terminal
---

Sinatra ActiveRecord Extension - [github/sinatra-activerecod](https://github.com/sinatra-activerecord/sinatra-activerecord)

- check rake tasks

```bash
bundle exec rake -T
bundle exec rake dev:add_goalkeeper
bundle exec rake dev:player
```

- run migrations

```bash
bundle exec rake db:create RACK_ENV=development

bundle exec rake db:create_migration NAME=create_players

bundle exec rake db:migrate RACK_ENV=development

RACK_ENV=development ruby app.rb
```

- run migrations to test rspec

```bash
export RACK_ENV=test
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake spec:all
bundle exec rspec ./spec/app/usecases/raffle/team_spec.rb
```

- rails console equivalent for Sinatra

```ruby
bundle exec irb -I. -r app.rb
require 'sinatra/activerecord'
require './app/model/player'
```

- to deploy sinatra app

```bash
bundle exec rake db:create RACK_ENV=production

bundle exec rake db:create_migration NAME=create_players

bundle exec rake db:migrate RACK_ENV=production

RACK_ENV=production ruby app.rb
```