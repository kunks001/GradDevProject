def fill_in_fields_with(quiz_title, question, responses, correctness, answers)
  fill_in :quiz_title, with: quiz_title
  within_fieldset('question_1') do
    fill_in 'Question 1', with: question
    page.all('Answer').zip(answers) do |page_elem, answer|
      page_elem.fill_in 'Answer', with: answer[0]
      page_elem.choose 'Correct?' if answer[1] == 'true'
    end
  end
end