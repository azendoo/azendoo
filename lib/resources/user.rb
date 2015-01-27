module Azendoo
  class User < ActiveResource::Base
    self.site = Azendoo::Conf.url
    self.headers["X-ACCESS-TOKEN"] = Azendoo::Conf.access_token

    def self.me
      find(:me)
    end
  end
end