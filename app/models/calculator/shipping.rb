module Calculator
  module Shipping
    
    def shipping_methods(cep_origem = "04094-050", cep_destino = "90619-900", peso = 0.3, comprimento = 30, largura = 15, altura = 2)
      freight = Correios::Frete::Calculador.new :cep_origem => cep_origem,
                                              :cep_destino => cep_destino,
                                              :peso => peso,
                                              :comprimento => comprimento,
                                              :largura => largura,
                                              :altura => altura


      services = freight.calcular :pac

      services
      
    end
  end
end
