require 'sinatra'
require_relative "./functions.rb"
require 'pry'

get("/") {
	erb :index
}

get("/sonia") {
	@data = csvAccountDataParsing
	@names = ['Sonia']
	erb :data
}

get("/priya") {
	@data = csvAccountDataParsing
	@names = ['Priya']
	erb :data
}

get("/both") {
	@data = csvAccountDataParsing
	@names = ['Sonia', 'Priya']
	erb :data
}