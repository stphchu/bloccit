class SessionsController < ApplicationController

#NEW
  def new
  end

#CREATE
  def create
     user = User.find_by(email: params[:session][:email].downcase)

     if user && user.authenticate(params[:session][:password])
       create_session(user)
       flash[:notice] = "Welcome, #{user.name}!"
       redirect_to root_path
     else
       flash.now[:alert] = 'Invalid email/password combination'
       render :new
     end
  end
 
#DESTROY
  def destroy
     destroy_session(current_user)
     flash[:notice] = "You've been signed out, come back soon!"
     redirect_to root_path
  end
end
