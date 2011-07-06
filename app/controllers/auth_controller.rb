class AuthController < ApplicationController
  verify :method => :post, :redirect_to => "/"
  def login
    user = User.where("login=? AND password=?", params[:login], params[:password]).first
    @auth = true;
    if user.nil? 
      @auth = false;
    else
      user.password = nil
      session[:user] = user
    end
  end

  def logout
    reset_session
  end

  def profile
  end

end
