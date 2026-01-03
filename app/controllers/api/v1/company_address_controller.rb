class Api::V1::CompanyAddressController < ApplicationController
  before_action :set_company

  def show
    if @company.address
      render json: @company.address
    else
      render json: {}, status: :ok
    end
  end

  def create
    return update if @company.address.present?

    address = @company.build_address(address_params)

    if address.save
      render json: address, status: :created
    else
      render json: {errors: address.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    address = @company.address || @company.build_address

    Rails.logger.debug "PARAMS: #{params.to_unsafe_h}"

    if address.update(address_params)
      render json: address, status: :ok
    else
      render json: {errors: address.errors.full_messages}, status: :unprocessable_entity
    end

  end

  private 

    def set_company
      @company = Company.find(params.fetch(:company_id))
    end
    
    def address_params
      params.require(:address).permit(
        :street, 
        :number, 
        :complement, 
        :neighborhood, 
        :city, 
        :state, 
        :zip_code,
        :country
        )
    end

end
