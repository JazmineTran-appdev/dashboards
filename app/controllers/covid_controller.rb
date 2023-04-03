class CovidController < ApplicationController
  def covid_rates

    render({ :template => "rates_templates/us_rates.html.erb" })
  end
end
