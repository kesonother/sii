class RequestReply
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id
  field :request_copy_id
  field :parent_id
  field :body
  
  belongs_to :request_copy
  belongs_to :user
 
end
