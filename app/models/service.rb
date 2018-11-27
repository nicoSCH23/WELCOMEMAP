class Service < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(params)
    if params
      results = Service.where(category: params[:category])
      results.empty? ? Service.all : results
    else
      Service.all
    end
  end

end
