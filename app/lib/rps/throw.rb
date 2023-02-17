# frozen_string_literal: true

module Rps
  class Throw < Base
    protected

    def path
      '/rps-stage/throw'
    end

    def method
      :get
    end

    def validate!; end

    def arguments; end
  end
end
