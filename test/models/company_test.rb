require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = companies(:one)
    @company.address&.destroy
  end

  test "can persist and reload its address" do
    address = @company.create_address!(
      street: "Rua das Flores",
      number: "100",
      neighborhood: "Centro",
      city: "Sao Paulo",
      state: "SP",
      zip_code: "01000-000",
      country: "BR"
    )

    assert_equal address.id, @company.reload.address.id
  end

  test "destroys address when company is destroyed" do
    address = @company.create_address!(
      street: "Rua A",
      number: "10",
      neighborhood: "Centro",
      city: "Campinas",
      state: "SP",
      zip_code: "13000-000",
      country: "BR"
    )

    @company.destroy

    assert_not Address.exists?(address.id)
  end
end
