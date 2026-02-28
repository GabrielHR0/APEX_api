class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :email

  attribute :roles do |user|
    user.role_objects.map do |role|
      {
        id: role.id,
        name: role.name
      }
    end
  end

  attribute :permissions do |user|
    user.permission_set
  end
end
