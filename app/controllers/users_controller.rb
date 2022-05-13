class UsersController < ApplicationController
  wrap_parameters :user, include: [:email, :username, :password, :password_confirmation]

  # GET /users | show all users
  def index
    render json: User.all, status: :ok
  end

  # GET /me | get current user
  def show
    user = User.find_by(id: session[:user_id])

    if user
        render json: user, include: [:watchables, :categories]
    else
        render json: { errors: 'Not authorized' }, status: :unauthorized
    end
  end

  # POST /users | create new users
  def create
    user = User.create!(user_params)

    if user
      session[:user_id] = user.id
      render json: user, include: ['watchables'], status: :created
    else
      render json: { errors: 'Not authorized' }, status: :unauthorized
    end
  end

  # PATCH /users/# | update a user
  def update
    user = User.find_by(id: session[:user_id])
    if user
      user.update(user_params)
      render json: find_user, status: :ok
    else
      render json: find_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/# | delete a user
  def destroy
    find_user.destroy!
    render json: {}, status: :gone
  end

  private

    def find_user
      User.find(params[:id])
    end

    # def new_user
    #   User.create!(user_params)
    # end

    # def current_user
    #   User.find_by(id: session[:user_id])
    # end

    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end
end
