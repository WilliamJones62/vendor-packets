require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { additional_integer_1: @product.additional_integer_1, additional_integer_2: @product.additional_integer_2, additional_integer_3: @product.additional_integer_3, additional_integer_4: @product.additional_integer_4, additional_integer_5: @product.additional_integer_5, additional_string_1: @product.additional_string_1, additional_string_2: @product.additional_string_2, additional_string_3: @product.additional_string_3, additional_string_4: @product.additional_string_4, additional_string_5: @product.additional_string_5, allergens: @product.allergens, box: @product.box, box_count: @product.box_count, box_details: @product.box_details, box_height: @product.box_height, box_length: @product.box_length, box_type: @product.box_type, box_units: @product.box_units, box_width: @product.box_width, breed: @product.breed, bug: @product.bug, case_piece: @product.case_piece, gmo_free: @product.gmo_free, gmo_free_doc: @product.gmo_free_doc, humane: @product.humane, humane_doc: @product.humane_doc, label: @product.label, label: @product.label, label_details: @product.label_details, label_type: @product.label_type, microbe: @product.microbe, never: @product.never, never_doc: @product.never_doc, omega3: @product.omega3, omega3_doc: @product.omega3_doc, organic: @product.organic, organic_doc: @product.organic_doc, other_claims: @product.other_claims, other_doc: @product.other_doc, package_photo: @product.package_photo, packet_id: @product.packet_id, pallet_count_per_layer: @product.pallet_count_per_layer, pallet_height: @product.pallet_height, pallet_layers: @product.pallet_layers, pallet_length: @product.pallet_length, pallet_width: @product.pallet_width, pastured: @product.pastured, pastured_doc: @product.pastured_doc, physical: @product.physical, piece_box: @product.piece_box, piece_count: @product.piece_count, piece_pack: @product.piece_pack, prod_to_receipt: @product.prod_to_receipt, product_code: @product.product_code, product_name: @product.product_name, product_photo: @product.product_photo, production_changes: @product.production_changes, production_date: @product.production_date, safe: @product.safe, shelf_life: @product.shelf_life, species: @product.species, sqft_doc: @product.sqft_doc, sqft_inside: @product.sqft_inside, sqft_outside: @product.sqft_outside, sqft_total: @product.sqft_total, storage_temp: @product.storage_temp, traceable: @product.traceable, traceable_doc: @product.traceable_doc, usda_approve: @product.usda_approve, vaccinated: @product.vaccinated, vaccinated_age: @product.vaccinated_age, vaccinated_doc: @product.vaccinated_doc, vegetable: @product.vegetable, vegetable_doc: @product.vegetable_doc, vendor_code: @product.vendor_code, vendor_name: @product.vendor_name, vendor_spec: @product.vendor_spec, weight_max: @product.weight_max, weight_min: @product.weight_min, weight_target: @product.weight_target, weight_units: @product.weight_units, withdrawal: @product.withdrawal, withdrawal_days: @product.withdrawal_days, withdrawal_doc: @product.withdrawal_doc } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { additional_integer_1: @product.additional_integer_1, additional_integer_2: @product.additional_integer_2, additional_integer_3: @product.additional_integer_3, additional_integer_4: @product.additional_integer_4, additional_integer_5: @product.additional_integer_5, additional_string_1: @product.additional_string_1, additional_string_2: @product.additional_string_2, additional_string_3: @product.additional_string_3, additional_string_4: @product.additional_string_4, additional_string_5: @product.additional_string_5, allergens: @product.allergens, box: @product.box, box_count: @product.box_count, box_details: @product.box_details, box_height: @product.box_height, box_length: @product.box_length, box_type: @product.box_type, box_units: @product.box_units, box_width: @product.box_width, breed: @product.breed, bug: @product.bug, case_piece: @product.case_piece, gmo_free: @product.gmo_free, gmo_free_doc: @product.gmo_free_doc, humane: @product.humane, humane_doc: @product.humane_doc, label: @product.label, label: @product.label, label_details: @product.label_details, label_type: @product.label_type, microbe: @product.microbe, never: @product.never, never_doc: @product.never_doc, omega3: @product.omega3, omega3_doc: @product.omega3_doc, organic: @product.organic, organic_doc: @product.organic_doc, other_claims: @product.other_claims, other_doc: @product.other_doc, package_photo: @product.package_photo, packet_id: @product.packet_id, pallet_count_per_layer: @product.pallet_count_per_layer, pallet_height: @product.pallet_height, pallet_layers: @product.pallet_layers, pallet_length: @product.pallet_length, pallet_width: @product.pallet_width, pastured: @product.pastured, pastured_doc: @product.pastured_doc, physical: @product.physical, piece_box: @product.piece_box, piece_count: @product.piece_count, piece_pack: @product.piece_pack, prod_to_receipt: @product.prod_to_receipt, product_code: @product.product_code, product_name: @product.product_name, product_photo: @product.product_photo, production_changes: @product.production_changes, production_date: @product.production_date, safe: @product.safe, shelf_life: @product.shelf_life, species: @product.species, sqft_doc: @product.sqft_doc, sqft_inside: @product.sqft_inside, sqft_outside: @product.sqft_outside, sqft_total: @product.sqft_total, storage_temp: @product.storage_temp, traceable: @product.traceable, traceable_doc: @product.traceable_doc, usda_approve: @product.usda_approve, vaccinated: @product.vaccinated, vaccinated_age: @product.vaccinated_age, vaccinated_doc: @product.vaccinated_doc, vegetable: @product.vegetable, vegetable_doc: @product.vegetable_doc, vendor_code: @product.vendor_code, vendor_name: @product.vendor_name, vendor_spec: @product.vendor_spec, weight_max: @product.weight_max, weight_min: @product.weight_min, weight_target: @product.weight_target, weight_units: @product.weight_units, withdrawal: @product.withdrawal, withdrawal_days: @product.withdrawal_days, withdrawal_doc: @product.withdrawal_doc } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
