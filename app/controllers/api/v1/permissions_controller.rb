class Api::V1::PermissionsController < Api::V1::ApiController
def index
    scope = policy_scope(Permission)

    if params[:search].present?
      scope = scope.where("resource ILIKE :q OR action ILIKE :q", q: "%#{params[:search]}%")
    end

    permissions = scope
                    .order(:resource, :action)
                    .page(params[:page] || 1)
                    .per(params[:per_page] || 20)

    serialized = PermissionSerializer.new(permissions).serializable_hash

    render json: {
      permissions: serialized[:data].map { |item| item[:attributes] },
      meta: {
        current_page: permissions.current_page,
        per_page: permissions.limit_value,
        total_pages: permissions.total_pages,
        total_count: permissions.total_count
      }
    }
  end
end