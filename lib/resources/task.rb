module Azendoo
  class Task < ActiveResource::Base
    self.site = Azendoo::Conf.url
    self.headers["X-ACCESS-TOKEN"] = Azendoo::Conf.access_token
    has_one :owner, class_name: 'Azendoo::User'
  end
end