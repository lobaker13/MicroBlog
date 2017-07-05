require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
set :database, {adapter:"sqlite3", database: "db/super.db" }
#models.rb needs a database, place after db is defined
enable :sessions
require './models'

#To be accessed
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

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

post '/login' do
 puts "my params are" + params.inspect
 @user = User.find_by(username: params[:username])
 if @user && @user.password == params[:password]
   session[:user_id] = @user.id
   flash[:message] = "Welcome, #{@user.first_name}!"
    redirect '/profile'
 else
    flash[:message] = "Not a member? Sign up here!"
    redirect '/signup'
  end
end

get '/write' do
  erb :author
end

post '/write' do
  @post = Post.new( title: params[:title],
            body: params[:body],
            user_id: @current_user.id )
  if @post.save
    flash[:message] = "Got your post!  Nice work!"
    redirect '/profile'
  else
    flash[:message] = "Unable to save your post :'("
    redirect '/write'
  end
end

get '/profile' do
    erb :profile
end

get '/logout' do
  erb :logout
end

 post '/signup' do
  if params[:power] == nil
    flash[:message] = "Super Power required to make account"
  elsif User.find_by( username: params[:n_username] )
    flash[:message] = "Username already taken"
    redirect '/signup'
  else
    redirect '/'
   end
  end
