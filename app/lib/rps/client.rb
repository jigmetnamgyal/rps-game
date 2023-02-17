# frozen_string_literal: true

module Rps
  class Client
    # status code
    HTTP_OK = 200
    HTTP_CREATED = 201

    def self.default
      @default ||= Rps::Client.new
    end

    def initialize
      @client = Faraday.new(*config) do |connection|
        connection.request :json
        connection.response :json, content_type: 'application/json'
      end
    end

    def config
      [
        'https://private-anon-4f3b0f26ef-curbrockpaperscissors.apiary-mock.com',
        { headers: { user_agent: 'Rock Paper Scissor Game' } }
      ]
    end

    # If the connection is established a response from the server is thrown and if the connection fails it rescue
    # and randomly generate the throw
    def call(method, path, params)
      response = @client.public_send(method, path, params)
      return response.body if response.status.in? [HTTP_OK, HTTP_CREATED]
    rescue Faraday::ConnectionFailed
      generate_random_throw
    end

    def generate_random_throw
      { body: %w[rock paper scissors].sample }.with_indifferent_access
    end
  end
end
