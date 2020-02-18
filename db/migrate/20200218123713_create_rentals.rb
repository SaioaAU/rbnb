class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.date :rented_start_date
      t.date :rented_nd_date
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
