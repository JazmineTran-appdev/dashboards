class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")


    @array_of_symbols = @symbols_hash.keys
    render ({ :template => "/currency_templates/step_one.html.erb" })
  end

  def convert_currency
    # For the main currency
    @symbol = params.fetch("symbol")
    
    # For currencies that the main will convert to
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    
    @raw_data_two = open("https://api.exchangerate.host/convert?from=#{@symbol}&to=#{@array_of_symbols}").read
    @parsed_data_two = JSON.parse(@raw_data_two)
    
    @currency = 
    render ({ :template => "currency_templates/step_two.html.erb" })
  end
end
