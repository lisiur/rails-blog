class CreateAdminArchives < ActiveRecord::Migration
  def change
    create_table :admin_archives do |t|

      t.timestamps null: false
    end
  end
end
