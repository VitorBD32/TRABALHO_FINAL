class WelcomeController < ApplicationController
  def index
    @quartos = Quarto.all
  end
end
