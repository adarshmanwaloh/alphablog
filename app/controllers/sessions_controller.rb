class SessionsController < ApplicationController
    def new 
    end
    def create 
        # byebug
        user=User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash[:notice]="Login in sucessfully !!!1 "
            redirect_to user
        else
            flash.now[:alert]="There was someting wrong with you credentiales !!!1 "
            render 'new'
        end
    end

    def destroy 
        session[:user_id]=nil
        flash[:notice]="Logout in sucessfully !!!1 "

        redirect_to root_path

    end
            
end
