class CreateArticleTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :article_types do |t|
      t.string :name
      t.string :display_name
    end
  end
end
