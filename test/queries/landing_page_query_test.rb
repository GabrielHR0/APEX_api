require "test_helper"

class LandingPageQueryTest < ActiveSupport::TestCase
  setup do
    @company = companies(:one)
    @company.address&.destroy

    @company.create_address!(
      street: "Rua das Flores",
      number: "100",
      neighborhood: "Centro",
      city: "Sao Paulo",
      state: "SP",
      zip_code: "01000-000",
      country: "BR"
    )
  end

  test "returns company address in payload" do
    payload = LandingPageQuery.call

    assert_equal "Sao Paulo", payload.dig("company", "address", "city")
    assert_equal "Rua das Flores", payload.dig("company", "address", "street")
  end
end
