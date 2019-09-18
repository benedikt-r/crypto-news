class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'

#Grab News Data
  	@url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN&api_key=df8e10b0c19f673c57e7b5bcc265a261581a79fd1cb2a1989f3ef4d61c470cc3'
  	@uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

#Grab 
    @prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,XRP,ETH,BCH,EOS,LTC,ADA,XLM,MIOTA,USDR&tsyms=USD,EUR'
  	@prices_uri = URI(@prices_url)
    @prices_response = Net::HTTP.get(@prices_uri)
    @prices = JSON.parse(@prices_response)

  end

  def prices
  	require 'net/http'
  	require 'json'
  	@symbol = params[:sym]

  if @symbol
  	@symbol = @symbol.upcase
  	#Grab 
    @quote_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=' + @symbol + '&tsyms=USD'
  	@quote_uri = URI(@quote_url)
    @quote_response = Net::HTTP.get(@quote_uri)
    @quote = JSON.parse(@quote_response)
  end
 end
end
