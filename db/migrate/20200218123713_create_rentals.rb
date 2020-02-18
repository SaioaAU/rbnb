class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.date :rented_start_date
      t.date :rented_nd_date

      t.timestamps
    end
  end
end
