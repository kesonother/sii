class RequestCopy
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id, :type => Integer
  field :request_id, :type => Integer
  field :folder_id, :type => Integer
  
  belongs_to :request
  belongs_to :user
  belongs_to :folder
  has_many :request_replies
end
