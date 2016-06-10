class BookingSerializer < ActiveModel::Serializer
  attributes :id, :check_in, :check_out, :comments, :google_place_id, :name, :city, :address, :phone

  has_one :user

end
