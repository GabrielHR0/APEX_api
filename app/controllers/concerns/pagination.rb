module Pagination
  extend ActiveSupport::Concern

  DEFAULT_PAGE = 1
  DEFAULT_PER_PAGE = 10
  MAX_PER_PAGE = 100

  private

  def page
    params.fetch(:page, DEFAULT_PAGE).to_i
  end

  def per_page
    [
      params.fetch(:per_page, DEFAULT_PER_PAGE).to_i,
      MAX_PER_PAGE
    ].min
  end

  def paginate(scope)
    scope.page(page).per(per_page)
  end

  def pagination_meta(collection)
    {
      current_page: collection.current_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count,
      per_page: collection.limit_value
    }
  end
end
