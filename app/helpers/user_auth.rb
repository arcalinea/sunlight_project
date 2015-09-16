helpers do 

	def auth_login(user)
		session[:user_id] = @user.id
		session[:user_name] = "#{@user.name}"
	end

	def auth_logout
		session[:user_id] = nil
		session[:user_name] = nil
	end

	def auth_current_user
		return nil unless session[:user_id]
		@current_user ||= User.find(session[:user_id])
	end

end