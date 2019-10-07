class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.page(params[:page])
  end
end
