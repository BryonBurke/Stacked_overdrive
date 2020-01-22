class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    render :new
  end


  def create
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = @user.id
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def show
  @question = Question.find(params[:question_id])
  @answers = Answer.find(params[:id])
  render :show
end

  # Other controller actions go here.

  private
    def answer_params
      params.require(:answer).permit(:title, :body)
    end
end
