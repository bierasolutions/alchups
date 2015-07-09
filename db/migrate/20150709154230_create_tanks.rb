class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :title
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.text :notes

      t.timestamps null: false
    end
  end
end
