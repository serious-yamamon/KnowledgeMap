class LibraryController < ApplicationController
  def index
    @list_id = params[:id]
    @list_name = Database.find_by(list_id: params[:id])
    @quizes = Database.where(list_id: params[:id])
  end

  def fav
    @quizes = Database.where(fav: true)
  end

  def check
    @quizes = Database.where(check: true)
  end

  def incorr
    @quizes = Database.where(incorrect: true)
  end

  def unlearn
    @quizes = Database.where(correct: false).where(incorrect: false)
  end

  def all
    @quizes = Database.all
  end

  def select
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct

  end

  def show
    @quiz = Database.find_by(id: params[:id])
  end

  def edit
    @quiz = Database.find_by(id: params[:id])
  end

  def update
    @quiz = Database.find_by(id: params[:id])
    @quiz.ques_s = params[:ques_s]
    @quiz.answer = params[:answer]
    @quiz.save

    redirect_to("/library/#{params[:id]}")


  end
end
