require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

get '/adoptions' do
  @adoptions = Adoption.all()
  erb ( :"adoptions/index" )
end

get '/adoptions/new' do
  @animals = Animal.find_by_availability('available')
  @owners = Owner.all()
  erb(:"adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save()
  redirect to("/adoptions")
end

get '/adoptions/:id' do
  @adoption = Adoption.find_adoption_by_id(params['id'])
  # @owner = Owner.find_owner_by_id(params)
  # @animal = Animal.find_animal_by_id(params[@adoption.animal_id])
  erb(:"adoptions/show")
end

post '/adoptions/:id/delete' do
  adoption = Adoption.find_adoption_by_id(params['id'])
  adoption.delete()
  redirect to "/adoptions"
end
