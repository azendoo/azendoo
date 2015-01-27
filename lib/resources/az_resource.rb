class AzResource < ActiveResource::Base
  self.site = Azendoo::Conf.url
  self.headers["X-ACCESS-TOKEN"] = Azendoo::Conf.access_token
end