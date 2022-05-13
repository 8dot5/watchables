class ApplicationController < ActionController::API
    include ActionController::Cookies

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # test route:  http://localhost:3000/hello
    def hello_world
      session[:count] = (session[:count] || 0) + 1
      render json: { count: session[:count] }
    end

    # TODO refactor this later
    # def current_user
    #   User.find_by(id: session[:user_id])
    # end

    private
    def record_not_found_response
      render json: { errors: "Not found" }, status: :not_found
    end

    def unprocessable_entity_response(response)
      render json: { errors: response.record.errors.full_messages }, status: :unprocessable_entity
    end

end