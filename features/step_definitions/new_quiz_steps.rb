Given(/^the user visits the new quiz path$/) do
  visit new_quiz_path
end

When(/^the user enters the following data into the new quiz form$/) do |table|
  data = table.raw
  quiz_title = data[0][1]
  question = data[1][1]
  responses = data[2][1..4]
  correctness = data[3][1..4]
  answers = Hash[responses.zip(correctness)]
  fill_in :quiz_title, with: quiz_title
  within_fieldset('question_1') do
    fill_in 'Question 1', with: question
    page.all('Answer').zip(answers) do |page_elem, answer|
      page_elem.fill_in 'Answer', with: answer[0]
      page_elem.choose 'Correct?' if answer[1] == 'true'
    end
  end
  
  click_button 'Create Quiz'
end

Then(/^the number of quizzes will go up by one$/) do
  expect(Quiz.count).to eq 1
end

Then(/^the user will be able to see the title "(.*?)" on the root page\.$/) do |title|
  expect(page).to have_content title
  expect(page).to have_content 'What is capital of England?'
end