# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Game::Start, type: :request do
  describe '.resolve' do
    context 'when the user starts the game with valid input' do
      it 'returns result of the game' do
        post graphql_path, params: { query: query(choice: :rock) }

        result = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(response.body))[:data][:gameStart][:result]
        expect(result).to eq('It\'s a Tie')
      end
    end

    context 'when the user starts the game with invalid input' do
      it 'throws error' do
        post graphql_path, params: { query: query(choice: :hammer) }

        error = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(response.body))[:errors][0][:message]
        expect(error).to eq(
          "Argument 'userChoice' on Field 'gameStart' has an invalid value (hammer). Expected type 'GameEnum!'."
        )
      end
    end
  end

  def query(choice:)
    <<~GQL
      query {
        gameStart(userChoice: #{choice}) {
          result#{' '}
        }
      }
    GQL
  end
end
