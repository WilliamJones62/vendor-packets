require 'test_helper'

class PacketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @packet = packets(:one)
  end

  test "should get index" do
    get packets_url
    assert_response :success
  end

  test "should get new" do
    get new_packet_url
    assert_response :success
  end

  test "should create packet" do
    assert_difference('Packet.count') do
      post packets_url, params: { packet: { additional_integer_1: @packet.additional_integer_1, additional_integer_2: @packet.additional_integer_2, additional_integer_3: @packet.additional_integer_3, additional_integer_4: @packet.additional_integer_4, additional_integer_5: @packet.additional_integer_5, additional_string_1: @packet.additional_string_1, additional_string_2: @packet.additional_string_2, additional_string_3: @packet.additional_string_3, additional_string_4: @packet.additional_string_4, additional_string_5: @packet.additional_string_5, address_1: @packet.address_1, address_2: @packet.address_2, bone_foreign_1: @packet.bone_foreign_1, bone_foreign_2: @packet.bone_foreign_2, bone_foreign_3: @packet.bone_foreign_3, city: @packet.city, cntry_code: @packet.cntry_code, cntry_code: @packet.cntry_code, company_name: @packet.company_name, company_type: @packet.company_type, complaint_1: @packet.complaint_1, complaint_2: @packet.complaint_2, complaint_3: @packet.complaint_3, completed: @packet.completed, dba: @packet.dba, due_date: @packet.due_date, email: @packet.email, fax: @packet.fax, guarantee: @packet.guarantee, haccp_1_certificate: @packet.haccp_1_certificate, haccp_1_company: @packet.haccp_1_company, haccp_1_expires: @packet.haccp_1_expires, haccp_1_scheduled: @packet.haccp_1_scheduled, haccp_1_score: @packet.haccp_1_score, haccp_1_type: @packet.haccp_1_type, haccp_2_certificate: @packet.haccp_2_certificate, haccp_2_company: @packet.haccp_2_company, haccp_2_expires: @packet.haccp_2_expires, haccp_2_scheduled: @packet.haccp_2_scheduled, haccp_2_score: @packet.haccp_2_score, haccp_2_type: @packet.haccp_2_type, haccp_3_certificate: @packet.haccp_3_certificate, haccp_3_company: @packet.haccp_3_company, haccp_3_expires: @packet.haccp_3_expires, haccp_3_scheduled: @packet.haccp_3_scheduled, haccp_3_score: @packet.haccp_3_score, haccp_3_type: @packet.haccp_3_type, liability: @packet.liability, mock_recall_date_1: @packet.mock_recall_date_1, mock_recall_date_2: @packet.mock_recall_date_2, mock_recall_date_3: @packet.mock_recall_date_3, mock_recall_sop_1: @packet.mock_recall_sop_1, mock_recall_sop_2: @packet.mock_recall_sop_2, mock_recall_sop_3: @packet.mock_recall_sop_3, non_disclosure: @packet.non_disclosure, notes: @packet.notes, ops_email: @packet.ops_email, ops_name: @packet.ops_name, ops_phone_1: @packet.ops_phone_1, ops_phone_1_ext: @packet.ops_phone_1_ext, ops_phone_2: @packet.ops_phone_2, packet_number: @packet.packet_number, phone_1: @packet.phone_1, phone_2: @packet.phone_2, primary_contact: @packet.primary_contact, problems_1: @packet.problems_1, problems_2: @packet.problems_2, problems_3: @packet.problems_3, qa_email: @packet.qa_email, qa_name: @packet.qa_name, qa_phone_1: @packet.qa_phone_1, qa_phone_1_ext: @packet.qa_phone_1_ext, qa_phone_2: @packet.qa_phone_2, recall: @packet.recall, recall_this_year_1: @packet.recall_this_year_1, recall_this_year_2: @packet.recall_this_year_2, recall_this_year_3: @packet.recall_this_year_3, requested_date: @packet.requested_date, ship_address_1: @packet.ship_address_1, ship_address_2: @packet.ship_address_2, ship_city: @packet.ship_city, ship_state: @packet.ship_state, ship_zip: @packet.ship_zip, state: @packet.state, usda_establishment_name_1: @packet.usda_establishment_name_1, usda_establishment_name_2: @packet.usda_establishment_name_2, usda_establishment_name_3: @packet.usda_establishment_name_3, usda_establishment_number_1: @packet.usda_establishment_number_1, usda_establishment_number_2: @packet.usda_establishment_number_2, usda_establishment_number_3: @packet.usda_establishment_number_3, user_id: @packet.user_id, vendor_number: @packet.vendor_number, w9: @packet.w9, website: @packet.website, zip: @packet.zip } }
    end

    assert_redirected_to packet_url(Packet.last)
  end

  test "should show packet" do
    get packet_url(@packet)
    assert_response :success
  end

  test "should get edit" do
    get edit_packet_url(@packet)
    assert_response :success
  end

  test "should update packet" do
    patch packet_url(@packet), params: { packet: { additional_integer_1: @packet.additional_integer_1, additional_integer_2: @packet.additional_integer_2, additional_integer_3: @packet.additional_integer_3, additional_integer_4: @packet.additional_integer_4, additional_integer_5: @packet.additional_integer_5, additional_string_1: @packet.additional_string_1, additional_string_2: @packet.additional_string_2, additional_string_3: @packet.additional_string_3, additional_string_4: @packet.additional_string_4, additional_string_5: @packet.additional_string_5, address_1: @packet.address_1, address_2: @packet.address_2, bone_foreign_1: @packet.bone_foreign_1, bone_foreign_2: @packet.bone_foreign_2, bone_foreign_3: @packet.bone_foreign_3, city: @packet.city, cntry_code: @packet.cntry_code, cntry_code: @packet.cntry_code, company_name: @packet.company_name, company_type: @packet.company_type, complaint_1: @packet.complaint_1, complaint_2: @packet.complaint_2, complaint_3: @packet.complaint_3, completed: @packet.completed, dba: @packet.dba, due_date: @packet.due_date, email: @packet.email, fax: @packet.fax, guarantee: @packet.guarantee, haccp_1_certificate: @packet.haccp_1_certificate, haccp_1_company: @packet.haccp_1_company, haccp_1_expires: @packet.haccp_1_expires, haccp_1_scheduled: @packet.haccp_1_scheduled, haccp_1_score: @packet.haccp_1_score, haccp_1_type: @packet.haccp_1_type, haccp_2_certificate: @packet.haccp_2_certificate, haccp_2_company: @packet.haccp_2_company, haccp_2_expires: @packet.haccp_2_expires, haccp_2_scheduled: @packet.haccp_2_scheduled, haccp_2_score: @packet.haccp_2_score, haccp_2_type: @packet.haccp_2_type, haccp_3_certificate: @packet.haccp_3_certificate, haccp_3_company: @packet.haccp_3_company, haccp_3_expires: @packet.haccp_3_expires, haccp_3_scheduled: @packet.haccp_3_scheduled, haccp_3_score: @packet.haccp_3_score, haccp_3_type: @packet.haccp_3_type, liability: @packet.liability, mock_recall_date_1: @packet.mock_recall_date_1, mock_recall_date_2: @packet.mock_recall_date_2, mock_recall_date_3: @packet.mock_recall_date_3, mock_recall_sop_1: @packet.mock_recall_sop_1, mock_recall_sop_2: @packet.mock_recall_sop_2, mock_recall_sop_3: @packet.mock_recall_sop_3, non_disclosure: @packet.non_disclosure, notes: @packet.notes, ops_email: @packet.ops_email, ops_name: @packet.ops_name, ops_phone_1: @packet.ops_phone_1, ops_phone_1_ext: @packet.ops_phone_1_ext, ops_phone_2: @packet.ops_phone_2, packet_number: @packet.packet_number, phone_1: @packet.phone_1, phone_2: @packet.phone_2, primary_contact: @packet.primary_contact, problems_1: @packet.problems_1, problems_2: @packet.problems_2, problems_3: @packet.problems_3, qa_email: @packet.qa_email, qa_name: @packet.qa_name, qa_phone_1: @packet.qa_phone_1, qa_phone_1_ext: @packet.qa_phone_1_ext, qa_phone_2: @packet.qa_phone_2, recall: @packet.recall, recall_this_year_1: @packet.recall_this_year_1, recall_this_year_2: @packet.recall_this_year_2, recall_this_year_3: @packet.recall_this_year_3, requested_date: @packet.requested_date, ship_address_1: @packet.ship_address_1, ship_address_2: @packet.ship_address_2, ship_city: @packet.ship_city, ship_state: @packet.ship_state, ship_zip: @packet.ship_zip, state: @packet.state, usda_establishment_name_1: @packet.usda_establishment_name_1, usda_establishment_name_2: @packet.usda_establishment_name_2, usda_establishment_name_3: @packet.usda_establishment_name_3, usda_establishment_number_1: @packet.usda_establishment_number_1, usda_establishment_number_2: @packet.usda_establishment_number_2, usda_establishment_number_3: @packet.usda_establishment_number_3, user_id: @packet.user_id, vendor_number: @packet.vendor_number, w9: @packet.w9, website: @packet.website, zip: @packet.zip } }
    assert_redirected_to packet_url(@packet)
  end

  test "should destroy packet" do
    assert_difference('Packet.count', -1) do
      delete packet_url(@packet)
    end

    assert_redirected_to packets_url
  end
end
