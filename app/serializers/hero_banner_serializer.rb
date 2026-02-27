class HeroBannerSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :description, :active, :created_at

  attribute :image_url do |object|
    object.image.url if object.image.present?
  end
end