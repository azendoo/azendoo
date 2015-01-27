require 'active_resource'
module Azendoo
  class Conf

    def self.configure
      yield self
      # Class need config
      require File.join(File.dirname(__FILE__), 'resources/user')
      require File.join(File.dirname(__FILE__), 'resources/conversation')
      require File.join(File.dirname(__FILE__), 'resources/task')
      require File.join(File.dirname(__FILE__), 'resources/subject')
      require File.join(File.dirname(__FILE__), 'resources/workspace')
    end

    def self.url
      # "https://staging.azendoo.com"
      "http://localhost:3000"
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

    class Token < ActiveResource::Base
      self.site = Azendoo::Conf.url
      self.include_root_in_json = false

      def to_json(options = {})
          {
            email: self.email,
            password: self.password
          }.to_json(options)
      end
      def load_attributes_from_response(r)
        load(JSON.load(r.body))
      end
    end
  end
end

Azendoo::Conf.configure do |c|
  c.email = 'tbishop@yopmail.com'
  c.password = 'please'
  # c.email = 'mlaporte@azendoo.com'
  # c.password = 'azendoo9654'
end
