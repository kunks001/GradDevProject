require 'spec_helper'

describe Question do
	let(:question) {Question.new(query:'New Question')}
  
  subject { question }
  	it { should belong_to(:quiz) }
  	it { should have_many(:answers) }

  	it'should not be valid without a title' do
	  	question.query = ''
	  	expect(question).to_not be_valid
		end
  
  	it'should be valid with a title' do
	  	question.query='test'
	  	expect(question).to be_valid
		end
end

