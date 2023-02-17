# frozen_string_literal: true

module Resolvers
  module Game
    class Start < GraphQL::Schema::Resolver
      graphql_name 'StartGame'

      class ResultAttributes < GraphQL::Schema::Object
        field :result, String, null: false
      end

      argument :user_choice, Types::GameEnum, null: false
      type ResultAttributes, null: false

      def resolve(user_choice:)

      end
    end
  end
end
