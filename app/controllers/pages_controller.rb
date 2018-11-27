class PagesController < ApplicationController
  def home
    @markers = @bodies.select {|b| !b.latitude.nil? }.map do |body|
      {
        lat: body.latitude,
        lng: body.longitude,
        infoWindow: { content: render_to_string(partial: "/bodies/map_box", locals: { body: body }) }
      }
    end
  end
end
