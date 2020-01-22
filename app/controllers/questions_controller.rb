class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :index

    # Code for listing all questions goes here.
  end

  def new
    @question = Question.new
    render :new
    # Code for new question form goes here.
  end

  def create
    @user = current_user
    @question = @user.questions.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
    # Code for edit question form goes here.
  end

  def show
    @question = Question.find(params[:id])
    render :show
    # Code for showing a single question goes here.
  end

  def update
    @question= Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
    # Code for updating an question goes here.
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
    # Code for deleting an question goes here.

  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end



end
