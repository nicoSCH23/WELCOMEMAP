class Service < ApplicationRecord
  belongs_to :user
  has_many :service_categories, dependent: :delete_all
  has_many :categories, through: :service_categories
  accepts_nested_attributes_for :categories
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  def self.search(catids, location, distance)
    if (location.present? && distance.present?)
      all_coords = Geocoder.search(location)
      coords = all_coords.first.coordinates
      @results = Service.within(distance.to_i, origin: coords) if coords
    else
      @results = Service.all
    end
    if catids
      catids.map!(&:to_i)
      @results = @results.select{|service| (service.category_ids & catids).any?}
    end
    return @results
  end
end
