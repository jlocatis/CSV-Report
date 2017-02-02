require 'csv'
require 'pry'

#function to set initial values for new categories and accounts
def set_initial_values(accountsHash,name,row)
	unless accountsHash.has_key?(name)
		accountsHash[name] = AccountClass.new
		accountsHash[name].initial_values
	end
	unless accountsHash[name].getCategoryData.has_key?(row["Category"].chomp)
		accountsHash[name].addCategory(row)
	end
	return accountsHash
end

#Main function that calls the other to get data read in and organized
def csvAccountDataParsing
	accounts = {}

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		accountName = row["Account"].chomp.capitalize
		accounts = set_initial_values(accounts, accountName, row)
		accounts[accountName].addData(row)
	end

	accounts.each_value do |value|
		value.calculateFinalAmounts
	end

	return accounts
end
################# FOR OUTPUT AND DISPLAY BELOW ################

def createReportInTerminal(accountClass, name)
	#create spacing
	accountClass.calculateLongestCategory
	accountClass.calculateLongestTotal
	accountClass.spaceData

	puts "============================================================\n"
	puts "Account: " + name.capitalize + "... Balance: $" + accountClass.getBalance.to_s + "\n"
	puts "============================================================\n"
	puts "Category" + "\t\t|" + "Total Spent" + "\t|" + "Average Transaction"
	puts "------------------------|---------------|----------------"
	accountClass.spaceData.each{|key, value| puts key + "\t\t|" + value.getTotal.to_s + "\t|" + value.getAverage.to_s}
	return

end

def createReportHTML(accountClass, name)
	puts "<h1>" + name.capitalize + "</h1>"
	puts "<p>Total Balance: $" + accountClass.getBalance.to_s + "</p>"
	puts "<hr>"
	puts "<table>"
	puts "\t<tr>"
	puts "\t\t<td>Category</td>"
	puts "\t\t<td>Total Spent</td>"
	puts "\t\t<td>Average Transaction</td>"
	puts "\t</tr>"

	accountClass.getCategoryData.each do |key, value| 
		puts "\t<tr>"
		puts "\t\t<td>" + key + "</td>"
		puts "\t\t<td>" + value.getTotal.to_s + "</td>"
		puts "\t\t<td>" + value.getAverage.to_s + "</td>"
		puts "\t</tr>"
	end
	puts "</table>"
end

def createReportCSV(accountClass, name)
	
	filename = name.capitalize + ".csv"

	CSV.open(filename, 'w') { |f|
  		f.puts  ["Category", "Total Spent", "Average Transaction"]
  		accountClass.getCategoryData.each do |key, value|
  			f.puts [key, value.getTotal, value.getAverage]
  		end
	}
	return 
end

