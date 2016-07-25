require('pg')
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/brand')
require('./lib/store')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @stores = Store.all()
  erb(:index)
end

get('/stores/new') do
  @brands = Brand.all()
  erb(:store_form)
end

post('/stores') do
  name = params.fetch('name')
  brand_ids = params['brand_ids']
  @store = Store.create({:name => name, :brand_ids => brand_ids})
  @stores = Store.all()
  if @store.save()
    erb(:index)
  else
    erb(:errors)
  end
end

get("/:id") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store)
end

get("/stores/:id/edit") do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all()
  erb(:store_edit)
end

patch("/stores/:id/stores/:id") do
  name = params.fetch("name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:name => name})
  @stores = Store.all()
  erb(:index)
end

patch('/brands/:id/remove/:store_id') do
  id = params.fetch('id').to_i()
  brand = Brand.find(id)
  store_id = params.fetch('store_id')
  @store = Store.find(store_id)
  @store.brands.destroy(brand)
  redirect to("/stores/#{store_id}/edit")
end

patch('/brands/:id/add/:store_id') do
  id = params.fetch('id').to_i()
  brand = Brand.find(id)
  store_id = params.fetch('store_id')
  @store = Store.find(store_id)
  @store.brands.push(brand)
  redirect to("/stores/#{store_id}/edit")
end

delete("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @stores = Store.all()
  erb(:index)
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

get('/brands/new') do
   @stores = Store.all()
  erb(:brand_form)
end

post("/brands/new") do
  name = params.fetch("name")
  store_ids = params['store_ids']
  @brand = Brand.create({:name => name, :store_ids => store_ids})
  @stores = Store.all()
  if @brand.save()
    erb(:index)
  else
    erb(:error_brand)
  end
end
