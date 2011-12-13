class Request
  include Mongoid::Document
  
  field :subject, :type => String  
  field :zipcode, :type => Integer
  field :details, :type => String
  field :activate, :type => Boolean
  field :choice, :type => Boolean  
  #field :libelle_category
  field :category
  field :traveltome, :type => Boolean
  field :itravel, :type => Boolean
  field :neither, :type => Boolean
  field :first_name
  field :last_name
  field :email
  
  belongs_to :user
  after_create :send_mail
  
  def send_mail
    UserMailer.receive_post(self.email).deliver
  end
  
end
