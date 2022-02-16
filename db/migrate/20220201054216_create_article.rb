class CreateArticle < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.reference :user_id
    end
  end
end
