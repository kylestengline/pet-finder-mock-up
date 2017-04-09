class AddAdminRefToDogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :dogs, :admin, foreign_key: true
  end
end
