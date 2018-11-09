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
