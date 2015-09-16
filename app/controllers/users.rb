get '/login' do 
	erb :'users/login'
end

# Store user ID in session?
post '/login' do 
	@user = User.find_by_email(params[:email])
	if @user.hashed_password = params[:password]
		auth_login(@user)
		auth_current_user
		redirect "/profile"
	else
		@error = "Login failed"
		erb :'/users/login'
	end
end

get '/logout' do 
	session[:user_id] = nil
  redirect '/'
end

get '/profile' do 
	auth_current_user
	erb :'/users/profile'
end

get '/register' do 
	erb :'/users/register'
end

post '/register' do 
	@user = User.new(params[:user])
		if @user.save
			auth_current_user
	    session[:user_id] = @user.id
	    session[:name] = @user.name
	    redirect '/profile'
	  else
	    @form_error = 'Unable to Register'
	    erb :'users/register'
	  end
end
