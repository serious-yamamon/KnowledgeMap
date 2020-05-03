class LibraryController < ApplicationController
  def index
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct
    @quizes = Database.where(list_id: params[:id])


  end

  def fav
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct
    @quizes = Database.where(fav: true)
  end

  def check
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct
    @quizes = Database.where(check: true)
  end

  def incorr
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct
    @quizes = Database.where(incorrect: true)
  end

  def unlearn
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct
    @quizes = Database.where(correct: false).where(incorrect: false)
  end


  def select
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct

  end

  def show
    @id = params[:id]
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct
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
    @comments = Comment.new(comment: params[:comment], q_id: params[:id] )
    @comments.save

    redirect_to("/library/#{params[:id]}")
  end

  def delcom
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy

    redirect_to("/library/#{params[:q_id]}")
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
    @quizes = Database.search(params[:search])
  end

  def all
    @list_names = Database.select(:list_name).distinct
    @list_id = Database.select(:list_id).distinct
    @quizes = Database.search(params[:search])
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
