class CreateTravels < ActiveRecord::Migration[7.0]
  def change
    create_table :travels do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :destination_address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
