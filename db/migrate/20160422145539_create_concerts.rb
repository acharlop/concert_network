class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :artist
      t.string :venue
      t.string :city
      t.decimal :price, :precision => 8, :scale => 2
      t.datetime :date
      t.text :description

      t.timestamps null: false
    end
  end
end
