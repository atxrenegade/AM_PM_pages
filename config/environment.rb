require 'bundler'
Bundler.require

#ActiveRecord::Base.establish_connection(
#	adapter: "sqlite3",
#	database: "db/development.sqlite"

configure :development do
 set :database, 'sqlite:///dev.db'
 set :show_exceptions, true
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => 'ec2-54-243-46-32.compute-1.amazonaws.com',
   :username => 'jsdorqplpesxjo',
   :password => '258eed1016203d694274c17cafddd35d55f3056a8427e2c26b30a29fbe88d3c5',
   :database => dbcq1vvfaq8pv2,
   :encoding => 'utf8'
 )
end

require_all "app"
