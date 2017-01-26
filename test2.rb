require 'csv'
require 'pry'

def totalSpent(personName, category)
	returnArray = []
	tempArray = []

	CSV.foreach('accounts.csv',headers:true) do |row|	
		accounts = row['Account'].delete("\n")
		if accounts === personName
			if row['Category'] === category
				inflow = row['Inflow'].delete('$').delete(',').to_f
				outflow = row['Outflow'].delete('$').delete(',').to_f
				tempArray << inflow - outflow
			elsif category === "Balance"
				inflow = row['Inflow'].delete('$').delete(',').to_f
				outflow = row['Outflow'].delete('$').delete(',').to_f
				tempArray << inflow - outflow
			end
		end
	end

	def avgTrans(array)
		count = array.count
		array = array.inject(:+)
		array = array / count
		return array
	end

	tempArray.compact
	if tempArray == []
		tempArray << 0
	end

	average = avgTrans(tempArray)
	tempArray = tempArray.inject(:+)
	average = "$" + average.round(2).to_s
	tempArray = "$" + tempArray.round(2).to_s
	returnArray << tempArray << average
#	returnArray << average
	return returnArray
end

def printStuff(string, variable)
	if variable[0] != "$0.0"
		line = 28 - string.length
		line2 = 13 - variable[0].length
		puts string + (" "*line) + "|" + variable[0] + (" "*line2) + "|" + variable[1]
	end
end

def printMoreStuff(inputName)
	balance = totalSpent(inputName, 'Balance')
	puts ("*" * 80)
	puts "Account: " + inputName + " *** Balance: " + balance[0]
	puts ("*" * 80)
	puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
	puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)

	categories = ["Allowance", "Car Repairs", "Rent", "Entertainment", "Fuel", "Clothes",
	"Education", "Groceries", "Gifts", "Utilities", "Household Goods", "Gym", "Medical/Dental", "Meals"]
	x = 0
	while x <= categories.count - 1
		finalArray = totalSpent(inputName, categories[x])
		printStuff(categories[x], finalArray)
		x += 1
	end
end

## DISPLAY CODE

inputName = ARGV

if inputName[0] === 'Priya'
	printMoreStuff('Priya')
elsif inputName[0] === 'Sonia'
	printMoreStuff('Sonia')
else
	printMoreStuff('Priya')
	printMoreStuff('Sonia')
end