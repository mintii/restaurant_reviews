get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'/restaurants/index'
end

get '/restaurants/new' do
  @cuisine = ["Chinese", "Mexican", "Italian", "Japanese", "Greek", "French", "Thai", "Spanish", "Indian", "Mediterranean"]

  erb :'restaurants/new'
end

post '/restaurants' do
  params[:restaurant][:user_id] = current_user.id
  p params
  @new_restaurant = Restaurant.new(params[:restaurant])

  if @new_restaurant.save
    redirect "/restaurants/#{@new_restaurant.id}"
  else
    @errors = @new_restaurant.errors.full_messages
    erb :'restaurants/new'
  end
end

get '/restaurants/:id/edit' do
  @cuisine = ["Chinese", "Mexican", "Italian", "Japanese", "Greek", "French", "Thai", "Spanish", "Indian", "Mediterranean"]
  @restaurant = Restaurant.find(params[:id])

  authenticate

  erb :'/restaurants/edit'
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @review = params[:review]
  erb :'restaurants/show'
end

put '/restaurants/:id' do
  @cuisine = ["Chinese", "Mexican", "Italian", "Japanese", "Greek", "French", "Thai", "Spanish", "Indian", "Mediterranean"]
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update_attributes(params[:restaurant])

  redirect "/restaurants/#{@restaurant.id}"
end

delete '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  authenticate
  @restaurant.destroy

  redirect '/'
end

















