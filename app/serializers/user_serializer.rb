class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :email

  attribute :roles do |user|
    user.role_names
  end

  attribute :permissions do |user|
    user.permission_set
  end
end
