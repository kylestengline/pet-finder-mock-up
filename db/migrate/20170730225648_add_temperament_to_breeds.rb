class AddTemperamentToBreeds < ActiveRecord::Migration[5.1]
  def change
    add_column :breeds, :temperament, :string
  end
end
