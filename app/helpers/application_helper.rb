module ApplicationHelper
  include Pagy::Frontend

  def article_type_options
    @article_types ||= ArticleType.pluck(:display_name, :id).to_h
  end
end
