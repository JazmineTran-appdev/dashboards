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

    render ({ :template => "currency_templates/step_two.html.erb" })
  end

  def actual_conversion
    # params = {"symbol"=>"AED", "conversion"=>"USD"}
    @symbol = params.fetch("symbol")
    @conversion = params.fetch("conversion")

    @raw_data = open("https://api.exchangerate.host/convert?from=#{@symbol}&to=#{@conversion}").read
    @parsed_data = JSON.parse(@raw_data)
    @conversion_hash = @parsed_data.fetch("info")
    @value = @conversion_hash.fetch("rate")


    render ({ :template => "currency_templates/step_three.html.erb" })
  end

end
