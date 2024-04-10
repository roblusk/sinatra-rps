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

  response = "<h1>We played #{our_choice}!</h1>"
  response += "<h1>They played #{they_chose}!</h1>"

  if our_choice == they_chose
    response += "<h1>We tied!</h1>"
  elsif (our_choice == "rock" && they_chose == "scissors") || (our_choice == "paper" && they_chose == "rock") || (our_choice == "scissors" && they_chose == "paper")
    response += "<h1>We won!</h1>"
  else
    response += "<h1>We lost!</h1>"
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
  game("paper")
  erb(:game)
end

get("/scissors") do
  game("scissors")
  erb(:game)
end
