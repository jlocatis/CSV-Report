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
			end
			if category === "Balance"
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

	average = avgTrans(tempArray)
	tempArray = tempArray.inject(:+)
	average = "$" + average.round(2).to_s
	tempArray = "$" + tempArray.round(2).to_s
	returnArray << tempArray
	returnArray << average
	return returnArray
end

def printStuff(string, variable)
	line = 28 - string.length
	line2 = 13 - variable[0].length
	puts string + (" "*line) + "|" + variable[0] + (" "*line2) + "|" + variable[1]
end

pBalance = totalSpent('Priya', 'Balance')
sBalance = totalSpent('Sonia', 'Balance')

## DISPLAY CODE

inputName = ARGV

if inputName[0] === 'Priya'
	puts ("*" * 80)
	puts "Account: Priya *** Balance: " + pBalance[0]
	puts ("*" * 80)
	puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
	puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)

	categories = ["Allowance", "Car Repairs", "Rent", "Entertainment", "Fuel", "Clothes",
	"Education", "Groceries", "Gifts", "Utilities"]
	x = 0
	while x <= categories.count - 1
		tempArray = totalSpent('Priya', categories[x])
		printStuff(categories[x], tempArray)
		x += 1
	end

elsif inputName[0] === 'Sonia'
	puts ("*" * 80)
	puts "Account: Sonia *** Balance: " + sBalance[0]
	puts ("*" * 80)
	puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
	puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)

	categories = ["Allowance", "Entertainment", "Clothes", "Medical/Dental", "Gym",
	"Education", "Groceries", "Gifts", "Utilities", "Household Goods"]
	x = 0
	while x <= categories.count - 1
		tempArray = totalSpent('Sonia', categories[x])
		printStuff(categories[x], tempArray)
		x += 1
	end

else
	puts ("*" * 80)
	puts "Account: Priya *** Balance: " + pBalance[0]
	puts ("*" * 80)
	puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
	puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)

	categories = ["Allowance", "Car Repairs", "Rent", "Entertainment", "Fuel", "Clothes",
	"Education", "Groceries", "Gifts", "Utilities"]
	x = 0
	while x <= categories.count - 1
		tempArray = totalSpent('Priya', categories[x])
		printStuff(categories[x], tempArray)
		x += 1
	end

	puts ("*" * 80)
	puts "Account: Sonia *** Balance: " + sBalance[0]
	puts ("*" * 80)
	puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
	puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)

	categories = ["Allowance", "Entertainment", "Clothes", "Medical/Dental", "Gym",
	"Education", "Groceries", "Gifts", "Utilities", "Household Goods"]
	x = 0
	while x <= categories.count - 1
		tempArray = totalSpent('Sonia', categories[x])
		printStuff(categories[x], tempArray)
		x += 1
	end		
end					