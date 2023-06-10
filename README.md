## Sortear Times - Beta
#### Beta

---

### Examples - commands launched on terminal
---

Sinatra ActiveRecord Extension - [github/sinatra-activerecod](https://github.com/sinatra-activerecord/sinatra-activerecord)

- check rake tasks

```bash
bundle exec rake -T
```

- run migrations

```bash
bundle exec rake db:create

bundle exec rake db:create_migration NAME=create_players

bundle exec rake db:migrate
```

- rails console equivalent for Sinatra

```ruby
bundle exec irb -I. -r app.rb
require 'sinatra/activerecord'
require './app/model/player'
```