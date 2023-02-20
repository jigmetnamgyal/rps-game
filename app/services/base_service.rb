# frozen_string_literal: true

class BaseService
  include Assigner

  attr_accessor :params

  def initialize(attributes = {})
    assign_attributes(attributes)
  end

  class << self
    def call(args)
      new(args).call
    end
  end

  def call; end
end
