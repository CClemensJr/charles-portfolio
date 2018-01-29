module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Charles Clemens | The Portfolio"
    @seo_keywords = "Charles Clemens portfolio"
  end
end
