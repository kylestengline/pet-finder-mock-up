class AddLifeSpanToBreeds < ActiveRecord::Migration[5.1]
  def change
    add_column :breeds, :life_span, :string
  end
end
