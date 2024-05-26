# frozen_string_literal: true

# set the database based on the current environment
configure :development do
  set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH', nil) }
end

configure :test do
  set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH_TEST', nil) }
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost:navebild@postgresql:5432/postgres')

  ActiveRecord::Base.establish_connection(
    adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host: db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..],
    encoding: 'utf8'
  )
end
