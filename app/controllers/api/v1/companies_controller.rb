class Api::V1::CompaniesController < Api::V1::ApiController
  before_action :set_company, only: [:show, :update]

  def index
    @companies = policy_scope(Company)

    render json: @companies
  end

  def show
    authorize @company
    render json: @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company

    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @company
    if @company.update(company_params)
      render json: @company
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @company
    @company.destroy!
    head: no_content
  end

  private 
    
  def set_company
    @company = Company.first_or_create!
  end

  def company_params
    params.require(:company).permit(:name, :tagline, :email, :phone, :logo)
  end

end
