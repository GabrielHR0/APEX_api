class Api::V1::EmailLogsController < ApplicationController
  before_action :set_email_log, only: %i[ show update destroy ]

  # GET /email_logs
  def index
    @email_logs = EmailLog.all

    render json: @email_logs
  end

  # GET /email_logs/1
  def show
    render json: @email_log
  end

  # POST /email_logs
  def create
    @email_log = EmailLog.new(email_log_params)

    if @email_log.save
      render json: @email_log, status: :created, location: @email_log
    else
      render json: @email_log.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /email_logs/1
  def update
    if @email_log.update(email_log_params)
      render json: @email_log
    else
      render json: @email_log.errors, status: :unprocessable_content
    end
  end

  # DELETE /email_logs/1
  def destroy
    @email_log.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_log
      @email_log = EmailLog.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def email_log_params
      params.expect(email_log: [ :contact_id, :status, :external_id, :error_message ])
    end
end
