require "sinatra"
require "sinatra/reloader"

def game(our_choice)
  they_chose = rand(1..3)
  if they_chose == 1
    they_chose = "rock"
  elsif they_chose == 2
    they_chose = "paper"
  else
    they_chose = "scissors"
  end

  response = "<h2>We played #{our_choice}!</h2>"
  response += "<h2>They played #{they_chose}!</h2>"

  if our_choice == they_chose
    response += "<h2>We tied!</h2>"
  elsif (our_choice == "rock" && they_chose == "scissors") || (our_choice == "paper" && they_chose == "rock") || (our_choice == "scissors" && they_chose == "paper")
    response += "<h2>We won!</h2>"
  else
    response += "<h2>We lost!</h2>"
  end

  response
end
get("/") do
  erb(:rules)
end

get("/rock") do
  @result = game("rock")
  erb(:game)
end

get("/paper") do
  @result = game("paper")
  erb(:game)
end

get("/scissors") do
  @result = game("scissors")
  erb(:game)
end
