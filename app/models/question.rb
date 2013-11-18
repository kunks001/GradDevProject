class Question < ActiveRecord::Base
	belongs_to :quiz

	validates :query, presence: true

	has_many :answers
end
