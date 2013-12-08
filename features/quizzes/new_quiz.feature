Feature: Admin user is able to create a new quiz that contains questions and answers. 

  Scenario: The user creates a new quiz
    Given the user visits the new quiz path
    When the user enters the following data into the new quiz form

    | Quiz title | Question                    | Answers | Correct? |
    | Test       | What is capital of England? | London  | true     |
    |            |                             | Paris   | false    |
    |            |                             | Berlin  | false    |
    |            |                             | Rome    | false    |
    
    Then the number of quizzes will go up by one
    And the user will be able to see the title "Test" on the root page.


  