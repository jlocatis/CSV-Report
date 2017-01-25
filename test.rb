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

pAllowance = totalSpent('Priya', 'Allowance')
sAllowance = totalSpent('Sonia', 'Allowance')
pCarRepairs = totalSpent('Priya', 'Car Repairs')
#sCarRepairs = totalSpent('Sonia', 'Car Repairs')
pRent = totalSpent('Priya', 'Rent')
#sRent = totalSpent('Sonia', 'Rent')
pEntertainment = totalSpent('Priya', 'Entertainment')
sEntertainment = totalSpent('Sonia', 'Entertainment')
pFuel = totalSpent('Priya', 'Fuel')
#sFuel = totalSpent('Sonia', 'Fuel')
pClothes = totalSpent('Priya', 'Clothes')
sClothes = totalSpent('Sonia', 'Clothes')
pEducation = totalSpent('Priya', 'Education')
sEducation = totalSpent('Sonia', 'Education')
pGroceries = totalSpent('Priya', 'Groceries')
sGroceries = totalSpent('Sonia', 'Groceries')
pGifts = totalSpent('Priya', 'Gifts')
sGifts = totalSpent('Sonia', 'Gifts')
pUtilities = totalSpent('Priya', 'Utilities')
sUtilities = totalSpent('Sonia', 'Utilities')
#pGym = totalSpent('Priya', 'Gym')
sGym = totalSpent('Sonia', 'Gym')
#pMedicalDental = totalSpent('Priya', 'Medical/Dental')
sMedicalDental = totalSpent('Sonia', 'Medical/Dental')
#pHouseholdGoods = totalSpent('Priya', 'Household Goods')
sHouseholdGoods = totalSpent('Sonia', 'Household Goods')
pBalance = totalSpent('Priya', 'Balance')
sBalance = totalSpent('Sonia', 'Balance')

## DISPLAY CODE

#inputName = ARGV

#if inputName[0] === 'Priya'
puts ("*" * 80)
puts "Account: Priya *** Balance: " + pBalance[0]
puts ("*" * 80)
puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)
printStuff("Allowance", pAllowance)
printStuff("Car Repairs", pCarRepairs)
printStuff("Rent", pRent)
printStuff("Entertainment", pEntertainment)
#printStuff("Household Goods", pHouseholdGoods)
printStuff("Fuel", pFuel)
printStuff("Clothes", pClothes)
printStuff("Education", pEducation)
printStuff("Groceries", pGroceries)
printStuff("Gifts", pGifts)
#printStuff("Gym", pGym)
# printStuff("Medical/Dental", pMedicalDental)
printStuff("Utilities", pUtilities)

#if inputName[1] === 'Sonia'
puts ("*" * 80)
puts "Account: Sonia *** Balance: " + sBalance[0]
puts ("*" * 80)
puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)
printStuff("Allowance", sAllowance)
# printStuff("Car Repairs", sCarRepairs)
# printStuff("Rent", sRent)
printStuff("Entertainment", sEntertainment)
printStuff("Household Goods", sHouseholdGoods)
# printStuff("Fuel", sFuel)
printStuff("Clothes", sClothes)
printStuff("Education", sEducation)
printStuff("Groceries", sGroceries)
printStuff("Gifts", sGifts)
printStuff("Gym", sGym)
printStuff("Medical/Dental", sMedicalDental)
printStuff("Utilities", sUtilities)