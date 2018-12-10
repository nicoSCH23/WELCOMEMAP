class ActivitySlotsController < ApplicationController
  before_action :set_activity_slot, only: [:show, :edit, :update, :destroy]

  # GET /activity_slots
  # GET /activity_slots.json
  def index
    @activity_slots = ActivitySlot.all
  end

  # GET /activity_slots/1
  # GET /activity_slots/1.json
  def show
  end

  # GET /activity_slots/new
  def new
    @activity_slot = ActivitySlot.new
  end

  # GET /activity_slots/1/edit
  def edit
  end

  # POST /activity_slots
  # POST /activity_slots.json
  def create
    @service = Service.find(params[:service_id])
    @activity_slot = ActivitySlot.new(activity_slot_params)
    @activity_slot.service = @service
    authorize @activity_slot
    if @activity_slot.save
      params[:activity_slot][:category_ids].delete("")
      if params[:activity_slot][:category_ids].any?
        create_categories(params[:activity_slot][:category_ids])
      end
      redirect_to service_path(@service)
    else
      render 'services/show'
    end
  end

  # PATCH/PUT /activity_slots/1
  # PATCH/PUT /activity_slots/1.json
  def update
    respond_to do |format|
      if @activity_slot.update(activity_slot_params)
        params[:activity_slot][:category_ids].delete("")
        if params[:activity_slot][:category_ids].any?
          create_categories(params[:activity_slot][:category_ids])
        end
        format.html { redirect_to services_path, notice: 'Activity slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_slot }
      else
        format.html { render :edit }
        format.json { render json: @activity_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_slots/1
  # DELETE /activity_slots/1.json
  def destroy
    @activity_slot.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Activity slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_slot
      @activity_slot = ActivitySlot.find(params[:id])
      authorize @activity_slot
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_slot_params
      params.require(:activity_slot).permit(:title, :opening_hours, :activities, :price, :appointment, :start_date, :end_date)
    end

    def create_categories(catids)
      @activity_slot.categories.destroy_all
      catids.each do |catid|
        activityCat = ActivityCategory.new
        activityCat.activity_slot = @activity_slot
        activityCat.category = Category.find(catid.to_i)
        activityCat.save!
      end
    end
end
