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


  def self.company
    company = Company.first
    return {} unless company

    company.as_json.merge(
      social_media_profiles: company.social_media_profiles
                              .where(active: true)
                              .order(:position)
                              .as_json,
      address: company.address&.as_json
    )
  end

  def self.hero_banners
    HeroBanner
      .where(active: true)
      .with_attached_image
      .as_json(methods: [:image_url])
  end


  def self.hero_cards
    HeroCard
      .where(active: true)
      .with_attached_image
      .as_json(methods: [:image_url])
  end


  def self.carousel_frames
    CarouselFrame
      .includes(cards: { image_attachment: :blob })
      .with_attached_image
      .order(:position)
      .as_json(
        methods: [:image_url],
        include: {
          cards: {
            methods: [:image_url]
          }
        }
      )
  end


  def self.events
    Event
      .where(active: true)
      .order(:position)
      .with_attached_image
      .as_json(methods: [:image_url])
  end


  def self.extension_cores
    raw_cores = ExtensionCoreQuery.call
    return [] if raw_cores.blank?

    core_ids   = raw_cores.map { |c| c["id"] }
    member_ids = raw_cores.map { |c| c["member_id"] }.compact

    cores = ExtensionCore
              .where(id: core_ids)
              .with_attached_images
              .with_attached_icon
              .index_by(&:id)

    members = Member
                .where(id: member_ids)
                .with_attached_image
                .index_by(&:id)

    raw_cores.map do |core|
      record = cores[core["id"]]
      member = members[core["member_id"]]

      core.merge(
        "member"   => member&.as_json(methods: [:image_url]),
        "images"   => record&.image_urls || [],
        "icon_url" => record&.icon_url
      )
    end
  end

  def self.members
    Member
      .where(active: true)
      .with_attached_image
      .as_json(methods: [:image_url])
  end
end
