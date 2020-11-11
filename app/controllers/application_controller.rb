class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしていない状態で[]内アクションを行った場合、ログインページ(deviceのsigh_in)に遷移
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  private
  def configure_permitted_parameters
    # deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end