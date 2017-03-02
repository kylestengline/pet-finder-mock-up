class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :gender
      t.boolean :adoptable
      t.timestamp :post_date
      t.string :color
      t.string :size
      t.string :birth_date
    end
  end
end
