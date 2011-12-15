class MessageRecipient
  include Mongoid::Document
  
  belongs_to :message
  belongs_to :message_copy 
end
