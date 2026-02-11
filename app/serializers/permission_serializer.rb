class PermissionSerializer
  include JSONAPI::Serializer

  attributes :id, :resource, :action, :description
end