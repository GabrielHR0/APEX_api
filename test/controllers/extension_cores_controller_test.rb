require "test_helper"

class ExtensionCoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extension_core = extension_cores(:one)
  end

  test "should get index" do
    get extension_cores_url, as: :json
    assert_response :success
  end

  test "should create extension_core" do
    assert_difference("ExtensionCore.count") do
      post extension_cores_url, params: { extension_core: { acronym: @extension_core.acronym, description: @extension_core.description, director_email: @extension_core.director_email, director_name: @extension_core.director_name, name: @extension_core.name } }, as: :json
    end

    assert_response :created
  end

  test "should show extension_core" do
    get extension_core_url(@extension_core), as: :json
    assert_response :success
  end

  test "should update extension_core" do
    patch extension_core_url(@extension_core), params: { extension_core: { acronym: @extension_core.acronym, description: @extension_core.description, director_email: @extension_core.director_email, director_name: @extension_core.director_name, name: @extension_core.name } }, as: :json
    assert_response :success
  end

  test "should destroy extension_core" do
    assert_difference("ExtensionCore.count", -1) do
      delete extension_core_url(@extension_core), as: :json
    end

    assert_response :no_content
  end
end
