Given(/^the user visits the new quiz path$/) do
  visit new_quiz_path
end

When(/^the user enters the following data into the new quiz form$/) do |table|
  @data = table.hashes
  # puts @title.inspect
  raise page.html
  @data.each do |hash|
    hash.each do |key, value|
      fill_in 'quiz_title', with: value if value

    end
  end

  puts @data.inspect
end

Then(/^the number of quizzes will go up by one$/) do

end

Then(/^the user will be able to see the title "(.*?)" on the root page\.$/) do |title|
  # expect(page).to have_content title
end