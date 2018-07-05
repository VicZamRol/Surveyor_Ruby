require 'spec_helper'

RSpec.describe '00: Respondent Answers' do
  # Class Response
  class Response
    # This method return the number of responses
    def self.count(responses)
      responses.length
    end

    # # This method return user's respond if the user exists
    def self.for(responses, user)
      responses.each do |respon|
        return respon if respon.value?(user)
      end
    end

    # This method return boolean if the user exists or no
    def self.present?(responses, user)
      # Variable to represent if the user is or is not
      is_user = false
      responses.each do |respon|
        # Variable change to True if the user is
        is_user = true if respon.value?(user)
      end
      return is_user
    end

    # This method return number of positives responses >3
    def self.positive(responses)
      # Counter Variable
      count_positive = 0
      responses.each do |respon|
        count_positive += 1 if respon.fetch(:answer) > 3
      end
      return count_positive
    end

    # This method return the number of negative responses < 3
    def self.negative(responses)
      # Counter Variable
      count_negative = 0
      responses.each do |respon|
        count_negative += 1 if respon.fetch(:answer) < 3
      end
      return count_negative
    end

    # This method return the average of the responses
    def self.average(responses)
      avg_sum = 0
      responses.each do |respon|
        avg_sum += respon.fetch(:answer)
      end
      avg_sum.to_f / responses.length.to_f
    end
  end

  let(:responses) do
    [
      { user: "alice@example.com", answer: 1 },
      { user: "bob@example.com", answer: 2 },
      { user: "frank@example.com", answer: 3 },
      { user: "claire@example.com", answer: 4 }
    ]
  end

  context "count" do
    it "counts the number of responses" do
      expect(Response.count(responses)).to eq(4)
    end
  end

  context "for" do
    it "finds the response from frank@example.com" do
      response = Response.for(responses, "frank@example.com")
      expect(response[:answer]).to eq(3)
    end

    it "finds the response from bob@example.com" do
      response = Response.for(responses, "bob@example.com")
      expect(response[:answer]).to eq(2)
    end
  end

  context "present?" do
    it "frank@example.com's response is present" do
      expect(Response.present?(responses, "frank@example.com")).to be true
    end

    it "bill@example.com's response is not present" do
      expect(Response.present?(responses, "bill@example.com")).to be false
    end
  end

  context "positive" do
    it "finds the positive responses (score > 3)" do
      expect(Response.positive(responses)).to eq(1)
    end
  end

  context "negative" do
    it "finds the negative responses (score < 3)" do
      expect(Response.negative(responses)).to eq(2)
    end
  end

  context "average" do
    it "finds the average of the answers" do
      expect(Response.average(responses)).to eq(2.5)
    end
  end
end
