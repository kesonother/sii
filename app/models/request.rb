class Request
  include Mongoid::Document
    include Mongoid::Timestamps
    
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
  has_many :request_copies
  after_create :send_mail

  
  after_create :save_copies
  def save_copies
    @pros = Pro.where(zipcode.to_s()).and(category: category)
    #return if @proaccounts.blank?
    
    @pros.each do |pro| 
      recipient = pro.user
      @recipient = request_copies.create(:user_id => recipient.id,:folder_id => recipient.inbox.id)
    end 
  end
  
  def send_mail
    UserMailer.receive_post(self.email).deliver
  end
  
end
