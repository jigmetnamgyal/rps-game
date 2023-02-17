# frozen_string_literal: true

module Rps
  class Client
    # status code
    HTTP_OK = 200
    HTTP_CREATED = 201
    HTTP_BAD_REQUEST = 400
    HTTP_UNAUTHORIZED = 401
    HTTP_FORBIDDEN = 403
    HTTP_NOT_FOUND = 404
    HTTP_UNPROCESSABLE_ENTITY = 429

    # exceptions
    BadRequestError = Class.new(StandardError)
    ForbiddenError = Class.new(StandardError)
    NotFoundError = Class.new(StandardError)
    UnprocessableEntityError = Class.new(StandardError)
    ApiError = Class.new(StandardError)

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

    def call(method, path, params)
      response = @client.public_send(method, path, params)
      return response.body if response.status.in? [HTTP_OK, HTTP_CREATED]

      raise error_class(response.status), "Status code : #{response.status}, response: #{response.body}"
    end

    def error_class(status)
      case status
      when HTTP_BAD_REQUEST then BadRequestError
      when HTTP_FORBIDDEN then ForbiddenError
      when HTTP_NOT_FOUND then NotFoundError
      when HTTP_UNPROCESSABLE_ENTITY then UnprocessableEntityError
      else ApiError
      end
    end
  end
end
