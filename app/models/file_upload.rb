class FileUpload < ApplicationRecord
    mount_uploader :uploaded_file, RasterUploader
end
