# encoding: utf-8

class RasterUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/grr"
  end

  # process :update_client
  #
  # def update_client
  #     ProcessSession.upload_start(model.uuid, filename())
  #     ProcessSession.processing(model.uuid, 'wtf')
  #     sleep(10)
  #     ProcessSession.processing(model.uuid, 'blah')
  #     sleep(10)
  #     ProcessSession.processing(model.uuid, 'so this is how it goes?')
  #     sleep(10)
  # end

  # Create different versions of your uploaded files:
  version :warp do
    process :gdalwarp
  end

  version :translate do
      process :gdal_translate
  end

  version :overviews do
      process :gdaladdo
  end

  def gdalwarp
      ProcessSession.processing(model.uuid, "warp #{self.current_path}")
        warp = "gdalwarp -s_srs #{map.input_cs} -t_srs #{map.output_cs} -r average\
        #{map.full_path} #{tmp_dir}#{map.tif_file}"
        system warp
  # check_exit_status($?.exitstatus, warp)
  end

  def gdal_translate
      sleep(5)
      ProcessSession.processing(model.uuid, 'translate')
  end

  def gdaladdo
      sleep(5)
      ProcessSession.processing(model.uuid, 'overviews')
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(erb tif zip tar.gz)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
