require 'csv'
require 'pry'

#load accounts.csv file into program
def loadArray()
	rows = []
	CSV.foreach('accounts.csv', {headers:true}) do |row|
		row["Account"] = row["Account"].chomp
		row["Category"] = row["Category"].chomp
		row["Payee"] = row["Payee"].chomp
		rows << row.to_s
	end
	return rows
end

#add a row to the accounts.csv file
def addRow(params)
	rows = loadArray()
	new_row = params.values
	row = new_row.to_csv
	rows.push(row)
	updateCSVFile(rows)
end

#update accounts.csv after adding/removing a row
def updateCSVFile(rows)
	File.open('accounts.csv', 'w') do |file|
		file << "Account,Date,Payee,Category,Outflow,Inflow\n"
		rows.each do |line|
			file << line
		end
	end
end

#remove a question from the questions.txt file
def removeRow(remove)
	rows = loadArray()
	remove = remove.to_i - 1
	rows.delete_at(remove)
	updateCSVFile(rows)
end