class CreateAdminArticleTypes < ActiveRecord::Migration
  def change
    create_table :admin_article_types do |t|
      t.string :name
      t.string :img

      t.timestamps null: false
    end
  end
end
