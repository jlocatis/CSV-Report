require 'sinatra'
require_relative "./functions.rb"
require_relative "./addcsvrow.rb"
require 'pry'

post("/") {
	addRowFunction(params)
	redirect('/')
}

get("/") {
	erb :index
}

get("/data") {
	@data = csvAccountDataParsing
	@name = params["name"]
	erb :data
}

get("/printcsv") {
	params = {"test" => "test"}
	@rows = printCSV(params)
	erb :printcsv
}

post("/printcsv") {
	removeRowFunction(params)
	redirect('/')
}

# get("/both") {
# 	@data = csvAccountDataParsing
# 	@names = ['Sonia', 'Priya']
# 	erb :data
# }