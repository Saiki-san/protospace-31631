class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :create, :show, :new, :destroy, :update]

  def index # 一覧表示
    @prototype = Prototype.new
    @prototypes = Prototype.all
  end

  def new # 生成
    # Prototypeモデルのインスタンス変数@prototypeを定義(生成)
    @prototype = Prototype.new
  end

  def create # 保存
    # Prototype.create(prototype_params)
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      # redirect_to root_path(@room)
      redirect_to root_path
    else
      render :new
    end

    def show # 詳細表示
      # @prototype = Prototype.find(params[:id])
      @comment = Comment.new
      @comments = @prototype.comments.includes(:user)
    end

    def edit # 編集
      # @prototype = Prototype.find(params[:id])
    end

    def update # 更新
      prototype = Prototype.find(params[:id])
      prototype.update(prototype_params)
      # 更新が成功した時、詳細ページへ遷移
      if prototype.save
        redirect_to prototype_path(prototype.id)
      # 更新が失敗した時、編集ページへ遷移
      else
        @prototype = Prototype.find(params[:id])
        render :edit
      end
    end

    def destroy # 削除
      prototype = Prototype.find(params[:id])
      prototype.destroy
      redirect_to root_path
    end

  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  # edit・showが行われた時、beforeで実行
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    # unless user_signed_in?
    # 投稿したprototypeのユーザーid と 自分のidが同じ・・・ではなかったら、indexへ遷移
    unless @prototype.user.id == current_user.id
      redirect_to action: :index
    end
  end
end
