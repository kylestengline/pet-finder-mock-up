class RemoveProfileRefFromAdmin < ActiveRecord::Migration[5.1]
  def change
    remove_reference :admins, :profile, foreign_key: true
  end
end
