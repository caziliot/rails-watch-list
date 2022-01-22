class AddImageUrlToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :image_url, :string, default: "https://picsum.photos/10/1800/80"
  end
end
