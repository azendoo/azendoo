module Azendoo
  class Conversation < ActiveResource::Base
    self.site = Azendoo::Conf.url
    self.headers["X-ACCESS-TOKEN"] = Azendoo::Conf.access_token

    class Message < ActiveResource::Base
      self.site = Azendoo::Conf.url
      self.headers["X-ACCESS-TOKEN"] = Azendoo::Conf.access_token
      has_one :author, class_name: 'Azendoo::User'
    end

    has_one :author, class_name: 'Azendoo::User'
    has_many :messages, class_name: 'Azendoo::Conversation::Message'

  end
end