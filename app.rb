require 'pry'
require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
    @user_name = params[:name] 
    "#{@user_name.reverse}"
  end

  get '/square/:number' do 
    @num = params[:number].to_i
    # binding.pry
    "#{@num**2}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]

    erb :say_something 
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @words = params.select{ |key| key.include?("word")}
    @words.values.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do 
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i

    erb :operate
  end

end