require 'sinatra'
require_relative "./classes/functions.rb"
require_relative "./classes/edit.rb"
require_relative "./classes/data.rb"
require_relative "./classes/accounts.rb"
require 'pry'

get("/") {
	erb :index
}

get("/data") {
	@data = csvAccountDataParsing
	@name = params["name"]
	erb :data
}

post("/printcsv") {
	removeRowFunction(params)
	redirect('/removecsvsuccess')
}

get("/printcsv") {
	@rows = printCSV(params)
	erb :printcsv
}

post("/addcsv") {
	addRowFunction(params)
	redirect('/addcsvsuccess')
}

get("/addcsv") {
	erb :addcsv
}

get("/addcsvsuccess") {
	erb :addcsvsuccess
}

get("/removecsvsuccess") {
	erb :removecsvsuccess
}
# get("/both") {
# 	@data = csvAccountDataParsing
# 	@names = ['Sonia', 'Priya']
# 	erb :data
# }