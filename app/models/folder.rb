class Folder
  include Mongoid::Document
  include Mongoid::Acts::Tree
  
  field :user_id, :type => Integer
  field :parent_id, :type => Integer
  field :name, :type => String
  
  acts_as_tree
  belongs_to :user
  has_many :messages, :class_name => "MessageCopy"
end
