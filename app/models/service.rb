class Service
  include Mongoid::Document
  field :service_name, :type => String
  field :price, :type => Float
  field :duration, :type => Integer
  field :description, :type => String
  field :display , :type => Boolean
  
  embedded_in :pro
end
