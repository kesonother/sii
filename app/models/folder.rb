class Folder
  include Mongoid::Document
  include Mongoid::Acts::Tree
  
  field :user_id, :type => Integer
  field :parent_id, :type => Integer
  field :name, :type => String
  
  #acts_as_tree
  belongs_to :user
  has_many :request_copies

  
  def self.find_by_name(name)
      where(:name => name).first
  end
end
