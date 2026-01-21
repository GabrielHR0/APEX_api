require "test_helper"

class CarouselFrameControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carousel_frame_index_url
    assert_response :success
  end

  test "should get show" do
    get carousel_frame_show_url
    assert_response :success
  end

  test "should get create" do
    get carousel_frame_create_url
    assert_response :success
  end

  test "should get update" do
    get carousel_frame_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carousel_frame_destroy_url
    assert_response :success
  end
end
