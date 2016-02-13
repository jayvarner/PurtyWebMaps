class CreateFileUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :file_uploads do |t|
      t.string :uuid
      t.string :uploaded_file

      t.timestamps
    end
  end
end
