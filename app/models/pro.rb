class Pro
  include Mongoid::Document
  
  field :business_name
  field :business_description
  field :mainphone
  field :website
  field :tags
  field :headline
  field :siret
  field :category
  #field :image
#  field :street, :type => String
#  field :city, :type => String
#  field :zipcode, :type => Integer
#  field :longitude, :type => Float
#  field :latitude, :type => Float
  validates_presence_of :business_name,:business_description
  #attr_accessible :first_name,:last_name,:email, :password, :password_confirmation
  belongs_to :user
  embeds_one :address
  embeds_many :services 
  
  #has_many :recipientrequests
  #has_many :bids

  embeds_many :pictures
end
