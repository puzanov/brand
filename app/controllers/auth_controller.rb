class AuthController < ApplicationController
  def login
    user = User.where("login=? AND password=?", params[:login], params[:password]).first
    @auth = true;
    if user.nil? 
      @auth = false;
    end  
  end

  def logout
  end

  def profile
  end

end
