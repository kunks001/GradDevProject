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

  fill_in_fields_with(quiz_title, question, responses, correctness, answers)
  
  click_button 'Create Quiz'
end

Then(/^the number of quizzes will go up by one$/) do
  expect(Quiz.count).to eq 1
end

Then(/^the user will be able to see the title "(.*?)" and the question "(.*?)" on the root page\.$/) do |title, question|
  expect(page).to have_content title
  expect(page).to have_content question
end