class MemberSerializer
  include JSONAPI::Serializer

  attributes :id, :full_name, :role, :phone, :email, :active, :featured

  attribute :image_url do |object|
    object.image.url if object.image.present?
  end
end