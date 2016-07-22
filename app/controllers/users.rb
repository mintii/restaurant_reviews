get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @new_user = User.new(params[:user])

  if @new_user.save
    session[:user_id] = @new_user.id
    redirect "/"
  else
    @errors = @new_user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @user_reviews = @user.reviews

  @user_restaurants = @user.restaurants
  erb :'users/show'
end
