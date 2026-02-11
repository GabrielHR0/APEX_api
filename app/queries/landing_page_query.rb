class LandingPageQuery
  def self.call
    sql = <<~SQL
      WITH company_data AS (
        SELECT id, name, email, phone, tagline
        FROM companies
        LIMIT 1
      ),

      social_media AS (
        SELECT company_id,
          jsonb_agg(
            jsonb_build_object(
              'username', username,
              'platform', platform,
              'url', url,
              'position', position
            )
            ORDER BY position
          ) AS profiles
        FROM social_media_profiles
        WHERE active = true
        GROUP BY company_id
      ),

      address_data AS (
        SELECT
          enderecavel_id,
          to_jsonb(row) AS address
        FROM (
          SELECT
            enderecavel_id,
            city, country, neighborhood, number,
            state, street, zip_code
          FROM addresses
          WHERE enderecavel_type = 'Company'
        ) row
      ),

      hero_banners AS (
        SELECT jsonb_agg(
          jsonb_build_object(
            'title', title,
            'description', description
          )
        ) AS banners
        FROM hero_banners
        WHERE active = true
      ),

      hero_cards AS (
        SELECT jsonb_agg(
          jsonb_build_object(
            'title', title,
            'description', description
          )
        ) AS cards
        FROM hero_cards
        WHERE active = true
      ),

      carousel_cards AS (
        SELECT
          carousel_frame_id,
          jsonb_agg(
            jsonb_build_object(
              'title', title,
              'description', description
            )
            ORDER BY position
          ) AS cards
        FROM cards
        WHERE active = true
        GROUP BY carousel_frame_id
      ),

      carousel_frames AS (
        SELECT jsonb_agg(
          jsonb_build_object(
            'title', cf.title,
            'description', cf.description,
            'cards', COALESCE(cc.cards, '[]'::jsonb)
          )
          ORDER BY cf.position
        ) AS frames
        FROM carousel_frames cf
        LEFT JOIN carousel_cards cc
          ON cc.carousel_frame_id = cf.id
        WHERE cf.active = true
      ),

      projects_agg AS (
        SELECT 
          extension_core_id,
          jsonb_agg(
            jsonb_build_object(
              'name', name,
              'description', description,
              'details', details,
              'featured', featured
            )
          ) AS projects
        FROM projects
        WHERE active = true
        GROUP BY extension_core_id
      ),

      members_core AS (
        SELECT
        id AS member_id,
          jsonb_build_object(
            'email', email,
            'full_name', full_name,
            'phone', phone,
            'role', role
          ) AS member
        FROM members
        WHERE active = true
      ),

      extension_cores_json AS (
        SELECT jsonb_agg(
          jsonb_build_object(
            'acronym', ec.acronym,
            'name', ec.name,
            'description', ec.description,
            'member', mc.member,
            'projects', COALESCE(pa.projects, '[]'::jsonb)
          )
        ) AS extension_cores
        FROM extension_cores ec
        LEFT JOIN members_core mc
          ON mc.member_id = ec.member_id
        LEFT JOIN projects_agg pa
          ON pa.extension_core_id = ec.id
      ),

      events AS (
        SELECT jsonb_agg(
          jsonb_build_object(
            'title', title,
            'subtitle', subtitle
          ) ORDER BY position
        ) AS events
        FROM events
        where active = true
      )

      SELECT jsonb_build_object(
        'company',
        to_jsonb(c)
        || jsonb_build_object(
          'social_media_profiles', COALESCE(sm.profiles, '[]'::jsonb),
          'address', COALESCE(ad.address, '{}'::jsonb)
        ),
        'hero_banners', COALESCE(hb.banners, '[]'::jsonb),
        'hero_cards', COALESCE(hc.cards, '[]'::jsonb),
        'carousel_frames', COALESCE(cf.frames, '[]'::jsonb),
        'extension_cores', COALESCE(ec.extension_cores, '[]'::jsonb),
        'events', COALESCE(ev.events, '[]'::jsonb)
      )
      FROM company_data c
      LEFT JOIN social_media sm ON sm.company_id = c.id
      LEFT JOIN address_data ad ON ad.enderecavel_id = c.id
      CROSS JOIN hero_banners hb
      CROSS JOIN hero_cards hc
      CROSS JOIN carousel_frames cf
      CROSS JOIN extension_cores_json ec
      CROSS JOIN events ev;
    SQL

    result = ActiveRecord::Base.connection.select_value(sql)
    JSON.parse(result)
  end
end
