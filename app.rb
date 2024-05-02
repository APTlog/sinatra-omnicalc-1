require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_calc)
end

get("/square_root/results") do
  @the_number = params.fetch("user_number").to_f
  @the_sqrt_result  = @the_number ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f.round(3)
  @apr_display = "#{@apr}" + "%"
  @apr_calc = params.fetch("user_apr").to_f 
  @num_years = params.fetch("user_years").to_i
  @principal_display = "$" + params.fetch("user_pv").to_s  # String for display with '$'
  @principal_for_calculation = params.fetch("user_pv").to_f  # Float for calculations


  monthly_interest_rate = @apr_calc / (12 * 100) 
  total_payments = @num_years * 12  
  @payment = (@principal_for_calculation  * monthly_interest_rate * (1 + monthly_interest_rate) ** total_payments) / ((1 + monthly_interest_rate) ** total_payments - 1)

  def format_currency(amount)
    "$#{'%.2f' % amount}"  # Format to two decimal places and prepend '$'
  end
  @formatted_payment = format_currency(@payment)  
  erb(:payment_result)
end


get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min_value = params.fetch("user_min").to_f
  @max_value = params.fetch("user_max").to_f
  @random = rand(@min_value..@max_value).round(15)
  erb(:random_results)
end
