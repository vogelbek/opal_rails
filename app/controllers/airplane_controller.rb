class AirplaneController < ApplicationController
  def index
  end
  def new
    @airplane = Airplane.new
  end
  def create
    @airplane = Airplane.create params[:airplane]
  end
end