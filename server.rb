require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
set :database, {adapter:"sqlite3", database: "db/super.db" }
#models.rb needs a database, place after db is defined
enable :sessions
require './models'

get '/' do
  @users = User.all
  erb :home
end

get '/layout' do
  erb :layout
end

get '/user/:id' do
    @user = User.find(params[:id])
    erb :profile
  end

get '/login' do
  erb :login
end

post '/login' do
 puts "my params are" + params.inspect
 @user = User.find_by(username: params[:username])
 if @user && @user.password == params[:password]
   session[:user_id] = @user.id
   redirect '/'
 else
    flash[:alert] = "That combination doesn't work, try again"
    redirect '/login'
  end

end
