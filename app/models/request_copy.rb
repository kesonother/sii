class RequestCopy
  include Mongoid::Document
  field :user_id, :type => Integer
  field :request_id, :type => Integer
  field :folder_id, :type => Integer
  
  belongs_to :request
  belongs_to :user
  belongs_to :folder
end
