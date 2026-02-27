class CardSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :description, :active, :position

  attribute :image_url, if: Proc.new { |_record, params| params && !params[:skip_card_images] } do |object|
    object.image.url if object.image.present?
  end
end