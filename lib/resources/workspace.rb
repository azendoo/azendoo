module Azendoo
  class Workspace < AzResource
    has_many :subjects, class_name: 'Azendoo::Subject'

    def add_member_by_email(email)
      self.post(:relationships, email: email)
    end
  end
end