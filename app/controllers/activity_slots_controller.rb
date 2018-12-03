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
    @activity_slot = ActivitySlot.new(activity_slot_params)

    respond_to do |format|
      if @activity_slot.save
        format.html { redirect_to @activity_slot, notice: 'Activity slot was successfully created.' }
        format.json { render :show, status: :created, location: @activity_slot }
      else
        format.html { render :new }
        format.json { render json: @activity_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_slots/1
  # PATCH/PUT /activity_slots/1.json
  def update
    respond_to do |format|
      if @activity_slot.update(activity_slot_params)
        format.html { redirect_to @activity_slot, notice: 'Activity slot was successfully updated.' }
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
      format.html { redirect_to activity_slots_url, notice: 'Activity slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_slot
      @activity_slot = ActivitySlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_slot_params
      params.fetch(:activity_slot, {})
    end
end
