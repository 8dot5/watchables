class SessionsController < ApplicationController

    # POST /login | logs in the user
    def create
        user = User.find_by(username: params[:username])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: { errors: 'Invalid username or password' }, status: :unauthorized
        end
    end

    # DELETE /logout | logs out the user
    def destroy
        if session[:user_id]
            session.delete :user_id
            render json: {}
        else
            render json: { errors: 'You are not logged in' }, status: :unauthorized
        end
    end

end
