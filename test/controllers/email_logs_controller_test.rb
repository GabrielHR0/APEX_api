require "test_helper"

class EmailLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_log = email_logs(:one)
  end

  test "should get index" do
    get email_logs_url, as: :json
    assert_response :success
  end

  test "should create email_log" do
    assert_difference("EmailLog.count") do
      post email_logs_url, params: { email_log: { contact_id: @email_log.contact_id, error_message: @email_log.error_message, external_id: @email_log.external_id, status: @email_log.status } }, as: :json
    end

    assert_response :created
  end

  test "should show email_log" do
    get email_log_url(@email_log), as: :json
    assert_response :success
  end

  test "should update email_log" do
    patch email_log_url(@email_log), params: { email_log: { contact_id: @email_log.contact_id, error_message: @email_log.error_message, external_id: @email_log.external_id, status: @email_log.status } }, as: :json
    assert_response :success
  end

  test "should destroy email_log" do
    assert_difference("EmailLog.count", -1) do
      delete email_log_url(@email_log), as: :json
    end

    assert_response :no_content
  end
end
