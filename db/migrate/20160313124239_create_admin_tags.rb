class CreateAdminTags < ActiveRecord::Migration
  def change
    create_table :admin_tags do |t|

      t.timestamps null: false
    end
  end
end
