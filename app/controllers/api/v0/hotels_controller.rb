class API::V0::HotelsController < API::APIController

  before_action :get_client
  before_action :check_params, only: [ :index ]

  def index
    @hotels = @client.spots(params[:lat], params[:lon], types: 'lodging', radius: 1000)
    render json: @hotels
  end

  def show
    @hotel = @client.spot params[:id]
    render json: @hotel
  end

  protected

  def get_client
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
  end

  def check_params
    if !params[:lat] || !params[:lon]
      render nothing: true, status: 400
    end
  end

end