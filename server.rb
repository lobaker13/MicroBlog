require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sqlite3'
configure :development, :test do
  set :database, {adapter:"sqlite3", database: "db/super.db" }
end
#models.rb needs a database, place after db is defined
enable :sessions
require './models'
require 'pp'

#To be accessed
before do
  @powers = Power.all
  @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
end

get '/' do
  @users = User.all
  @posts = Post.order( :id => :desc).limit(10)
  erb :home
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :user
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session[:user_id] = nil
  flash[:message] = "You signed out successfully"
  redirect '/'
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
    flash[:message] = "Post saved"
    redirect '/profile'
  else
    flash[:message] = "Error: Post not saved"
    redirect '/write'
  end
end

get'/post/:id/delete' do
  @post = Post.find(params[:id])
  if @post.user_id != @current_user.id
    redirect '/'
  elsif @post.destroy
    flash[:message] = "Post Deleted"
    redirect '/'
  else
    flash[:message] = "Could Not Delete"
  end
end

get '/profile' do

    unless @current_user
      flash[:message] = "Sign in to access your profile!"
      redirect '/login'
    end
      flash[:message] = "Welcome, #{@current_user.first_name}!"
      erb :profile
end

get '/:username' do
  @user = User.find_by(username:params[:username])
    erb :user
  end

get '/:id/destroy' do
  @user = User.find(params[:id])
  User.transaction do
    @user.posts.each{ |post| post.comments.destroy_all }
    @user.posts.destroy_all
    @user.comments.destroy_all
    @user.destroy
  end
  if User.where( id: @user.id).empty?
    flash[:message] = "Profile deleted"
    session[:user_id] = nil
    redirect '/'
  else
    flash[:message] = "Couldn't do it"
    redirect '/profile'
  end
end



 post '/signup' do
   @power = Power.find(params["power"])
   pp @power
  @user = User.new( first_name: params[:first_name],
      last_name:params[:last_name],
      email: params[:email],
      username: params[:n_username],
      password: params[:n_password],
      power_id: params[:power])


    if User.find_by( username: params[:n_username] )
      flash[:message] = "Username already taken"
      redirect '/signup'
      else
        @user.save
        redirect '/'
      end
  end


get '/post/:id' do
   @post = Post.find( params[:id] )
    erb :post
end

# Loading a new form for a comment
get '/post/:id/comment/new' do
  @post = Post.find(params[:id])
  erb :new_comment
end

# Adding a comment to a post?......
get '/post/:id/comment' do
  @post = Post.find(params[:id])
  if @post && Comment.create({
       body: params[:body],
       post_id: @post.id,
       user_id: @current_user.id})
       flash[:message] = "Thanks for adding your comment!"
       redirect "/post/#{@post.id}/comment"
  else
       flash[:message] = "We were unable to add your comment"
       redirect "/post/#{params[:id]}/comment/new"
  end
end
