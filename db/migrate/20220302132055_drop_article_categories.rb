class DropArticleCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :article_cartegories
  end
end
