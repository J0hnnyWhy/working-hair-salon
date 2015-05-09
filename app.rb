require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/clients')
require('./lib/stylists')
require('pg')
require('pry')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylists.all()
  erb(:stylists)
end

get('/stylists/new') do
  erb(:stylist_form)
end

get('/stylists/:id') do
 @stylist = Stylists.find(params.fetch("id").to_i())
 erb(:stylist)
end

post('/stylists') do
  name = params.fetch("stylist")
  new_stylist = Stylists.new({:stylist => name, :id => nil})
  new_stylist.save()
  erb(:success)
end

get('/stylists/:id/client/new') do
  @stylist = Stylists.find(params.fetch("id").to_i())
  erb(:client_form)
end

post('/client') do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylists.find(stylist_id)
  @client = Clients.new(:name => name, :stylist_id => stylist_id)
  @client.save()
  erb(:success)
end