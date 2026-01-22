class Api::V1::ContactsController < Api::V1::ApiController
  before_action :set_contact, only: %i[ show update destroy ]
  skip_before_action :authenticate_user!, only: [:create]

  # GET /contacts
  def index
    @contacts = policy_scope(Contact)

    render json: @contacts
  end

  # GET /contacts/1
  def show
    authorize @contact
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    
    authorize @contact
    
    if @contact.save
      company_email = Company.first&.email
      @contact.update(status: 'enviado')

      if company_email.present?
        Brevo::SendContactEmail.call(
          contact: @contact,
          company_email: company_email
        )
      else
        Rails.logger.warn 'E-mail da empresa não encontrado'
      end

      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    authorize @contact
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_content
    end
  end

  # DELETE /contacts/1
  def destroy
    authorize @contact
    @contact.destroy!
    head :no_content
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
