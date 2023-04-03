Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # routing currencies
  get("/", { :controller => "application", :action => "homepage" })

  get("/forex", { :controller => "currencies", :action => "first_currency" })

  get("/forex/:symbol", { :controller => "currencies", :action => "convert_currency" })

  get("forex/:symbol/:conversion", { :controller => "currencies", :action => "actual_conversion"})

  #routing for COVID rates
  get("/covid", { :controller => "covid", :action => "covid_rates" })

end
