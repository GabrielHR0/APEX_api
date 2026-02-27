class ExtensionCoreQuery
  def self.call
    # Usamos o SQL para manter a lógica de agregação de projetos complexa se necessário,
    # mas carregamos os objetos ExtensionCore para o CarrierWave funcionar.
    
    # 1. Buscamos os núcleos (objetos completos)
    cores = ExtensionCore.includes(:member, :projects).all

    # 2. Como você quer projetos específicos (ativos), filtramos na montagem
    cores.map do |core|
      {
        id: core.id,
        acronym: core.acronym,
        name: core.name,
        description: core.description,
        member_id: core.member_id,
        created_at: core.created_at,
        icon_url: core.icon.url, # CarrierWave agora funciona
        image_urls: core.images.map(&:url).compact, # CarrierWave agora funciona
        projects: core.projects.where(active: true).map do |p|
          {
            id: p.id,
            name: p.name,
            description: p.description,
            details: p.details,
            featured: p.featured
          }
        end
      }
    end
  end
end