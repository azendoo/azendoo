require 'active_resource'
module Azendoo
  class Conf

    def self.configure
      yield self

      require File.join(File.dirname(__FILE__), 'resources/token')
      require File.join(File.dirname(__FILE__), 'resources/az_resource')
      require File.join(File.dirname(__FILE__), 'resources/user')
      require File.join(File.dirname(__FILE__), 'resources/conversation')
      require File.join(File.dirname(__FILE__), 'resources/task')
      require File.join(File.dirname(__FILE__), 'resources/subject')
      require File.join(File.dirname(__FILE__), 'resources/workspace')
    end

    def self.url
      @url || "https://api.azendoo.com"
    end

    def self.url=(url)
      @url = url
    end

    def self.email
      @email
    end

    def self.email=(email)
      @email = email
    end

    def self.password
      @password
    end

    def self.password=(pass)
      @password = pass
    end

    def self.access_token
      unless @token
        t = Token.new(email: Azendoo::Conf.email, password: Azendoo::Conf.password)
        t.save
        @token = t.access_token
      end
      @token
    end

    def self.access_token=(token)
      @token = token
    end
  end
end