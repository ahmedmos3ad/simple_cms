class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name, null:false
      t.integer :position, null:false
      t.boolean :visible, null:false,default:false

      t.timestamps
    end
   add_index :subjects, :name
  end
end
