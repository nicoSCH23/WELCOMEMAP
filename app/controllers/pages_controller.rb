class PagesController < ApplicationController
  def home
    @categories = Category.all
    @location = "Ile de France, France"
    @catids_selected = params[:category_ids] ? params[:category_ids] : @categories.ids
    @services = Service.search(@catids_selected)
    @markers = @services.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
        infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { service: service }) }
      }
    end
  end
end
