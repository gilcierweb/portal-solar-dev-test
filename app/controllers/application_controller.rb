class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = "pt-BR" || I18n.default_locale
  end
end
