require 'spec_helper'

describe 'The user attempts a quiz' do
  before do
    @quiz = FactoryGirl.create(:quiz)
  end

  it '' do
    visit new_quiz_attempt_path(@quiz)

    choose 'Correct1'
    choose 'Incorrect2'

    click_button 'Submit'
    expect(page).to have_content '1'
  end
end
