class ProductsController < ApplicationController
  before_action :load_packet
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = @packet.products.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = @packet.products.new
    @products = @packet.products.all
  end

  # GET /products/1/edit
  def edit
    @products = @packet.products.all
  end

  # POST /products
  def create
    @product = @packet.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to [@packet, @product], notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    @products = @packet.products.all
    if params[:product][:additional_string_1].present?
      # The user wants to copy another product's data
      @from = Product.where(product_code: params[:product][:additional_string_1], packet_id: @product.packet_id).first
      params[:product][:species] = @from.species
      params[:product][:box] = @from.box
      params[:product][:box_type] = @from.box_type
      params[:product][:box_details] = @from.box_details
      params[:product][:box_units] = @from.box_units
      params[:product][:box_length] = @from.box_length
      params[:product][:box_width] = @from.box_width
      params[:product][:box_height] = @from.box_height
      params[:product][:box_count] = @from.box_count
      params[:product][:piece_box] = @from.piece_box
      params[:product][:piece_pack] = @from.piece_pack
      params[:product][:piece_count] = @from.piece_count
      params[:product][:package_photo] = @from.package_photo
      params[:product][:label] = @from.label
      params[:product][:label_type] = @from.label_type
      params[:product][:label_details] = @from.label_details
      params[:product][:safe] = @from.safe
      params[:product][:weight_units] = @from.weight_units
      params[:product][:weight_max] = @from.weight_max
      params[:product][:weight_min] = @from.weight_min
      params[:product][:product_photo] = @from.product_photo
      params[:product][:bug] = @from.bug
      params[:product][:production_date] = @from.production_date
      params[:product][:pallet_layers] = @from.pallet_layers
      params[:product][:pallet_count_per_layer] = @from.pallet_count_per_layer
      params[:product][:pallet_length] = @from.pallet_length
      params[:product][:pallet_height] = @from.pallet_height
      params[:product][:pallet_width] = @from.pallet_width
      params[:product][:never] = @from.never
      params[:product][:never_doc] = @from.never_doc
      params[:product][:withdrawal] = @from.withdrawal
      params[:product][:withdrawal_doc] = @from.withdrawal_doc
      params[:product][:withdrawal_days] = @from.withdrawal_days
      params[:product][:gmo_free] = @from.gmo_free
      params[:product][:gmo_free_doc] = @from.gmo_free_doc
      params[:product][:organic] = @from.organic
      params[:product][:organic_doc] = @from.organic_doc
      params[:product][:vaccinated] = @from.vaccinated
      params[:product][:vaccinated_age] = @from.vaccinated_age
      params[:product][:vaccinated_doc] = @from.vaccinated_doc
      params[:product][:humane] = @from.humane
      params[:product][:humane_doc] = @from.humane_doc
      params[:product][:traceable] = @from.traceable_doc
      params[:product][:traceable_doc] = @from.traceable_doc
      params[:product][:sqft_doc] = @from.sqft_doc
      params[:product][:sqft_total] = @from.sqft_total
      params[:product][:sqft_inside] = @from.sqft_inside
      params[:product][:sqft_outside] = @from.sqft_outside
      params[:product][:pallet_layers] = @from.pallet_layers
      params[:product][:pastured] = @from.pastured
      params[:product][:pastured_doc] = @from.pastured_doc
      params[:product][:omega3] = @from.omega3
      params[:product][:omega3_doc] = @from.omega3_doc
      params[:product][:vegetable] = @from.vegetable
      params[:product][:vegetable_doc] = @from.vegetable_doc
      params[:product][:other_doc] = @from.other_doc
      params[:product][:other_claims] = @from.other_claims
      params[:product][:prod_to_receipt] = @from.prod_to_receipt
      params[:product][:shelf_life] = @from.shelf_life
      params[:product][:production_changes] = @from.production_changes
      params[:product][:storage_temp] = @from.storage_temp
      params[:product][:microbe] = @from.microbe
      params[:product][:physical] = @from.physical
      params[:product][:vendor_spec] = @from.vendor_spec
      params[:product][:usda_approve] = @from.usda_approve
      params[:product][:allergens] = @from.allergens
      params[:product][:additional_integer_1] = @from.additional_integer_1
    end
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [@packet, @product], notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  def destroy
    respond_to do |format|
      if @product.destroy
        format.html { redirect_to packet_products_path(@packet), notice: 'Product was successfully destroyed.' }
      end
    end
  end

  # def import
    # Product.import(params[:file])
    # redirect_to root_url, notice: "Products imported."
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_packet
      @packet = Packet.find(params[:packet_id])
      unless current_user.id == @packet.user_id || current_user.admin?
       redirect_to root_path, :alert => "Access denied."
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:packet_id, :species, :product_name, :product_code, :vendor_code, :vendor_name, :case_piece, :box, :box_type, :box_details, :box_units, :box_length, :box_width, :box_height, :box_count, :piece_box, :piece_pack, :piece_count, :package_photo, :label, :label_type, :label_details, :safe, :weight_units, :weight_max, :weight_target, :weight_min, :product_photo, :bug, :production_date, :pallet_layers, :pallet_count_per_layer, :pallet_length, :pallet_width, :pallet_height, :never, :never_doc, :withdrawal, :withdrawal_doc, :withdrawal_days, :gmo_free, :gmo_free_doc, :organic, :organic_doc, :vaccinated, :vaccinated_doc, :vaccinated_age, :humane, :humane_doc, :traceable, :traceable_doc, :sqft_inside, :sqft_outside, :sqft_total, :sqft_doc, :pastured, :pastured_doc, :omega3, :omega3_doc, :vegetable, :vegetable_doc, :other_claims, :other_doc, :prod_to_receipt, :shelf_life, :production_changes, :storage_temp, :microbe, :physical, :vendor_spec, :usda_approve, :allergens, :additional_string_1, :additional_string_2, :additional_string_3, :additional_string_4, :additional_string_5, :additional_integer_1, :additional_integer_2, :additional_integer_3, :additional_integer_4, :additional_integer_5)
    end
end
