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
    JWT.encode(payload,Rails.application.secrets[:secret_key_base])
  end
  
end
