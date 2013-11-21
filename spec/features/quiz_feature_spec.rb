require 'spec_helper'


describe 'the quizzes section' do

  before(:all) do
    FactoryGirl.create (:quiz)
  end

  describe '/quizzes' do
    it 'should display quizzes' do
      visit '/quizzes'

      expect(page).to have_content 'My quiz'
    end
  end

  describe '/quizzes/:id' do
    it 'has its own page' do
      visit '/quizzes'
      click_link 'Some quiz'

      expect(page).to have_css 'h1', text: 'My quiz'
    end
  end

  describe '/quizzes/new' do
    
    it 'creates a new quiz' do
      visit '/quizzes/new'

      within '.new_quiz' do
        fill_in 'Title', with: 'Brand new quiz'
        fill_in 'number of questions' with '5'
        click_button "Create Quiz"
      end

      expect(current_url).to eq url_for(Quiz.last)
      expect(page).to have_content 'Brand new quiz'
      expect(Quiz.quesions.count).to_be 5
    end

    it 'can also create a new question' do
      visit '/quizzes/new'

      fill_in 'Title', with: 'Quiz title'
      fill_in 'Question', with: 'What is your name?'
      click_button 'Create Quiz'

      expect(page).to have_content 'What is your name?'
      expect(Quiz.last.questions).not_to be_empty
    end

    it 'should not accept a new quiz without a title' do
      visit '/quizzes/new'
      fill_in 'number of questions' with '5'
      click_button 'Create Quiz'

      expect(page).to have_content 'error'
    end

    it 'should not accept a new quiz without giving number of questions' do
      visit '/quizzes/new'
      fill_in 'Title', with: 'Quiz title'
      click_button 'Create Quiz'

      expect(page).to have_content 'error'
    end

    end 

  end

end