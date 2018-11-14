require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  owner = Owner.new(params)
  owner.save()
  redirect to("/owners")
end

get '/owners/:id' do
  @owner = Owner.find_owner_by_id(params['id'])
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @owner = Owner.find_owner_by_id(params['id'])
  erb(:"/owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update()
  redirect to "/owners/#{params['id']}"
end

post '/owners/:id/delete' do
  owner = Owner.find_owner_by_id(params['id'])

  animals = owner.adopted_animals()
  for animal in animals
    animal.availability = "Available"
  end
  binding.pry
  owner.delete()
  redirect to "/owners"
end
