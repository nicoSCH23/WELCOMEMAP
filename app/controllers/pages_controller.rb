class PagesController < ApplicationController
  def home
    @services = Service.all #rajouté selection de status approved si necessaire
    @markers = @services.select {|b| !b.latitude.nil? }.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
        infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { service: service }) }
      }
    end
  end
end
