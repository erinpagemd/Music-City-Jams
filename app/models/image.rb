class Image < ActiveRecord::Base
  belongs_to :gigs
  mount_uploader :image, ImageUploader
end
