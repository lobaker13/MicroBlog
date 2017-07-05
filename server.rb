require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
set :database, {adapter:"sqlite3", database: "db/super.db" }
#models.rb needs a database, place after db is defined
enable :sessions
require './models'

before do
    @powers = Power.all
    @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
  end

get '/' do
  @users = User.all
  @posts = Post.order( :id => :desc).limit(5)
  erb :home
 end

get '/user/:id' do
    @user = User.find_by(params[:id])
    erb :profile
  end

get '/login' do
  erb :login
end

get '/signup' do
  #@power = Power.find_by(id: params[:id])
  erb :signup
end

post '/login' do
 puts "my params are" + params.inspect
 @user = User.find_by(username: params[:username])
 if @user && @user.password == params[:password]
   session[:user_id] = @user.id
   redirect '/'
 else
    flash[:alert] = "That combination doesn't work, try again"
    redirect '/signup'
  end

end
