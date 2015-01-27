module Azendoo
  class Subject < ActiveResource::Base
    self.site = Azendoo::Conf.url
    self.headers["X-ACCESS-TOKEN"] = Azendoo::Conf.access_token
    has_many :tasks, class_name: 'Azendoo::Task'
    has_many :conversations, class_name: 'Azendoo::Conversation'

    def add_member(user)
      self.post(:add_member, user_id: user.id)
    end

    def remove_member(user)
      self.post(:remove_member, user_id: user.id)
    end
  end
end