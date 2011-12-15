class MessageCopy
  include Mongoid::Document
  field :recipient_id, :type => Integer
  field :message_id, :type => Integer
  field :folder_id, :type => Integer
  
  belongs_to :message
  belongs_to :recipient, :class_name => "User"
  belongs_to :folder
  has_many :message_recipients
  delegate   :author, :created_at, :subject, :body, :recipients, :to => :message
end
