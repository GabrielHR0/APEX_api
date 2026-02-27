class EventSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :subtitle, :position, :active, :created_at

  attribute :image_url do |object|
    object.image.url if object.image.present?
  end
end