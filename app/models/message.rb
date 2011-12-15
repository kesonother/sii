class Message
  include Mongoid::Document
  field :author_id, :type => Integer
  field :subject, :type => String
  field :body, :type => String

  belongs_to :author, :class_name => "User"
  has_many :message_copies
  #has_many :recipients, :through => :message_copies
  has_many :message_recipients
  
  def recipients
    MessageRecipient.message_copies
  end
  
  attr_accessor  :to # array of people to send to
  attr_accessible :subject, :body, :to
  
  before_create :prepare_copies
  def prepare_copies
    return if to.blank?
    
    to.each do |recipient|
      recipient = User.find(recipient)
      message_copies.build(:recipient_id => recipient.id, :folder_id => recipient.inbox.id)
    end
  end
  
end
