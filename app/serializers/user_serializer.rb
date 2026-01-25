class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :updated_at

  attribute :permissions do |user|
    user.permissions
  end
end
