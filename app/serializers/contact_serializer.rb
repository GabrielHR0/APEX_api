class ContactSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :email, :message, :status, :ip_address, :sent_at, :created_at, :updated_at
end
