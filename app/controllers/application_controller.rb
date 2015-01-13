class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def cords
    render(json: Geocoder.coordinates(params[:address].except(:created_at, :updated_at, :id).values.join(' ')))
  end
end
