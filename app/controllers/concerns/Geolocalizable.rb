require "active_support/concern"

module Geolocalizable
  extend ActiveSupport::Concern

  included do
    # Macro of a class
    before_action :set_country_by_ip
  end

  def set_country_by_ip
    puts "Set country by ip"
  end
end
