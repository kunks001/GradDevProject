require 'spec_helper'
describe 'Quizzes' do
  let!(:quiz) { FactoryGirl.create (:quiz) }

  describe 'When the user visits the homepage' do
    it 'the user should see a list of quiz titles' do
      visit '/'

      expect(page).to have_content 'Quiz 1'
    end
  end

  describe 'When the user clicks on the title link' do
    it 'the user is redirected to the unique quiz page' do
      visit '/quizzes'
      click_link 'Quiz 1'

      expect(page).to have_css 'h1', text: 'Quiz 1'
    end
  end

  context 'A quiz is valid when' do
    
    it 'a title is provided' do
      visit '/quizzes/new'

      within '.new_quiz' do

        fill_in 'Title', with: 'Brand new quiz'
        click_button "Create Quiz"
      end

      expect(current_url).to eq url_for(Quiz.last)
      expect(page).to have_content 'Brand new quiz'
    end

    it 'A title and a question are provided' do
      visit '/quizzes/new'

      fill_in 'Title', with: 'Quiz title'
      fill_in 'Question 1', with: 'What is your name?'
      click_button 'Create Quiz'

      expect(page).to have_content 'What is your name?'
      expect(Quiz.last.questions).not_to be_empty
    end
  end 

  context 'A quiz is not valid when' do
    it 'A title is not provided' do
      visit '/quizzes/new'
      click_button 'Create Quiz'

      expect(page).to have_content 'error'
    end
  end
end