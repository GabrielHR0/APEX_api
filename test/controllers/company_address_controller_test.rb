require "test_helper"

class CompanyAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get company_address_show_url
    assert_response :success
  end

  test "should get create" do
    get company_address_create_url
    assert_response :success
  end

  test "should get update" do
    get company_address_update_url
    assert_response :success
  end
end
