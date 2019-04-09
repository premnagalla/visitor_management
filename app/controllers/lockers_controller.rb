class LockersController < ApplicationController
  before_action :set_locker, only: [:show, :edit, :update, :destroy]

  # GET /lockers
  # GET /lockers.json
  def index
    @lockers = Locker.all
  end

  # GET /lockers/1
  # GET /lockers/1.json
  def show
  end

  # GET /lockers/1/edit
  def edit
  end

  # POST /lockers
  # POST /lockers.json
  def create
    @locker = Locker.new

    respond_to do |format|
      if @locker.save
        format.html { redirect_to lockers_path, notice: 'Locker was successfully created.' }
        format.json { render :show, status: :created, location: @locker }
      else
        format.html { render :new }
        format.json { render json: @locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lockers/1
  # PATCH/PUT /lockers/1.json
  def update
    respond_to do |format|
      if @locker.update(locker_params)
        format.html { redirect_to lockers_path, notice: 'Locker was successfully updated.' }
        format.json { render :show, status: :ok, location: @locker }
      else
        format.html { render :edit }
        format.json { render json: @locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lockers/1
  # DELETE /lockers/1.json
  def destroy
    @locker.destroy
    respond_to do |format|
      format.html { redirect_to lockers_url, notice: 'Locker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locker
      @locker = Locker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locker_params
      params.require(:locker).permit(:id, :status)
    end
end
