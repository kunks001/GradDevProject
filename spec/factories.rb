FactoryGirl.define do
  factory :quiz do
    title "My quiz"
    number_of_questions 5
  end

  factory :right_answer, class: Answer do
    sequence(:response) {|n| "Correct#{n}" }
    correctness true
  end

  factory :wrong_answer, class: Answer do
    sequence(:response) {|n| "Incorrect#{n}" }
    correctness false
  end

  factory :question do
    query "What is the right answer?"
    answers { [create(:right_answer), create(:wrong_answer)] }
  end
end
