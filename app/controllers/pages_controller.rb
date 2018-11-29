class PagesController < ApplicationController
  def home
    @categories = Category.all
    @distance = params[:distance] ? params[:distance] : nil
    @location = params[:location] ? params[:location] : nil
    @catids_selected = params[:category_ids] ? params[:category_ids] : @categories.ids
    @services = Service.search(@catids_selected, @location, @distance)
    @markers = @services.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
        infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { service: service }) }
      }
    end
  end
end
