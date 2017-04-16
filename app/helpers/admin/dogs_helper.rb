module Admin::DogsHelper
  def is_admins_dog?
    current_admin == @dog.admin_id
  end
end
