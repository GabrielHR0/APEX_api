class CarouselFrameSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :description, :active, :position

  attribute :image_url do |object|
    object.image.url if object.image.present?
  end

  has_many :cards, serializer: CardSerializer
end