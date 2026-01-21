class Api::V1::UsersController < Api::V1::ApiController
    before_action :set_user, only: %i[show update destroy]

    def index
        @users = policy_scope(User)
        render json: @users
    end

    def show
        authorize @user
        render json: @user
    end

    def create
        @user = User.new(user_params)
        authorize @user
        if @user.save
            render json: @user, status: :created, location: @user
        else
            render json: @user.errors, status: :unprocessable_content
        end
    end

    def update
        authorize @user

        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_content
        end
    end

    def destroy
        authorize @user
        @user.destroy!
        head :no_content
    end

    private 
        
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.expect(user: [:email, :password, :password_confirmation])
    end

end