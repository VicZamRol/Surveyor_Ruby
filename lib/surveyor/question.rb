module Surveyor
  # Question Class has the code to create a question object
  # with their attributes Titlte and Type 
  class Question
    attr_accessor :title, :type
    def initialize(params)
      # We ensure that the arguments are corrects
      if params.key?(:title) && params.key?(:type)
        self.title = params.fetch(:title)
        self.type = params.fetch(:type)
      else
        # We launch a exception if the arguments are invalid
        raise 'Invalid Arguments'
      end
    end
  end
end
