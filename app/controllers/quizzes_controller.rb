class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
    @quiz.populate(number_of_questions: 5, number_of_answers: 4)
  end

  def create
    @quiz = Quiz.new quiz_params

    if @quiz.save
      redirect_to @quiz
    else
      render 'new'
    end
  end

  def edit
    @quiz = Quiz.find params[:id]
  end

  def update
    @quiz = Quiz.find params[:id]
    if @quiz.update quiz_params
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  private

  def quiz_params
    params.require(:quiz)
          .permit :title, questions_attributes: 
                            [:id, :query, answers_attributes: 
                                [:id, :response, :correctness]]
  end

end
