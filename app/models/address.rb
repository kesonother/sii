class Address
  include Mongoid::Document
include Geocoder::Model::Mongoid
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  field :street, :type => String  
  field :city, :type => String
  field :zipcode, :type => Integer
  field :coordinates, :type => Array
  field :longitude, :type => Float
  field :latitude, :type => Float
  field :address
  
  validates_numericality_of :zipcode, even: true
  embedded_in :pro

  def address
    [street, city, zipcode].compact.join(', ')
  end
  
  def latitude
    coordinates[0]
  end
  
  def longitude
    coordinates[1]
  end
end
