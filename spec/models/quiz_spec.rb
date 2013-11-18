require 'spec_helper'

describe Quiz do
	let (:quiz) { Quiz.new(title: "Makers Quiz") }

  subject { quiz }

  it { should respond_to(:title) }
  it { should have_many(:questions) }

  context 'should not be valid' do

  	it 'with an invalid title' do

  		quiz.title = ''
  		expect(quiz).to_not be_valid

  	end

  end
end
