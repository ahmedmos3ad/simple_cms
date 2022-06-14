class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :name, null:false
      t.integer :position, null:false
      t.boolean :visible, null:false, default:false
      t.string :content_type, null:false

      t.timestamps
    end
    add_reference :sections, :page, foreign_key: true
    add_index :sections, :name
  end
end
