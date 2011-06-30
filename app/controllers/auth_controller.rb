class AuthController < ApplicationController
  def login
    user = User.where("login=? AND password=?", params[:login], params[:password]).first
    logger.info user
    if user.nil? 
      logger.info "not auth"
    end  
  end

  def logout
  end

  def profile
  end

end
