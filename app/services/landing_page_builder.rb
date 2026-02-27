class LandingPageBuilder
  def self.call
    {
      company: company,
      hero_banners: hero_banners,
      hero_cards: hero_cards,
      carousel_frames: carousel_frames,
      extension_cores: extension_cores,
      events: events,
      members: members
    }
  end

  def self.extension_cores
    raw_cores = ExtensionCoreQuery.call
    return [] if raw_cores.blank?

    member_ids = raw_cores.map { |c| c[:member_id] }.compact
    # Carregamos os membros para pegar o full_name
    members_map = Member.where(id: member_ids).index_by(&:id)

    raw_cores.map do |core|
      member = members_map[core[:member_id]]
      
      core.merge(
        member: member ? { id: member.id, full_name: member.full_name } : nil
      ).except(:member_id) # Removemos o ID solto para limpar o JSON
    end
  end

  def self.company
    company = Company.first
    return {} unless company
    company.as_json.merge(
      social_media_profiles: company.social_media_profiles.where(active: true).order(:position).as_json,
      address: company.address&.as_json
    )
  end

  def self.hero_banners
    HeroBanner.where(active: true).map { |hb| hb.as_json.merge(image_url: hb.image.url) }
  end

  def self.hero_cards
    HeroCard.where(active: true).order(:position).map { |hc| hc.as_json.merge(image_url: hc.image.url) }
  end

  def self.carousel_frames
    CarouselFrame.where(active: true).order(:position).as_json(
      methods: [:image_url],
      include: { cards: { methods: [:image_url] } }
    )
  end

  def self.events
    Event.where(active: true).order(:position).map { |e| e.as_json.merge(image_url: e.image.url) }
  end

  def self.members
    Member.where(active: true).order(featured: :desc, full_name: :asc).as_json(methods: [:image_url])
  end
end