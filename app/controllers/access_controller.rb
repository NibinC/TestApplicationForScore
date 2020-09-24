class AccessController < ApplicationController
  	before_action :confirm_logged_in, :except=>[:login,:attempt_login,:logout]	
  def menu
  end

  def login
  end

  def attempt_login
  	puts params[:username]
  	if(params[:username].present? && params[:password].present?)
  		found_user = User.where(:username=>params[:username]).first
  		if found_user
		 autherized_user = found_user.authenticate(params[:password])
		end
	end
	 if autherized_user
	    session[:user_id]= autherized_user.id
	 	session[:username] = autherized_user.first_name.to_s+" "+autherized_user.last_name.to_s
	 	logger.info("*** User #{session[:username]} Logged in ****") 
	  	flash[:notice]="You are now logged in. "
	  	redirect_to(user_path)
	  else
	  	flash.now[:notice]="Invalid Username/Password"
	  	render('login')
	  end	
  end

  def logout
  		logger.info("*** User #{session[:username]} Logged out ****")
  		session[:user_id]=nil
  		session[:username]=nil
  		flash[:notice]='Logged out'
  		redirect_to(access_login_path)
  end

end
