class UsersController < ApplicationController
    before_action :set_user,only: [:show,:edit,:update]

    def show
        @article=@user.articles.paginate(page: params[:page], per_page: 2)

    end
    def new 
        @user=User.new
    end
    def index
        # @users=User.all
        @users=User.paginate(page: params[:page], per_page: 2)

    end

    def create
        puts "==========================================="
        @user=User.new(user_params)
        puts "the user we get",@user
        if @user.save
            session[:user_id]=@user.id
            flash[:notice]="Welcome to the Alpha blog #{@user.username} , you have successfully singed Up"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    def edit
    end

    def update
        if@user.update(user_params)
            flash[:notice]="You account successfully updated "
            redirect_to @user
        else
            render 'edit'
        end
        
    end


    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    def set_user
         @user=User.find(params[:id])

    end
       

end