get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/'
  else
    erb :'users/new'
  end
end
