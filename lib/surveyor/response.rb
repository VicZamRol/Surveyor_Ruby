require_relative '../surveyor/answer'

module Surveyor
  # Response Class has the code to create a response object
  # with their attributes :user and :answer 
  class Response
  	# :answer is a answer object
    attr_accessor :user, :answers
    def initialize(params)
      # We ensure that :user argument is correct
      raise 'User Invalid' unless params.key?(:user)
        self.user = params.fetch(:user)
        # Array to store the answers 
        self.answers = Array[]
    end
  end
end
