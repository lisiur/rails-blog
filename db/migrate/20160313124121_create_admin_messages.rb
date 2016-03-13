class CreateAdminMessages < ActiveRecord::Migration
  def change
    create_table :admin_messages do |t|

      t.timestamps null: false
    end
  end
end
