class ServicesController < ApplicationController

    # GET /services | show all services
    def index
       render json: Service.all, status: :ok
    end

    # GET /services/# | get a service
    def show
       render json: find_service, status: :ok
     end

    # POST /services | create a service
    def create
       service = Service.new(service_params)

       if find_service.save
           render json: find_service, status: :created, location: find_service
       else
           render json: find_service.errors, status: :unprocessable_entity
       end
    end

    # PATCH /services/# | update a service
    def update
       if find_service.update(service_params)
           render json: find_service, status: :ok
       else
           render json: find_service.errors, status: :unprocessable_entity
       end
    end

    # DELETE /services/# | delete a service
    def destroy
       find_category.destroy!
       render json: {}
    end

    private

    def find_service
       Service.find(params[:id])
    end

    def service_params
       params.permit(:name, :service_type, :subscribed)
    end
end
