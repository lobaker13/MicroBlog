require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

set :database, {adapter:"sqlite3", database: "db/hero.db" }
#models.rb needs a database, place after db is defined
require './models'
