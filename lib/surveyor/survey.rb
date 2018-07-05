require_relative '../surveyor/response'

module Surveyor
  # Survey Class has the code to create a survey object
  # with their attributes :name, :question and :responses
  # and the methods participation_precentage and ratings
  # This class represent a survey including their question and answers 
  class Survey
    attr_accessor :name, :questions, :responses
    def initialize(params)
      # We launch a exception if :name argument is not
      raise 'No name' unless params.key?(:name)
        self.name = params.fetch(:name)
        # Array to store questions
        self.questions = Array[]
        # Array to store responses
        self.responses = Array[]
    end

    # This method calculate the participation percentage 
    # of a question
    def participation_percentage(question)
      # we launch a exception if the question have not been found
      raise 'Question Not Found' unless questions.include? question
      # Variable to represent the number of question answered
        question_num = 0
        # Iterate the array of responses
        responses.each do |response|
          # For each response, iterate the array with answer
          response.answers.each do |answer|
            # For each answer, check the type of the question
            question_num += 1 if answer.question.eql?(question)
          end
        end
        percentage = (question_num * 100) / responses.count.to_f
        # Round to two decimals
        percentage.to_f.round(2)
    end

    # This method return an Hash with the values rating of one question
    def ratings(question)
      raise 'Question Not Found' unless questions.include? question
        # Array to count the number of the values
        rating_array = [0, 0, 0, 0, 0]
        # For each response
        responses.each do |response|
          # For each answer
          response.answers.each do |answer|
            # Check the questions
            if answer.question.eql? question
              # Add one depending the value
              case answer.value
              when 1
                rating_array[0] += 1
              when 2
                rating_array[1] += 1
              when 3
                rating_array[2] += 1
              when 4
                rating_array[3] += 1
              when 5
                rating_array[4] += 1
              end
            end
          end
        end
        #Return Hash
      { 1 => rating_array[0], 2 => rating_array[1], 3 => rating_array[2],
        4 => rating_array[3], 5 => rating_array[4] }
    end
  end
end
