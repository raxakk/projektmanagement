class WelcomeController < ApplicationController
  def index

  end

  def destroy
    Pb.destroy_all
    Wb.destroy_all
    Rb.destroy_all
    Round.destroy_all
    Form.destroy_all
    redirect_to :root
  end
end
