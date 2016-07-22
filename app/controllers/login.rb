get '/login' do
  erb :'login/login'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Email address required", "Password required"]
    erb :'login/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
