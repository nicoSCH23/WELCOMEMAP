class PagesController < ApplicationController
  def home
    @services = Service.all #rajouté selection de status approved si necessaire
    @markers = @services.select {|b| !b.lat.nil? }.map do |service|
      {
        lat: service.lat,
        lng: service.long,
        # infoWindow: { content: render_to_string(partial: "/bodies/map_box", locals: { body: body }) }
      }
    end
  end
end
