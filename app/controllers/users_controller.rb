class UsersController < ApplicationController

    def new 
        @user=User.new
    end

    def create
        puts "==========================================="
        @user=User.new(user_params)
        puts "the user we get",@user
        if @user.save
            flash[:notice]="Welcome to the Alpha blog #{@user.username} , you have successfully singed Up"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end