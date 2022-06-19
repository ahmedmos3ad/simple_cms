class UsersController < ApplicationController

  before_action :authorize , only:[:show,:update,:destroy]

  def index
    @users= User.all.order(:id)
    render json:serialize_collection("User",@users, {id: true})
  end
    
  def create
  begin
    @user= User.new(user_params)
    if @user.save!
      token=encode_token({user_id:@user.id})
      render json:serialize_record(User,@user,{token: token}), status: :created
    end
    rescue =>e
      render json:e.message, status: :unprocessable_entity
    end
  end

  def show
    puts @decoded
    render json:serialize_record("User",@user,{email: @decoded}), status: :ok
  end
    
  def login
    @user= User.find_by(username:user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      token=encode_token({user_id:@user.id})
      render json:serialize_record("User",@user,{token: token, id: true}), status: :ok
    else
    render json:"Invalid Username or Password", status: :unauthorized
    end
  end

  def update
    begin
      @user.assign_attributes(user_params)
      @user.save!
      render json:serialize_record("User",@user,{email: true}), status: :ok
    rescue => e
      render json: !params[:localize]=="en" ? e.message : I18n.t(e.message), status:422
    end
  end
    
  def destroy
    begin
      @user.destroy!
      render json:"User with ID #{@user.id} has been deleted.", status: :ok
    rescue => e
      render json:e.message, status:422
    end
  end
    
  private 

  def user_params
    params.require(:user).permit(:username,:password,:password_confirmation,:email,:localize)
  end
end
