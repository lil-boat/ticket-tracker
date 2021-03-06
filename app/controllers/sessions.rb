get '/sessions/new' do
  if request.xhr?
    erb :'sessions/new', layout: false
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  @user = User.find_by(username: params["username"])

  if @user && @user.password == params["password"]
    login(@user)
    redirect '/'
  else
    @errors = ["Invalid username or password."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout
  redirect '/'
end
