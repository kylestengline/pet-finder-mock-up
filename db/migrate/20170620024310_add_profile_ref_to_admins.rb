class AddProfileRefToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_reference :admins, :profile, foreign_key: true
  end
end
