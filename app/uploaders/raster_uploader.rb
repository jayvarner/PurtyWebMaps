# encoding: utf-8

class RasterUploader < CarrierWave::Uploader::Base
    after :store, :gdal

    # Choose what kind of storage to use for this uploader:
    storage :file

    def store_dir
        'uploads'
    end

    def gdal(_file)
        local_path = '/mnt/hgfs/data/PurtyWebMaps/public/uploads/'

        ProcessSession.processing(model.uuid, "Warping #{original_filename}")
        warp_cmd = "gdalwarp -s_srs EPSG:2240 -t_srs EPSG:3857 -r average #{local_path}#{original_filename} #{local_path}tmp/#{original_filename}"
        puts warp_cmd
        system warp_cmd

        ProcessSession.processing(model.uuid, "Translating #{original_filename}")
        translate_cmd = "gdal_translate -co 'TILED=YES' -co 'BLOCKXSIZE=256' -co 'BLOCKYSIZE=256' #{local_path}/tmp/#{original_filename} #{local_path}/processed/#{original_filename}"
        puts translate_cmd
        system translate_cmd

        ProcessSession.processing(model.uuid, "Adding overveiwes to #{original_filename}")
        addo_cmd = "gdaladdo -r average #{local_path}/processed/#{original_filename} 2 4 8 16 32"
        puts current_path
        system "gdalinfo #{local_path}processed/#{original_filename}"
        puts addo_cmd
        system addo_cmd
        system "gdalinfo #{local_path}processed/#{original_filename}"

        ProcessSession.processing(model.uuid, 'DONE!')
    end

end
