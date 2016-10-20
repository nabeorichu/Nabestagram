class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
    @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    if @picture.save
      redirect_to pictures_path, notice: "投稿が完了しました！"
    else
      render action: 'new'
    end
  end

  def edit

  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render action: 'new'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end

  def confirm
    @picture = Picture.new(pictures_params)
    render :new if @picture.invalid?
  end


  private
    def pictures_params
      params.require(:picture).permit(:title, :content)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
