class Service < ApplicationRecord
  belongs_to :user
  belongs_to :ngo, required: true
  has_many :activity_slots, dependent: :delete_all
  has_many :categories, through: :activity_slots
  has_many :beneficiaries, through: :activity_slots
  geocoded_by :address
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { notice: "An Access Point already exists at this address / Un Point d'Accès existe déjà à cette adresse" }
  accepts_nested_attributes_for :activity_slots


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
