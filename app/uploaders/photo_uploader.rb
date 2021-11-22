class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  process resize_to_fit: [300, 300]
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  version :thumb do
    process resize_to_fit: [100, 100]
  end
end
