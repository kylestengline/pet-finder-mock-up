class AddLocationToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :location, :integer
  end
end
