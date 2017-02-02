require 'sinatra'
require_relative "./functions.rb"
require_relative "./addcsvrow.rb"
require 'pry'

post("/") {
	addRow(params)
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
	@rows = loadArray()
	erb :printcsv
}

post("/printcsv") {
	@remove = params["row_to_remove"]
	removeRow(@remove)
	redirect('/')
}

# get("/both") {
# 	@data = csvAccountDataParsing
# 	@names = ['Sonia', 'Priya']
# 	erb :data
# }