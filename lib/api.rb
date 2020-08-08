class Api
  include HTTParty
  base_uri "http://localhost:3000/"

  def get_user token
    self.class.get("/users/profile",:headers => { "Authorization" => token})
  end

  def destroy_user(prms, url)
    self.class.delete("/user/sign_out", :body =>prms)
  end

  def auth_user(auth, url)
    self.class.post(url, :body =>auth)
  end

  def devise_sign_up(prms, url)
    self.class.post(url, :body =>prms.to_enum.to_h)
  end
end