class PagesController < ApplicationController
  def home
    @article = Article.order(created_at: :desc).limit(1).first
    
  end
end