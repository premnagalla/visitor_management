require 'rqrcode'
class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all.reorder('created_at desc')
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    @visit.build_tenant_locker
  end

  # GET /visits/1/edit
  def edit
    @visit.tenant_locker || @visit.build_tenant_locker
  end

  def release_locker
    respond_to do |format|
      format.html { redirect_to visits_path, notice: 'Released successfully.' }
    end
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)
    # @locker = TenantLocker.new(user_id: current_user.id, locker_id: params[:locker_id], start_date: params[:start_date], end_date: params[:end_date])

    respond_to do |format|
      if @visit.save
        @visit.update_attribute(:passcode, rand.to_s[2..6])
        @user = User.create(first_name: @visit.first_name, last_name: @visit.last_name, email: @visit.email, contact_no: @visit.contact_no,
          role: "visitor")

        # @locker.save!
        locker = @visit.locker
        @visit.update_attribute(:visitor_id, @user.id)
        @qrcode = RQRCode::QRCode.new( 'http://localhost:3000/visits/' + "#{@visit.id}" )
        # send_sms_notifications(locker, @visit)
        email_notification(locker, @visit, @qrcode)
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def track_visitor
    @visitor = Visit.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:id, :tenant_id, :first_name, :last_name, :visitor_id, :email, :contact_no, :no_of_guests, :govt_id_type, :govt_id, :visit_time, :allow_more_or_less, tenant_locker_attributes: [:id, :locker_id, :start_date, :end_date])
    end

    def send_sms_notifications(tenant_locker, visit)
      user = User.where(id: visit.tenant_id) if visit.tenant_id.present?
      if user
        account_sid = 'ACf1664f6cc0bf40182c3769c4d9d5aa2d'
        auth_token = '62e537557e55ea2973d96c237c4bac6b'
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+15012930721' # Your Twilio number
        to = '+917207046355' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Hi #{visit.first_name}, please use #{visit.passcode} to unlock the locker."
        )
      end
    end

    def email_notification(tenant_locker, visit, qrcode)
      user = User.where(id: visit.tenant_id).first if visit.tenant_id.present?
      # visit = Visit.where(id: visit.id).first if visit.user_id.present?

      if user
        UserNotifierMailer.send_signup_email(user, visit, qrcode).deliver_now
      end
    end
end
