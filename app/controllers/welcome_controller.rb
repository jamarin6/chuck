class WelcomeController < ApplicationController

  def index

    aleatorio = params["aleatorio"]
    categoria = params["categoria"]
#byebug
    # category_button_select = ["explicit","dev","movie","food","celebrity","science","sport","political","religion","animal","history","music","travel","career","money","fashion"]
    if aleatorio == "true"
      result = JSON.parse(RestClient.get 'https://api.chucknorris.io/jokes/random')
      @value = result["value"]
      @category = result["category"]
      @fact = Fact.new(text: @value, category: @category)
      @fact.save
    elsif (categoria != "false") && (categoria != nil)
      result = JSON.parse(RestClient.get 'https://api.chucknorris.io/jokes/random?category=' + categoria)
      @value = result["value"]
      @category = result["category"]
      @fact = Fact.new(text: @value, category: @category)
      @fact.save
    else
      # estoy refrescando o entrando index desde principio
    end

    @facts = Fact.all.order(:category) if Fact.count > 0

  end


  def restClient

  end
end
