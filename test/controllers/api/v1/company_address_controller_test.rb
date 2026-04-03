require "test_helper"

class Api::V1::CompanyAddressControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      email: "company-address-#{SecureRandom.hex(4)}@example.com",
      password: "Password123!",
      password_confirmation: "Password123!"
    )
    grant_company_permissions(@user)
    sign_in @user

    @company = companies(:one)
    @company.address&.destroy
  end

  test "show returns empty object when company has no address" do
    get "/api/v1/companies/#{@company.id}/address", as: :json

    assert_response :success
    assert_equal({}, JSON.parse(response.body))
  end

  test "create persists address" do
    assert_difference("Address.count", 1) do
      post "/api/v1/companies/#{@company.id}/address",
        params: {
          address: {
            street: "Rua das Acacias",
            number: "42",
            neighborhood: "Centro",
            city: "Sao Paulo",
            state: "SP",
            zip_code: "01000-000",
            country: "BR"
          }
        },
        as: :json
    end

    assert_response :created
    assert_equal "Rua das Acacias", @company.reload.address.street
  end

  test "create updates when address already exists" do
    @company.create_address!(
      street: "Rua Antiga",
      number: "1",
      neighborhood: "Centro",
      city: "Sao Paulo",
      state: "SP",
      zip_code: "01000-000",
      country: "BR"
    )

    assert_no_difference("Address.count") do
      post "/api/v1/companies/#{@company.id}/address",
        params: {
          address: {
            street: "Rua Nova",
            city: "Sao Paulo",
            state: "SP",
            zip_code: "01000-000",
            country: "BR"
          }
        },
        as: :json
    end

    assert_response :ok
    assert_equal "Rua Nova", @company.reload.address.street
  end

  test "update edits existing address" do
    @company.create_address!(
      street: "Rua Inicial",
      number: "2",
      neighborhood: "Centro",
      city: "Sao Paulo",
      state: "SP",
      zip_code: "01000-000",
      country: "BR"
    )

    patch "/api/v1/companies/#{@company.id}/address",
      params: {
        address: {
          street: "Rua Atualizada",
          city: "Campinas",
          state: "SP",
          zip_code: "13000-000",
          country: "BR"
        }
      },
      as: :json

    assert_response :ok
    assert_equal "Rua Atualizada", @company.reload.address.street
    assert_equal "Campinas", @company.reload.address.city
  end

  private

  def grant_company_permissions(user)
    role = Role.create!(name: "test_company_role_#{SecureRandom.hex(4)}")

    %w[read create update].each do |action|
      permission = Permission.find_or_create_by!(resource: "company", action: action) do |p|
        p.description = "Permission to #{action} company"
      end
      RolePermission.find_or_create_by!(role: role, permission: permission)
    end

    user.roles << role
    user.clear_permission_cache
  end
end
