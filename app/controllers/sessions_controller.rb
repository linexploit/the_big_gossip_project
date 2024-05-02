class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  user = User.find_by(email: email)
    if user && user.authenticate(:password_digest)
    session[:user_id] = user.id
    flash[:notice] = "Connexion réussie ! Bienvenue, #{user.username} !"
    redirect_to "/home"

  else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
end

def destroy
  session.delete(:user_id)
  flash[:notice] = "Vous avez été déconnecté avec succès !"
  redirect_to "/home"
end

end
