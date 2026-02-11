class ExtensionCoreQuery
  def self.call
    sql = <<~SQL
      WITH projects_agg AS (
        SELECT
          extension_core_id,
          jsonb_agg(
            jsonb_build_object(
              'id', id,
              'name', name,
              'description', description,
              'details', details,
              'featured', featured
            )
            ORDER BY id
          ) AS projects
        FROM projects
        WHERE active = true
        GROUP BY extension_core_id
      )
      SELECT COALESCE(
        jsonb_agg(
          jsonb_build_object(
            'id', ec.id,
            'acronym', ec.acronym,
            'name', ec.name,
            'description', ec.description,
            'member_id', ec.member_id,
            'projects', COALESCE(pa.projects, '[]'::jsonb)
          )
        ),
        '[]'::jsonb
      )
      FROM extension_cores ec
      LEFT JOIN projects_agg pa
        ON pa.extension_core_id = ec.id
    SQL

    JSON.parse(
      ActiveRecord::Base.connection.select_value(sql) || '[]'
    )
  end
end
