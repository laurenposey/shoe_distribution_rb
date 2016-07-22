require('pg')
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/brand')
require('./lib/store')
also_reload('lib/**/*.rb')

require('pry')

get('/') do
  @stores = Stores.all()
  erb(:index)
end

get('stores/new') do
  erb(:store_form)
end

post('/stores') do
  name = params.fetch('name')
  store = Store.create({:name => name, :id => nil})
  @stores = Store.all()
  erb(:index)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store)
end

get('/brands/new') do
  @stores = Store.all()
  erb(:brand_form)
end

post("/brands") do
  name = params.fetch("name")
  store_id = params.fetch("store_id").to_i()
  @store = Store.find(store_id)
  @brand = Brand.create({:name => name, :id => nil})
  @stores = Store.all()
  erb(:index)
end

patch("/stores/:id") do
  name = params.fetch("name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:name => name})
end

delete("/stores/:id/delete") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @stores = Store.all()
  erb(:index)
end
