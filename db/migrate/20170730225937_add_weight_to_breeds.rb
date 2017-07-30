class AddWeightToBreeds < ActiveRecord::Migration[5.1]
  def change
    add_column :breeds, :weight, :string
  end
end
