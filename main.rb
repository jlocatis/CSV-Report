require_relative "./functions.rb"

########## For each name and type of output ##########

inputNames = ARGV

k = 0

data = csvAccountDataParsing

#expectedResults = balance
# expectedResults = 3094.76

# testfunction(data, expectedResults)


holdingArray = Array.new
ways = ["csv", "CSV", "HTML", "html"]
ways.each do |i|
	holdingArray << inputNames.delete(i)
end

while k < inputNames.length 
	if data[inputNames[k].capitalize] == nil
		puts inputNames[k] + " is not included in the csv file! Try again."
		k += 1
	else	
		currentAccountData = data[inputNames[k].capitalize]
		if holdingArray.include?("html") || holdingArray.include?("HTML")
			createReportHTML(currentAccountData, inputNames[k])
		end
		if holdingArray.include?("csv") || holdingArray.include?("CSV")
			createReportCSV(currentAccountData, inputNames[k])
		end
		createReportInTerminal(currentAccountData, inputNames[k])
		k += 1

	end
end