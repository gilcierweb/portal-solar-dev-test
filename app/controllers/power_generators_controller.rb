class PowerGeneratorsController < ApplicationController
  include Calculator::Shipping
  
  def index
    @search = PowerGenerator.order(name: :asc).ransack(params[:q])
    @power_generators = @search.result.page(params[:page])
    
    # @power_generators = PowerGenerator.order(name: :asc).page(params[:page])
  end
  
  def show
  
  end
  
  def shipping
    power_generator = PowerGenerator.find(params[:ajax_params][:id])
    
    cep_origem = "04094-050"
    cep_destino = params[:ajax_params][:cep]
    peso = power_generator.weight
    comprimento = power_generator.lenght
    largura = power_generator.width
    altura = power_generator.height
    
    calculator = shipping_methods(cep_origem, cep_destino, peso, comprimento, largura, altura)

    respond_to do |format|
      if calculator
        format.json {render json: {:success => true, :data => calculator}, :status => :ok}
      else
        format.json {render json: calculator.errors, status: :unprocessable_entity}
      end
    end
  end
  
  private
  
  def shipping_params
    params.require(:ajax_params).permit(:id, :cep)
  end
end
