module Azendoo
  class Workspace < ActiveResource::Base

    self.site = Azendoo::Conf.url
    self.headers["X-ACCESS-TOKEN"] = Azendoo::Conf.access_token
    has_many :subjects, class_name: 'Azendoo::Subject'

    def add_member_by_email(email)
      self.post(:relationships, email: email)
    end
  end
end