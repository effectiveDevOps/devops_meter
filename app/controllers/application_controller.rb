class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def convert_to_id(token)
    p Rails.application.message_verifier('devops_secret_key').verify(token)[:token]
  end
  def token(user_id)
    Rails.application.message_verifier('devops_secret_key').generate({ token: user_id })
  end
end
