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
  response += "<h2>They played #{they_chose}!</h2>"

  if our_choice == they_chose
    response += "<h3>We tied!</h3>"
  elsif (our_choice == "rock" && they_chose == "scissors") || (our_choice == "paper" && they_chose == "rock") || (our_choice == "scissors" && they_chose == "paper")
    response += "<h3>We won!</h3>"
  else
    response += "<h3>We lost!</h3>"
  end

  response
end
get("/") do
  erb(:rules)
end

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
  response += "<h2>They played #{they_chose}!</h2>"

  if our_choice == they_chose
    response += "<h3>We tied!</h3>"
  elsif (our_choice == "rock" && they_chose == "scissors") || (our_choice == "paper" && they_chose == "rock") || (our_choice == "scissors" && they_chose == "paper")
    response += "<h3>We won!</h3>"
  else
    response += "<h3>We lost!</h3>"
  end

  response
end

get("/rock") do
  @response = game("rock")
  erb(:game)
end

get("/paper") do
  @response = game("paper")
  erb(:game)
end

get("/scissors") do
  @response = game("scissors")
  erb(:game)
end
