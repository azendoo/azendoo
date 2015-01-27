module Azendoo
  class Task < AzResource
    has_one :owner, class_name: 'Azendoo::User'
    has_one :author, class_name: 'Azendoo::User'
  end
end