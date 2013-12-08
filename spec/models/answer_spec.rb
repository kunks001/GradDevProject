require 'spec_helper'

describe Answer do
	let(:question) { Question.new(query: 'example') }
	let(:answer) { Answer.new(question_id: question.id) }

	subject {answer}

	it { expect(answer).to respond_to :correctness }
	it { expect(answer).to respond_to :question }

	context 'should not be valid if' do
		it 'does not belong to a question' do
			answer.question_id = ''
			answer.should_not be_valid
		end
	end

end