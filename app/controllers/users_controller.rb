class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name # ユーザーの名前
    @prototypes = user.prototypes # ユーザーの投稿
    @profile = user.profile # ユーザーのプロフィール
    @occupation = user.occupation # ユーザーの所属
    @position = user.position # ユーザーの役職
  end
end
