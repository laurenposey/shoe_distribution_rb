require('pg')
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/brand')
require('./lib/store')
also_reload('lib/**/*.rb')

require('pry')

get('/') do
  erb(:index)
end
