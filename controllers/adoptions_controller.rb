require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )
require('pry')

get '/adoptions' do
  @adoptions = Adoption.all()
  erb ( :"adoptions/index" )
end

get '/adoptions/new' do
  @animals = Animal.find_by_availability('Available')
  @owners = Owner.all()
  erb(:"adoptions/new")
end

post '/adoptions' do

  adoption = Adoption.new(params)
  adoption.save()
  animal = Animal.find_animal_by_id(adoption.animal_id)
  animal.availability = "Adopted"
  animal.update()

  redirect to("/adoptions")
end

get '/adoptions/:id' do
  @adoption = Adoption.find_adoption_by_id(params['id'])
  erb(:"adoptions/show")
end

post '/adoptions/:id/delete' do
  adoption = Adoption.find_adoption_by_id(params['id'])
  animal = Animal.find_animal_by_id(adoption.animal_id)
  animal.availability = "Available"
  animal.update
  adoption.delete()

  redirect to "/adoptions"
end
