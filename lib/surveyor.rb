require "surveyor/answer"
require "surveyor/question"
require "surveyor/response"
require "surveyor/survey"
require "surveyor/version"

module Surveyor

  attr_accessor :quest, :answ, :resp, :surv

  def self.question(params)
  	quest = Question.new(params)
  end

  def self.answer(params)
  	answ = Answer.new(params)
  end

  def self.response(params)
  	resp = Response.new(params)
  end

  def self.survey(params)
  	surv = Survey.new(params)
  end
end
