require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

get '/adoptions' do
  @adoptions = Adoption.all()
  erb ( :"adoptions/index" )
end

get '/adoptions/new' do
  erb(:"adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save()
  redirect to("/adoptions")
end

get '/adoptions/:id' do
  @adoption = Adoption.find_adoption_by_id(params['id'])
  erb(:"adoptions/show")
end

post '/adoptions/:id/delete' do
  adoption.delete()
  redirect to(:"/adoption")
end
