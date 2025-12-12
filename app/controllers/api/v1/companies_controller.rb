class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update]

  def index
    @companies = Company.all

    render json: @companies
  end

  def show
    render json: @company
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy!
  end

  private 
    
  def set_company
    @company = Company.first_or_create!
  end

  def company_params
    params.require(:company).permit(:name, :tagline, :email, :phone, :logo)
  end

end
