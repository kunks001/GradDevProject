class AttemptsController < ApplicationController

  def new
    @quiz = Quiz.find params[:quiz_id]
  end

  def create
    @quiz = Quiz.find params[:quiz_id]
    answer_ids = params[:answer_ids].values
    scorer = Scorer.new(@quiz)
    final_score = scorer.total(answer_ids)
    render text: "#{final_score}%"
  end
end