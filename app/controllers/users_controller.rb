class UsersController < ApplicationController
 
  before_filter :init_user, :only => [:edit, :show, :update, :edit_password]
  before_filter :owner?, :only => [:edit, :show, :update, :edit_password]
  before_filter :only_for_admin, :only => [:index, :new, :create, :destroy]
  verify :method => :post, :only => :check_password

  # GET /users
  # GET /users.xml
  def index
    @users = User.order("id desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @notice = params[:notice]
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def edit_password
    @user = User.find(params[:id])    
    @notice = params[:notice]
  end

  def check_password
    old_pass = params[:old_pass]
    new_pass = params[:new_pass]
    conf_pass = params[:confirm_pass]
    user_id = params[:id]
    
    @user = User.find(user_id)

    if old_pass == @user.password && new_pass == conf_pass
          @user.password = new_pass
          @user.save          
          session[:user] = @user
          redirect_to :action => "edit", :id => user_id, :notice => "done"
    else
    @user.errors[:pass_change] = "Ошибка ввода данных. Попробуйте еще раз"
    session[:user] = @user
    params[:id] = user_id
    redirect_to :action => "edit_password", :id => user_id, :notice => "fail"
    end
  end

end
