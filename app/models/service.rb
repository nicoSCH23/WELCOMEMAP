class Service < ApplicationRecord
  has_many :service_categories
  has_many :categories, through: :service_categories
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(catids)
    if catids
      catids.map!(&:to_i)
      services = Service.all
      results = services.select{|service| (service.category_ids & catids).any?}
      results.empty? ? Service.all : results
    else
      Service.all
    end
  end
end
