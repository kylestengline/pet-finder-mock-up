class ChangeAgeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :dogs, :age, :string
  end
end
