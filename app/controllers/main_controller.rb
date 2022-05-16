class MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def hello
  end

  def greetings
    @name = params[:name]
    puts @name
  end
end