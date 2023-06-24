class AddArticleTypesToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :article_type, foreign_key: true
  end
end
