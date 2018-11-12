require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

get '/animals' do
  @animals = Animal.all()
  @specieses = Animal.all_species()
  erb ( :"animals/index" )
end

get '/animals/new' do
  erb(:"animals/new")
end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect to "/animals"
end

get '/animals/species/:species' do
  @animals = Animal.find_by_species(params['species'])
  @specieses = Animal.all_species()
  erb(:"animals/species")
end

get '/animals/available' do
  @animals = Animal.find_by_availability('available')
  erb(:"animals/available")
end

get '/animals/adopted' do
  @animals = Animal.find_by_availability('Adopted')
  erb(:"animals/adopted")
end

get '/animals/:id' do
  @animal = Animal.find_animal_by_id(params['id'])
  erb(:"/animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find_animal_by_id(params['id'])
  erb(:"/animals/edit")
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update()
  redirect to "/animals/#{params['id']}"
end

post '/animals/:id/delete' do
  animal = Animal.find_animal_by_id(params['id'])
  animal.delete()
  redirect to "/animals"
end
