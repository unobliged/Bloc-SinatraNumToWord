require "rubygems"
require "sinatra"
require_relative "num_to_words.rb"

get '/' do
	erb :index	
end

get '/numword' do
	"#{params[:num]} in words is #{params[:num].to_i.in_words}"
end


