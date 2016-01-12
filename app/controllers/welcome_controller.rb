class WelcomeController < ApplicationController

  def index

  end

  def create_projekt

  end

  def show
    @wb = Wb.new
    @wb.name = "test"
  end


end
