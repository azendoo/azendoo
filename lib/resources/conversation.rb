module Azendoo
  class Conversation < AzResource
    class Message < AzResource
      has_one :author, class_name: 'Azendoo::User'
    end

    has_one :author, class_name: 'Azendoo::User'
    has_many :messages, class_name: 'Azendoo::Conversation::Message'

  end
end