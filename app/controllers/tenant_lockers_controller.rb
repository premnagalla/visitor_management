require 'twilio-ruby'
class TenantLockersController < ApplicationController

  before_action :set_tenant_locker, only: [:show, :edit, :update, :destroy]


  # GET /tenant_lockers
  # GET /tenant_lockers.json
  def index
    @tenant_lockers = TenantLocker.all
  end

  # GET /tenant_lockers/1
  # GET /tenant_lockers/1.json
  def show
  end

  # GET /tenant_lockers/new
  def new
    @tenant_locker = TenantLocker.new
  end

  # GET /tenant_lockers/1/edit
  def edit
  end

  # POST /tenant_lockers
  # POST /tenant_lockers.json
  def create
    @tenant_locker = TenantLocker.new(tenant_locker_params)

    respond_to do |format|
      if @tenant_locker.save

        format.html { redirect_to @tenant_locker, notice: 'Tenant locker was successfully created.' }
        format.json { render :show, status: :created, location: @tenant_locker }
      else
        format.html { render :new }
        format.json { render json: @tenant_locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenant_lockers/1
  # PATCH/PUT /tenant_lockers/1.json
  def update
    respond_to do |format|
      if @tenant_locker.update(tenant_locker_params)
        format.html { redirect_to @tenant_locker, notice: 'Tenant locker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant_locker }
      else
        format.html { render :edit }
        format.json { render json: @tenant_locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant_lockers/1
  # DELETE /tenant_lockers/1.json
  def destroy
    @tenant_locker.destroy
    respond_to do |format|
      format.html { redirect_to tenant_lockers_url, notice: 'Tenant locker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_locker
      @tenant_locker = TenantLocker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_locker_params
      params.require(:tenant_locker).permit(:user_id, :locker_id, :start_date, :end_date)
    end


end
