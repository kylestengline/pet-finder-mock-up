class AddHeightToBreeds < ActiveRecord::Migration[5.1]
  def change
    add_column :breeds, :height, :string
  end
end
