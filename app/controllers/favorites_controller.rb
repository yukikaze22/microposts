class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.addsub(micropost)
    flash[:success] = "登録完了しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.removesub(micropost)
    flash[:success] = "登録解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
