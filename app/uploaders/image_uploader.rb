# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [800, 400]

end
