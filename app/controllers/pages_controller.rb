class PagesController < ApplicationController
  def home
    @categories = Service.distinct.pluck(:category)
    @location = "Ile de France, France"
    @params = params[:category] ? params : {category: @categories, location: @location}
    @services = Service.search(params)
    @markers = @services.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
        infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { service: service }) }
      }
    end
  end
end
