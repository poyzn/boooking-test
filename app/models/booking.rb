class Booking < ApplicationRecord

  belongs_to :user

  validates_presence_of :check_in, :check_out
  validates_presence_of :google_place_id, :name, :city, :address
  validates_presence_of :user
  validate :booking_dates
  validate :booking_dates_overlap

  protected

  before_validation do
    gatherLodgingInfo
  end

  def booking_dates
    if check_out.present? && check_in.present?
      if (check_out.to_date - check_in.to_date).to_i < 1
        self.errors.add :check_in, 'Check-out date precedes check-in date'
      end
    end
  end

  def booking_dates_overlap
    if check_out.present? && check_in.present?
      bookings = user.bookings.where('(check_in >= ? AND check_out <= ?) OR (check_in >= ? AND check_in <= ?) OR (check_out <= ? AND check_out >= ?)', check_in.to_date, check_out.to_date, check_in.to_date, check_out.to_date, check_out.to_date, check_in.to_date )
      if bookings.any?
        self.errors.add :check_in, 'You have active bookings for this dates'
      end
    end
  end

  def gatherLodgingInfo
    client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
    lodging = client.spot google_place_id
    Rails.logger.info lodging
    self.name = lodging.name
    self.city = lodging.city
    self.address = lodging.formatted_address
    self.phone = lodging.international_phone_number
  end


end
