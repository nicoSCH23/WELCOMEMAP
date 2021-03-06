class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @activity_slot = ActivitySlot.new
  end

  # GET /services/new
  def new
    @categories = Category.all
    @service = Service.new
    authorize @service
    @service.activity_slots.build
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.user = current_user
    authorize @service
    respond_to do |format|
      if @service.save
        params[:service][:activity_slots_attributes]["0"][:category_ids].delete("")
        if params[:service][:activity_slots_attributes]["0"][:category_ids].any?
          binding.pry
          create_categories(params[:service][:activity_slots_attributes]["0"][:category_ids], params[:service][:activity_slots_attributes]["0"])
        end
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        Rails.logger.info(@service.errors.inspect)
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
      authorize @service
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :address, :phone, :comment, :mail, :link, :ngo_id, activity_slots_attributes: [:id, :title, :opening_hours, :activities, :price, :appointment, :start_date, :end_date])
    end

    def create_categories(catids, activity_slot)
      catids.each do |catid|
        activityCat = ActivityCategory.new
        activityCat.activity_slot = @service.activity_slots[0]
        activityCat.category = Category.find(catid.to_i)
        activityCat.save!
      end
    end
end
