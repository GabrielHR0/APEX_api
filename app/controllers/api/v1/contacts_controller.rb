class Api::V1::ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      company_email = Company.first&.email
      @contact.update(status: 'enviado')

      if company_email.present?
        begin
          MessageMailer.receive_message(@contact, company_email).deliver_now
        rescue => e
          Rails.logger.error e.message
        end
      else
        Rails.logger.warn "Não foi possível enviar a notificação de contato: E-mail da empresa não encontrado no banco de dados."
      end

      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_content
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.expect(contact: [ :name, :email, :message, :status, :ip_address, :send_at ])
    end
end
