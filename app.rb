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
@apr = params.fetch("user_apr").to_f.to_s+ "%"
@num_years = params.fetch("user_years").to_i
@principal = params.fetch("user_pv").to
end
