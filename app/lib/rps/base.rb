# frozen_string_literal: true

module Rps
  class Base
    def initialize(attributes)
      @attributes = attributes
    end

    def self.call(args = {})
      new(args).call
    end

    def call
      client.call(method, path, arguments)
    end

    protected

    def client
      @client ||= Client.default
    end

    def path
      raise NotImplementedError
    end

    def method
      raise NotImplementedError
    end
  end
end
