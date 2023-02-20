# frozen_string_literal: true

module Assigner
  def assign_attributes(attributes)
    Hash(attributes).each do |key, value|
      writer_method = "#{key}="
      send(writer_method, value) if respond_to?(writer_method)
    end
  end
end
