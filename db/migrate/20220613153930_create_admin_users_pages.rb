class CreateAdminUsersPages < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users_pages do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end