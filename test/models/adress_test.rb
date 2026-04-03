require "test_helper"

class AddressTest < ActiveSupport::TestCase
  setup do
    @company = companies(:one)
    @company.address&.destroy
  end

  test "belongs to company" do
    address = Address.create!(
      street: "Rua B",
      number: "20",
      neighborhood: "Centro",
      city: "Curitiba",
      state: "PR",
      zip_code: "80000-000",
      country: "BR",
      company: @company
    )

    assert_equal @company.id, address.company_id
  end
end
