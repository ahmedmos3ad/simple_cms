class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :name, null:false
      t.integer :permalink, null:false
      t.integer :position, null:false
      t.boolean :visible, null:false, default:false

      t.timestamps
    end
    add_reference :pages, :subject, foreign_key: true
    add_index :pages, :name
  end
end
