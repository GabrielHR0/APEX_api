class LandingPage
  include ActiveModel::Serialization

  def initialize(social_media_profiles:, companies:, hero_banners:, hero_cards:)
    @social_media_profiles = social_media_profiles
    @company_info = companies
    @hero_banner = hero_banners
    @hero_cards = hero_cards
end