class ExtensionCoreSerializer
  include JSONAPI::Serializer

  attributes :id, :acronym, :name, :description, :member_id, :created_at

  attribute :icon_url do |object|
    object.icon.url if object.icon.present?
  end

  attribute :image_urls do |object|
    # Garante que retorne um array, mesmo vazio, e remove nulos
    Array(object.images).map(&:url).compact
  end

  attribute :projects do |object|
    object.projects.map { |p| { id: p.id, name: p.name, featured: p.featured } }
  end

  attribute :member do |object|
    if object.member
      { id: object.member.id, full_name: object.member.full_name }
    end
  end
end