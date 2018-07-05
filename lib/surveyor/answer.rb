require_relative '../surveyor/question'
# To use Active Model
require 'active_model'
# We are going to use ActiveModel to design the validations,
# we selected ActiveModel because we do not have database requirement 
# in case that we would have database requirement, we would choose ActiveRecord
module Surveyor
  # Answer Class has the code to create a answer object
  # with their attributes question and value 
  class Answer
    # We include activeModel validations
    include ActiveModel::Validations
    # We validate the attributes question and value
    validates :question, presence: true
    validates :value, inclusion: { in: 1..5 }, unless: :type_question_freetext
    attr_accessor :question, :value

    def initialize(params)
      # Ensure that the argument :question is correct
      return unless params.key?(:question)
      # We get the attribute .type from the :question argument
        case params.fetch(:question).type
        when 'rating'
          # We check if the :value argument is correct, between 1..5
          if (1..5) === params.fetch(:value)
            self.question = params.fetch(:question)
            self.value = params.fetch(:value)
          end
        when 'free_text'
          self.question = params.fetch(:question)
          self.value = params.fetch(:value)
        else
          # we launch a exception if type of question is incorrect
          raise 'Type question not valid for that values'
        end
    end
    
    # This method return if the question is a free_text type
    # We use this method to avoid the :value validates 
    def type_question_freetext
      return if question.nil?
        question.type == 'free_text'
    end
  end
end
