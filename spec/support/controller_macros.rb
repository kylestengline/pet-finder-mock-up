def login_admin(admin)
  allow(request.env["warden"]).to receive(:authenticate!) { admin }
  allow(controller).to receive(:current_admin) { admin }
end
