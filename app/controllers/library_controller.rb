class LibraryController < ApplicationController
  before_action :authenticate_user

  def index
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @quizes = Database.where(list_id: params[:id]).order(id: "ASC").page(params[:page])


  end

  def fav
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @favs = Fav.where(user_id: @current_user.id).page(params[:page])

  end

  def check
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @mylists = Mylist.where(user_id: @current_user.id).page(params[:page])
  end

  def incorr
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @incorrects = Status.where(correct: false).page(params[:page])
  end

  def unlearn
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @quizes = Database.all.page(params[:page])
    @learns = Status.where(user_id: @current_user.id)
    end


  def select
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @quizes = Database.search(params[:search]).page(params[:page])


  end

  def show
    @id = params[:id]
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @quiz = Database.find_by(id: params[:id])
    @comments = Comment.where(q_id: params[:id])
    @images = Image.where(q_id: params[:id])
    @reffers = Refference.where(o_id: params[:id])

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

  def newcom
    @quiz = Database.find_by(id: params[:id])
  end

  def createcom
    @comments = Comment.new(comment: params[:comment], q_id: params[:id], user_id: @current_user.id)
    @comments.save

    redirect_to("/library/#{params[:id]}")
  end

  def editcom
    @comment = Comment.find_by(id: params[:id])
  end

  def updatecom
    @comment = Comment.find_by(id: params[:id])
    @comment.comment = params[:comment]
    @comment.save

    redirect_to("/library/#{@comment.q_id}")
  end

  def delcom
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy

    redirect_back(fallback_location: "/")
  end

  def newimg
    @defimage = Image.new(image_name: "def.jpg", q_id: params[:id] )
    @defimage.save
    @image = Image.last
    @image.image_name = "#{@image.id}.jpg"
    @image.save
    image = params[:image]
    File.binwrite("public/ref_images/#{@image.image_name}", image.read)

    redirect_to("/library/#{params[:id]}")
  end

  def delimg
    @image = Image.find_by(id: params[:id])
    @image.destroy

    redirect_to("/library/#{params[:q_id]}")
  end

  def newref
    @id = params[:id]
    @quizes = Database.search(params[:search]).page(params[:page])
  end

  def all
    @list = Database.select(:list_name,:list_id).distinct
    @list_names = @list.order(:list_id)
    @list_id = @list.order(:list_id)
    @quizes = Database.search(params[:search]).page(params[:page])
  end

  def addref
    reffer1 = Refference.new(o_id: params[:o_id] , d_id: params[:d_id])
    reffer2 = Refference.new(o_id: params[:d_id] , d_id: params[:o_id])
    reffer1.save
    reffer2.save

    redirect_to("/library/#{params[:o_id]}")
  end

  def delref
    reffer1 = Refference.find_by(o_id: params[:o_id], d_id: params[:d_id])
    reffer2 = Refference.find_by(o_id: params[:d_id], d_id: params[:o_id])
    reffer1.destroy
    reffer2.destroy

    redirect_to("/library/#{params[:o_id]}")
  end

end
