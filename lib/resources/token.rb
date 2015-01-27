class Token < ActiveResource::Base
  self.site = Azendoo::Conf.url
  self.include_root_in_json = false

  def to_json(options = {})
      {
        email: self.email,
        password: self.password
      }.to_json(options)
  end
  def load_attributes_from_response(r)
    load(JSON.load(r.body))
  end
end