class API::V0::BookingsController < API::APIController

  before_action :authenticate_user!, only: [ :create ]

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def create
    @booking = current_user.bookings.new book_params
    if @booking.save
      render json: @booking
    else
      render json: { message: @booking.errors.map { |key, val| "#{t key} #{val}" }.join(', ') } , status: 400
    end
  end

  def user
    user = User.find params[:user_id]
    @bookings = user.bookings
    render json: @bookings
  end

  protected

  def book_params
    params.require(:booking).permit :check_in, :check_out, :comments, :google_place_id
  end

end