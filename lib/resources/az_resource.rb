class AzResource < ActiveResource::Base
  self.site = Azendoo::Conf.url
  self.headers["Authorization"] = " Token token=#{Azendoo::Conf.access_token}"
end