# frozen_string_literal: true

module Game
  class Starter < BaseService
    RULES = {
      rock: { beats: :scissor },
      paper: { beats: :rock },
      scissor: { beats: :paper }
    }.freeze

    def call
      if user_choice == curb_choice
        'It\'s a Tie'
      elsif RULES[user_choice][:beats] == curb_choice
        'You Win!'
      else
        'Curb Wins!'
      end
    end

    private

    def curb_choice
      Rps::Throw.call['body'].to_sym
    end

    def user_choice
      params[:user_choice].to_sym
    end
  end
end
