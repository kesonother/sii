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
  validates_presence_of :business_name
  #attr_accessible :first_name,:last_name,:email, :password, :password_confirmation
  belongs_to :user
  embeds_one :address
  embeds_many :services 

  include Sunspot::Mongoid
  searchable do
    text :business_name,:category
  end
  
  #has_many :recipientrequests
  #has_many :bids

  embeds_many :pictures
  
  def self.find_by_business_name(business_name)
    user = where(:business_name => business_name).first
  end
  
  after_create :create_picture
  
  def create_picture
    @i = 0
    @nb = 4
    
   while @i < @nb  do
      pictures.create(:image => "http://www.tutorspree.com/lg-tutor-pic/images.jpg")
    @i +=1;
   end
  end
  
  #def create_address
  #  address.create(:street => "10 impasse du Chateau",:city => "Asnieres sur seine",:zipcode => "92600")
  #end
  
end
