class Booking < ApplicationRecord

  belongs_to :user

  validates_presence_of :check_in, :check_out
  validates_presence_of :google_place_id, :name, :city, :address
  validates_presence_of :user
  validate :booking_dates

  protected

  before_validation do
    gatherLodgingInfo
  end

  def booking_dates
    if (check_out.to_date - check_in.to_date).to_i < 1
      self.errors.add :check_out, :wrong_booking_days
    end
  end

  def gatherLodgingInfo
    client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
    lodging = client.spot google_place_id
    Rails.logger.info lodging
    self.name = lodging.name
    self.city = lodging.city
    self.address = lodging.formatted_address
    self.phone = lodging.international_phone
  end


end
