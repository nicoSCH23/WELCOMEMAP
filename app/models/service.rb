class Service < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(search)
    if search
      results = Service.find_by(category: search)
      results ? results : Service.all
    else
      Service.all
    end
  end
end
