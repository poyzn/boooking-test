class AddHotelInfoToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :google_place_id, :string
    add_column :bookings, :name, :string
    add_column :bookings, :city, :string
    add_column :bookings, :address, :string
    add_column :bookings, :phone, :string
  end
end
