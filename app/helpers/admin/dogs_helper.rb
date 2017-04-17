module Admin::DogsHelper
  def is_admins_dog?
    current_admin.id == @dog.admin_id
  end
end
