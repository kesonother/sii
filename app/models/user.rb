class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  field :first_name
  field :last_name
  field :author
  
  validates_uniqueness_of :email 
  #validates_presence_of :email
  # Setup accessible (or protected) attributes for your model  
  attr_accessible :first_name,:last_name,:email, :password, :password_confirmation  
  after_create :send_mail
  
  has_one :pro
  has_many :requests
  
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders 
    
  def author
    [first_name, last_name].compact.join(' ')
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['raw_info']
    if user = User.where(:email => data["email"]).first #User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20],
      :facebook_uid => data["id"],:first_name => data["first_name"],:last_name => data["last_name"]) 
    end
  end
   
  def send_mail
    UserMailer.welcome_email(self).deliver
  end

end
