# require 'spec_helper'

# describe Quiz do
# 	let (:quiz) { Quiz.new(title: "Makers Quiz") }

#   subject { quiz }

#   it { should respond_to(:title) }
#   it { should have_many(:questions) }

#   describe 'a quiz is valid when'
#   end
# end

require 'spec_helper'

describe Quiz do
  let(:quiz) { FactoryGirl.create :quiz}
  subject { quiz }

  it { should respond_to(:title) }
  it { should have_many(:questions) }

  context "when user_id is not present" do

  end
end