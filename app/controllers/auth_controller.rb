class AuthController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    uid = auth["uid"]
    provider = auth["provider"]
    unless Auth.find_by_uid_and_provider(uid,provider)
      Auth.create(uid:uid, provider:provider, user_id:current_user.id)
    end
    redirect_to root_path
  end

  def destroy
    provider = params[:provider]
    auth = Auth.find_by_provider_and_user_id(provider,current_user.id)
    auth.destroy
    redirect_to root_path
  end
end
