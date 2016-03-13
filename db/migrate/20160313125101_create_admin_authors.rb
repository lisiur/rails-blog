class CreateAdminAuthors < ActiveRecord::Migration
  def change
    create_table :admin_authors do |t|

      t.timestamps null: false
    end
  end
end
