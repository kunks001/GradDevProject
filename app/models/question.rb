class Question < ActiveRecord::Base
	belongs_to :quiz

	validates :query, presence: true

	accepts_nested_attributes_for :answers, reject_if: ->(a) { a[:response].blank? }

  def populate_answers(number_of_answers)
    number_of_answers.times { answers.build }
  end

  def correct_answer
    answers.find_by_correctness(true)
  end

	has_many :answers
end


