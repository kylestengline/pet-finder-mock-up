class ChangeLocationToString < ActiveRecord::Migration[5.1]
  def change
    change_column :dogs,:location, :string
  end
end
