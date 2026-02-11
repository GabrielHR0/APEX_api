class Api::V1::PageViewsController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:create]
    before_action :set_date_range, only: [:summary, :chart_data, :top_pages, :top_sources]

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

  # GET /api/v1/page_views/chart_data
  # Exemplo: /api/v1/page_views/chart_data?period=day
  def chart_data
    Rails.logger.debug "Permissões do Usuário: #{current_user.permission_cache.to_a}"
    authorize PageView

    period = %w[day month year].include?(params[:period]) ? params[:period] : 'day'
    
    format = case period
             when 'day' then '%Y-%m-%d' # 2024-01-20
             when 'month' then '%Y-%m'  # 2024-01
             when 'year' then '%Y'      # 2024
             end

    # Agrupa no banco de dados usando DATE_TRUNC (PostgreSQL)
    data = filtered_views
            .group("DATE_TRUNC('#{period}', created_at)")
            .order("1 ASC") # Ordena pela data crescente
            .count

    formatted_data = data.map do |date, count|
      {
        date: date.strftime(format),
        original_date: date,
        count: count
      }
    end

    render json: formatted_data
  end

  # GET /api/v1/page_views/summary
  def summary
    authorize PageView

    total = filtered_views.count
    unique_ips = filtered_views.distinct.count(:ip)

    render json: {
      total_views: total,
      unique_visitors: unique_ips,
      period: { start: @start_date, end: @end_date }
    }
  end

  # GET /api/v1/page_views/top_pages
  def top_pages
    authorize PageView

    data = filtered_views
            .group(:page)
            .order('count_all DESC')
            .limit(10)
            .count

    render json: data.map { |k, v| { name: k, value: v } }
  end

  # GET /api/v1/page_views/top_sources
  def top_sources
    authorize PageView

    data = filtered_views
            .group(:user_agent)
            .order('count_all DESC')
            .limit(10)
            .count

    render json: data.map { |k, v| { name: k, value: v } }
  end

  private

  def set_date_range
    start_param = params[:start_date]
    end_param   = params[:end_date]

    @start_date = start_param.present? ? Time.zone.parse(start_param).beginning_of_day : 30.days.ago.beginning_of_day
    @end_date   = end_param.present? ? Time.zone.parse(end_param).end_of_day : Time.zone.now.end_of_day
  end

  def filtered_views
    PageView.where(created_at: @start_date..@end_date)
  end
end