require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

get '/animals/new' do
  erb(:"animals/new")
end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect to("/animals")
end

get '/animals/:id' do
  erb(:"/animals/show")
end

get '/animals/:id/edit' do
  erb(:"/animals/edit")
end

post '/animals/:id' do
  animal = animal.update()
  redirect to("/animals/show")
end

post '/animals/:id/delete' do
  animal.delete()
  redirect to(:"/animals")
end
