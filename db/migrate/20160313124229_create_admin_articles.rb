class CreateAdminArticles < ActiveRecord::Migration
  def change
    create_table :admin_articles do |t|

      t.timestamps null: false
    end
  end
end
