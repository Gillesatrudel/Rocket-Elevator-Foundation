class ChangeLeadsFileAttachmentSize < ActiveRecord::Migration[5.2]
    def change
      change_column :leads, :file_attachment, :binary, :limit => 10.megabyte
  end
end
