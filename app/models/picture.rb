class Picture
  include Mongoid::Document
  
  include Mongoid::Paperclip

  embedded_in :pro
  
  has_mongoid_attached_file :image,
  :styles => { :medium => "500x500>",:thumb => "50x50>",:small => "175x175>" },
  :storage => :s3,
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
  #:s3_credentials => {:access_key_id => ENV['S3_KEY'],:secret_access_key => ENV['S3_SECRET']},
  #:bucket => ENV['S3_BUCKET'],
  :path => ":attachment/:id/:style/:basename.:extension"

  has_mongoid_attached_file :avatar,
  :styles => { :medium => "300x300>",:thumb => "50x50>",:small => "175x175>" },
  :storage => :s3,
  #:s3_credentials => {:access_key_id => ENV['S3_KEY'],:secret_access_key => ENV['S3_SECRET']},
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
  #:bucket => ENV['S3_BUCKET'],
  :path => ":attachment/:id/:style/:basename.:extension"

end
