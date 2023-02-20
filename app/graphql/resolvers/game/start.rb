# frozen_string_literal: true

module Resolvers
  module Game
    class Start < GraphQL::Schema::Resolver
      graphql_name 'GameStart'

      class ResultAttributes < GraphQL::Schema::Object
        field :result, String, null: false
      end

      argument :user_choice, Types::GameEnum, required: true
      type ResultAttributes, null: false

      def resolve(user_choice:)
        { result: ::Game::Starter.call({ params: { user_choice: user_choice } }) }
      end
    end
  end
end
