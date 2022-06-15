class UsersController < ApplicationController

    def create
        @user= User.new(user_params)
        #begin
            if @user.valid?
                token=encode_token({user_id:@user.id})
                #render json:serialize_record("User",@user,params:{token: token}), status: :created
                render json:UserSerializer.new(@user, params:{token: token}).serializable_hash, status: :created
            end
        #rescue =>e
        #render json:e.message, status: :unprocessable_entity
        #end
    end
    
    private 

    def user_params
     params.require(:user).permit(:username,:password,:password_confirmation)
    end
end
