require 'csv'
require 'pry'

class Calculate
	def set_value_inflow(number_from_csv)
    	@value = number_from_csv.delete('$').delete(',').to_f
  	end

  	def set_value_outflow(number_from_csv)
  		@value = number_from_csv.delete('$').delete(',').to_f
  	end

  	def to_f
  		return @value
  	end
end

class CalculateAverage
	def find_average_amount(array_of_amounts)
		transaction_count = array_of_amounts.count
		array_of_amounts = array_of_amounts.inject(:+)
		@value = array_of_amounts / transaction_count
	end

	def to_f
		return @value
	end
end

class FinalNumbers
	def numbers_for_print(array_of_amounts, average)
		@value = []
		array_of_amounts = array_of_amounts.inject(:+)
		average = "$" + average.round(2).to_s
		array_of_amounts = "$" + array_of_amounts.round(2).to_s
		@value << array_of_amounts << average
	end
end

def totalSpent(personName, category)
	tempArray = []

	CSV.foreach('accounts.csv',headers:true) do |row|	
		accounts = row['Account'].delete("\n")
		if accounts === personName
			inflow = Calculate.new
			outflow = Calculate.new
			if row['Category'] === category
				inflow = inflow.set_value_inflow(row['Inflow'])
				outflow = outflow.set_value_outflow(row['Outflow'])
				tempArray << inflow.to_f - outflow.to_f
			elsif category === "Balance"
				inflow = inflow.set_value_inflow(row['Inflow'])
				outflow = outflow.set_value_outflow(row['Outflow'])
				tempArray << inflow.to_f - outflow.to_f
			end
		end
	end

	tempArray.compact
	if tempArray == []
		tempArray << 0
	end

	average = CalculateAverage.new
	average = average.find_average_amount(tempArray)

	returnArray = FinalNumbers.new
	returnArray = returnArray.numbers_for_print(tempArray, average)
	return returnArray
end

def printTerminal(inputName)
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
		printTerminalStuff(categories[x], finalArray)
		x += 1
	end
end

def printTerminalStuff(string, variable)
	if variable[0] != "$0.0"
		line = 28 - string.length
		line2 = 13 - variable[0].length
		puts string + (" "*line) + "|" + variable[0] + (" "*line2) + "|" + variable[1]
	end
end

def printHtml(inputName)
	balance = totalSpent(inputName, 'Balance')
	puts "<h1>" + inputName + "</h1>"
	puts "<p>" + balance[0] + "</p>"
	puts "<hr>"
	puts "<table>"
	puts "\t<tr>"
	puts "\t\t<th>Category</th>"
	puts "\t\t<th>Total Spent</th>"
	puts "\t\t<th>Avg. Transaction</th>"
	puts "\t</tr>\n"

	categories = ["Allowance", "Car Repairs", "Rent", "Entertainment", "Fuel", "Clothes",
	"Education", "Groceries", "Gifts", "Utilities", "Household Goods", "Gym", "Medical/Dental", "Meals"]
	x = 0
	while x <= categories.count - 1
		finalArray = totalSpent(inputName, categories[x])
		printHtmlStuff(categories[x], finalArray)
		x += 1
	end
	puts "</table>"
end

def printHtmlStuff(string, variable)
	if variable[0] != "$0.0"
		puts "\t<tr>"
		puts "\t\t<td>" + string + "<td>"
		puts "\t\t<td>" + variable[0] + "<td>"
		puts "\t\t<td>" + variable[1] + "<td>"
		puts "\t<tr>"
	end
end

def printCSV(inputName)
	puts "Category,Total Spent,Average Transaction"
	categories = ["Allowance", "Car Repairs", "Rent", "Entertainment", "Fuel", "Clothes",
	"Education", "Groceries", "Gifts", "Utilities", "Household Goods", "Gym", "Medical/Dental", "Meals"]
	x = 0
	while x <= categories.count - 1
		finalArray = totalSpent(inputName, categories[x])
		if finalArray[0] != "$0.0"
			puts categories[x] + "," + finalArray[0] + "," + finalArray[1]
		end
		x += 1
	end
end

# DISPLAY CODE

inputName = ARGV

if inputName[0] === 'Priya'
	if inputName[1] === 'HTML'
		printHtml('Priya')
	elsif inputName[1] === 'CSV'
		printCSV('Priya')
	else
		printTerminal('Priya')
	end
elsif inputName[0] === 'Sonia'
	if inputName[1] === 'HTML'
		printHtml('Sonia')
	elsif inputName[1] === 'CSV'
		printCSV('Sonia')
	else
		printTerminal('Sonia')
	end
else
	printTerminal('Priya')
	printTerminal('Sonia')
end