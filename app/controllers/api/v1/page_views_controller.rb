class Api::V1::PageViewsController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:create]

  # POST /api/v1/page_views
  def create
    authorize PageView

    PageView.create!(
      page: params[:page],
      ip: request.remote_ip,
      user_agent: request.user_agent
    )

    head :created
  end

  # GET /api/v1/page_views
  def index
    authorize PageView

    page     = params[:page] || 1
    per_page = params[:per_page] || 20

    views = PageView
              .order(created_at: :desc)
              .page(page)
              .per(per_page)

    render json: {
      data: views,
      meta: {
        current_page: views.current_page,
        total_pages: views.total_pages,
        total_count: views.total_count
      }
    }
  end

  # GET /api/v1/page_views/stats
  def stats
    authorize PageView

    views = PageView
              .group("DATE_TRUNC('month', created_at)")
              .order("DATE_TRUNC('month', created_at)")
              .count

    render json: views
  end

  # GET /api/v1/page_views/monthly
  def monthly
    authorize PageView

    total = PageView.where(
      created_at: Time.current.beginning_of_month..Time.current.end_of_month
    ).count

    render json: {
      month: Time.current.strftime("%Y-%m"),
      total: total
    }
  end

  # GET /api/v1/page_views/by_page
  def by_page
    authorize PageView

    views = PageView.group(:page).count
    render json: views  
  end
end
