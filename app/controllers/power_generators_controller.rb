class PowerGeneratorsController < ApplicationController
  def index
    @search = PowerGenerator.order(name: :asc).ransack(params[:q])
    @power_generators = @search.result.page(params[:page])
  
    # @power_generators = PowerGenerator.order(name: :asc).page(params[:page])
  end
end
