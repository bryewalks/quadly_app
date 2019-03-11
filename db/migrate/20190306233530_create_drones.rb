class CreateDrones < ActiveRecord::Migration[5.2]
  def change
    create_table :drones do |t|
      t.string :name
      t.text :notes
      t.boolean :favorite
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
