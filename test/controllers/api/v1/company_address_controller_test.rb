require "test_helper"

class Api::V1::CompanyAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_company_address_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_company_address_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_company_address_update_url
    assert_response :success
  end
end
