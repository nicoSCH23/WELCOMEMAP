class ServicesController < ApplicationController
    before_action :set_service, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: :show

    def index
        @services = policy_scope(Service).order(created_at: :desc)
      end
    end

    def show
    end

    def new
      @service = Body.new
      authorize @service
    end

    def edit
    end

    def update
      @service.update(body_params)
      redirect_to dashboard_path
    end

    def create
      @service = Body.new(body_params)
      @service.user = current_user
      authorize @service
      if @service.save
        redirect_to dashboard_url
      else
        render :new
      end
    end

    def destroy
      @service.destroy
      redirect_to dashboard_path
    end

    private

    def body_params
      # je n'ai pas mis le user id car on devrait le recuperer ailleurs?
      params.require(:body).permit(:title, :price_per_day, :location, :sex, :description, :photo)
    end

    def set_body
      @service = Body.find(params[:id])
      authorize @service
    end
  end
end
