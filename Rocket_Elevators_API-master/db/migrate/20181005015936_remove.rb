class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :type
     add_column :quotes, :quotetype, :string
  end
end
