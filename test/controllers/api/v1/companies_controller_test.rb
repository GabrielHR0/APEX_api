require "test_helper"

class Api::V1::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      email: "companies-#{SecureRandom.hex(4)}@example.com",
      password: "Password123!",
      password_confirmation: "Password123!"
    )
    grant_company_permissions(@user)

    @company = companies(:one)
  end

  test "index is public" do
    get "/api/v1/companies", as: :json

    assert_response :success
  end

  test "show requires authentication and permission" do
    sign_in @user
    get "/api/v1/companies/#{@company.id}", as: :json

    assert_response :success
  end

  test "update company data" do
    sign_in @user

    patch "/api/v1/companies/#{@company.id}",
      params: {
        company: {
          name: "APEX Atualizada",
          email: "contato@apex.com",
          phone: "+5511999999999",
          tagline: "Nova tagline"
        }
      },
      as: :json

    assert_response :success
    assert_equal "APEX Atualizada", @company.reload.name
  end

  private

  def grant_company_permissions(user)
    role = Role.create!(name: "test_companies_role_#{SecureRandom.hex(4)}")

    %w[read update].each do |action|
      permission = Permission.find_or_create_by!(resource: "company", action: action) do |p|
        p.description = "Permission to #{action} company"
      end
      RolePermission.find_or_create_by!(role: role, permission: permission)
    end

    user.roles << role
    user.clear_permission_cache
  end
end
