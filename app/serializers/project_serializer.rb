class ProjectSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :details, :active, :featured, :extension_core_id, :created_at

  belongs_to :extension_core
end