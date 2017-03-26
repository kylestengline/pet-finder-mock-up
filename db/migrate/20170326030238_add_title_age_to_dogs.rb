class AddTitleAgeToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :title_age, :string
  end
end
