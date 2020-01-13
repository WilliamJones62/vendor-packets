class PacketsController < ApplicationController
  before_action :set_packet, only: [:show, :edit, :update, :destroy]

  # GET /packets
  def index
    if current_user7.admin?
      @packets = Packet.all
    else
      @packets = Packet.where("user_id = ?", current_user7.id)
    end
    respond_to do |format|
      format.html
      format.csv { send_data @packets.to_csv }
    end
  end

  # GET /packets/1
  def show
  end

  # GET /packets/new
  def new
    @packet = Packet.new
  end

  # GET /packets/1/edit
  def edit
    if !current_user7.admin?
      @packet = Packet.where("user_id = ?", current_user7.id).last
      if @packet.completed
        redirect_to @packet, notice: 'Packet is now read only.'
      end
    end
  end

  # POST /packets
  def create
    @packet = Packet.new(packet_params)
    @packet.user_id = current_user7.id
    respond_to do |format|
      if @packet.save
        format.html { redirect_to @packet, notice: 'Packet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /packets/1
  def update
    respond_to do |format|
      if @packet.update(packet_params)
        format.html { redirect_to @packet, notice: 'Packet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /packets/1
  def destroy
    @packet.destroy
    respond_to do |format|
      format.html { redirect_to packets_url, notice: 'Packet was successfully destroyed.' }
    end
  end

  def import
    Packet.import(params[:file])
    redirect_to root_url, notice: "Packets imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packet
      @packet = Packet.find(params[:id])
      unless current_user7.id == @packet.user_id || current_user7.admin?
       redirect_to root_path, :alert => "Access denied."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def packet_params
      params.require(:packet).permit(:user_id, :packet_number, :vendor_number, :requested_date, :due_date, :completed, :company_name, :company_type, :dba, :address_1, :address_2, :city, :zip, :state, :cntry_code, :ship_address_1, :ship_address_2, :ship_city, :ship_zip, :ship_state, :primary_contact, :phone_1, :phone_2, :email, :fax, :website, :qa_name, :qa_phone_1, :qa_phone_1_ext, :qa_phone_2, :qa_email, :ops_name, :ops_phone_1, :ops_phone_1_ext, :ops_phone_2, :ops_email, :notes,  :usda_establishment_name_1, :usda_establishment_number_1, :mock_recall_sop_1, :mock_recall_date_1, :recall_this_year_1, :recall_1, :bone_foreign_1, :complaint_1, :problems_1, :haccp_1_certificate, :haccp_1_type, :haccp_1_company, :haccp_1_score, :haccp_1_expires, :haccp_1_scheduled, :usda_establishment_name_2, :usda_establishment_number_2, :mock_recall_sop_2, :mock_recall_date_2, :recall_this_year_2, :recall_2, :bone_foreign_2, :complaint_2, :problems_2, :haccp_2_certificate, :haccp_2_type, :haccp_2_company, :haccp_2_score, :haccp_2_expires, :haccp_2_scheduled, :usda_establishment_name_3, :usda_establishment_number_3, :mock_recall_sop_3, :mock_recall_date_3, :recall_this_year_3, :recall_3, :bone_foreign_3, :complaint_3, :problems_3, :haccp_3_certificate, :haccp_3_type, :haccp_3_company, :haccp_3_score, :haccp_3_expires, :haccp_3_scheduled, :non_disclosure, :w9, :guarantee, :liability, :additional_string_1, :additional_string_2, :additional_string_3, :additional_string_4, :additional_string_5, :additional_integer_1, :additional_integer_2, :additional_integer_3, :additional_integer_4, :additional_integer_5)
    end
end
