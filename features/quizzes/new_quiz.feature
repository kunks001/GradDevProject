Feature: Admin user is able to create a new quiz that contains questions and answers. 

  Scenario: The user creates a new quiz
    Given the user visits the new quiz path
    When the user enters the following data into the new quiz form

    | Quiz title | Test                       |       |        |       |
    | Question   | What is capital of England?|       |        |       | 
    | Answers    | London                     | Paris | Berlin | Rome  |
    | Correct?   | true                       | false | false  | false |

    
    Then the number of quizzes will go up by one
    And the user will be able to see the title "Test" on the root page.


  