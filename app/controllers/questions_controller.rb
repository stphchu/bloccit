class QuestionsController < ApplicationController
  
  #INDEX
  def index
      @questions = Question.all
  end

  #SHOW
  def show
      @question = Question.find(params[:id])
  end

  #NEW
  def new
      @question = Question.new
  end

  #CREATE
  def create
      @question = Question.new
      @question.title = params[:question][:title]
      @question.body = params[:question][:body]
      @question.resolved = params[:question][false]

    if @question.save
       flash[:notice] = "Question was saved."
       redirect_to @question
    else
       flash.now[:alert] = "There was an error saving the question. Please try again."
       render :new
    end
  end

  #EDIT
  def edit
    @question = Question.find(params[:id])
  end
 
  #UPDATE
  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

#DESTROY
  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" was deleted successfully."
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error deleting the question."
      render :show
    end
  end


end
