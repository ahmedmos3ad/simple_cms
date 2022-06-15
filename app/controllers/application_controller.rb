class ApplicationController < ActionController::Base

  include ApplicationHelper
  require 'jwt'
  skip_before_action :verify_authenticity_token
  around_action :switch_locale
    
def switch_locale(&action)
  locale = params[:locale] || I18n.default_locale
  I18n.with_locale(locale, &action)
end

def default_url_options
    { locale: I18n.locale }
  end

  def not_found
    render json: { error: 'not_found' }
  end

  def encode_token(payload)
    return JWT.encode(payload,Rails.application.secrets[:secret_key_base])
  end

  def decode_token()
    auth_header=request.headers['Autherization']
    if auth_header
      token = auth_header.split(' ')[1]
    end
    begin
      JWT.decode(token,Rails.application.secrets[:secret_key_base],true)
    rescue =>e
      puts e.message
    end
  end

  def authorized_user
    decode_token= decode_token()
    if decoded_token
      user_id=decoded_token[0]['user_id']
      @user = User.find_by!(id:user_id)
    end
  end

  def authorize
    render json:{message:"You aren't logged in"}, status: :unauthorized unless authorized_user
  end
  
end
