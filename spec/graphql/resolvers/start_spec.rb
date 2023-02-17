# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Game::Start do
  describe '.resolve' do

    context 'when the user starts the game' do
      it 'returns result of the game' do

      end
    end
  end

  def query
    <<~GQL
      query {
        startGame {}
      }
    GQL
  end
end
