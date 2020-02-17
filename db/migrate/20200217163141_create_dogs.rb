class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :race
      t.text :bio
      t.date :available_start_date
      t.date :available_end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
