module Azendoo
  class User < AzResource
    def self.me
      find(:me)
    end
  end
end