require 'spec_helper'

describe "Attempts" do
  let!(:quiz) { FactoryGirl.create(:quiz) }

  context 'when taking a quiz' do
    before do
      visit root_path
      click_link 'Quiz 1'
      click_link 'Play quiz'
      choose 'correct answer'
     
      click_button 'Submit'
    end
    
    it { expect(page).to have_content '100%' }
  end
end
