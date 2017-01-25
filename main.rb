require 'csv'
require 'pry'

priyaAllowance = []
soniaAllowance = []
CSV.foreach('accounts.csv',headers:true) do |allowance|
	if allowance['Account'] === 'Priya'
		if allowance['Category'] === 'Allowance'
			priyaAllowance << allowance['Inflow'].delete('$').delete(',').to_f - allowance['Outflow'].delete('$').delete(',').to_f
		end
		
	else
		if allowance['Category'] === 'Allowance'
			soniaAllowance << allowance['Inflow'].delete('$').delete(',').to_f - allowance['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaAllowance.count
priyaAllowance = priyaAllowance.inject(:+)
priyaAllowanceAvg = priyaAllowance / count
# puts priyaAllowanceAvg.round(2)
# puts priyaAllowance
count = soniaAllowance.count
soniaAllowance = soniaAllowance.inject(:+)
soniaAllowanceAvg = soniaAllowance / count
# puts soniaAllowanceAvg.round(2)
# puts soniaAllowance

priyaCarRepairs = []
soniaCarRepairs = []
CSV.foreach('accounts.csv',headers:true) do |carRepairs|
	if carRepairs['Account'] === 'Priya'
		if carRepairs['Category'] === 'Car Repairs'
			priyaCarRepairs << carRepairs['Inflow'].delete('$').delete(',').to_f - carRepairs['Outflow'].delete('$').delete(',').to_f
		end
	else
		if carRepairs['Category'] === 'Car Repairs'
			soniaCarRepairs << carRepairs['Inflow'].delete('$').delete(',').to_f - carRepairs['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaCarRepairs.count
priyaCarRepairs = priyaCarRepairs.inject(:+)
priyaCarRepairsAvg = priyaCarRepairs / count
# puts priyaCarRepairs
count = soniaCarRepairs.count
soniaCarRepairs = soniaCarRepairs.inject(:+)
# soniaCarRepairsAvg = soniaCarRepairs / count
# puts soniaCarRepairs

priyaRent = []
soniaRent = []
CSV.foreach('accounts.csv',headers:true) do |rent|
	if rent['Account'] === 'Priya'
		if rent['Category'] === 'Rent'
			priyaRent << rent['Inflow'].delete('$').delete(',').to_f - rent['Outflow'].delete('$').delete(',').to_f
		end
	else
		if rent['Category'] === 'Rent'
			soniaRent << rent['Inflow'].delete('$').delete(',').to_f - rent['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaRent.count
priyaRent = priyaRent.inject(:+)
priyaRentAvg = priyaRent / count
# puts priyaRent
count = soniaRent.count
soniaRent = soniaRent.inject(:+)
# soniaRentAvg = soniaRent / count
# puts soniaRent

priyaEntertainment = []
soniaEntertainment = []
CSV.foreach('accounts.csv',headers:true) do |entertainment|
	if entertainment['Account'] === 'Priya'
		if entertainment['Category'] === 'Entertainment'
			priyaEntertainment << entertainment['Inflow'].delete('$').delete(',').to_f - entertainment['Outflow'].delete('$').delete(',').to_f
		end
	else
		if entertainment['Category'] === 'Entertainment'
			soniaEntertainment << entertainment['Inflow'].delete('$').delete(',').to_f - entertainment['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaEntertainment.count
priyaEntertainment = priyaEntertainment.inject(:+)
priyaEntertainmentAvg = priyaEntertainment / count
# puts priyaEntertainment
count = soniaEntertainment.count
soniaEntertainment = soniaEntertainment.inject(:+)
soniaEntertainmentAvg = soniaEntertainment / count
# puts soniaEntertainment

priyaHouseholdGoods = []
soniaHouseholdGoods = []
CSV.foreach('accounts.csv',headers:true) do |householdGoods|
	if householdGoods['Account'] === 'Priya'
		if householdGoods['Category'] === 'Household Goods'
			priyaHouseholdGoods << householdGoods['Inflow'].delete('$').delete(',').to_f - householdGoods['Outflow'].delete('$').delete(',').to_f
		end
	else
		if householdGoods['Category'] === 'Household Goods'
			soniaHouseholdGoods << householdGoods['Inflow'].delete('$').delete(',').to_f - householdGoods['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaHouseholdGoods.count
priyaHouseholdGoods = priyaHouseholdGoods.inject(:+)
# priyaHouseholdGoodsAvg = priyaHouseholdGoods / count
# puts priyaHouseholdGoods
count = soniaHouseholdGoods.count
soniaHouseholdGoods = soniaHouseholdGoods.inject(:+)
soniaHouseholdGoodsAvg = soniaHouseholdGoods / count
# puts soniaHouseholdGoods

priyaFuel = []
soniaFuel = []
CSV.foreach('accounts.csv',headers:true) do |fuel|
	if fuel['Account'] === 'Priya'
		if fuel['Category'] === 'Fuel'
			priyaFuel << fuel['Inflow'].delete('$').delete(',').to_f - fuel['Outflow'].delete('$').delete(',').to_f
		end
	else
		if fuel['Category'] === 'Fuel'
			soniaFuel << fuel['Inflow'].delete('$').delete(',').to_f - fuel['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaFuel.count
priyaFuel = priyaFuel.inject(:+)
priyaFuelAvg = priyaFuel / count
# puts priyaFuel
count = soniaFuel.count
soniaFuel = soniaFuel.inject(:+)
# soniaFuelAvg = soniaFuel / count
# puts soniaFuel

priyaClothes = []
soniaClothes = []
CSV.foreach('accounts.csv',headers:true) do |clothes|
	if clothes['Account'] === 'Priya'
		if clothes['Category'] === 'Clothes'
			priyaClothes << clothes['Inflow'].delete('$').delete(',').to_f - clothes['Outflow'].delete('$').delete(',').to_f
		end
	else
		if clothes['Category'] === 'Clothes'
			soniaClothes << clothes['Inflow'].delete('$').delete(',').to_f - clothes['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaClothes.count
priyaClothes = priyaClothes.inject(:+)
priyaClothesAvg = priyaClothes / count
# puts priyaClothes
count = soniaClothes.count
soniaClothes = soniaClothes.inject(:+)
soniaClothesAvg = soniaClothes / count
# puts soniaClothes

priyaEducation = []
soniaEducation = []
CSV.foreach('accounts.csv',headers:true) do |education|
	if education['Account'] === 'Priya'
		if education['Category'] === 'Education'
			priyaEducation << education['Inflow'].delete('$').delete(',').to_f - education['Outflow'].delete('$').delete(',').to_f
		end
	else
		if education['Category'] === 'Education'
			soniaEducation << education['Inflow'].delete('$').delete(',').to_f - education['Outflow'].delete('$').delete(',').to_f
		end
	end
end
count = priyaEducation.count
priyaEducation = priyaEducation.inject(:+)
priyaEducationAvg = priyaEducation / count
# puts priyaEducation
count = soniaEducation.count
soniaEducation = soniaEducation.inject(:+)
soniaEducationAvg = soniaEducation / count
# puts soniaEducation

priyaGroceries = []
soniaGroceries = []
CSV.foreach('accounts.csv',headers:true) do |groceries|
	if groceries['Account'] === 'Priya'
		if groceries['Category'] === 'Groceries'
			priyaGroceries << groceries['Inflow'].delete('$').delete(',').to_f - groceries['Outflow'].delete('$').delete(',').to_f
		end
	else
		if groceries['Category'] === 'Groceries'
			soniaGroceries << groceries['Inflow'].delete('$').delete(',').to_f - groceries['Outflow'].delete('$').delete(',').to_f
		end
	end
end

# COME BACK TO THIS!
count = priyaGroceries.count
priyaGroceries = priyaGroceries.inject(:+)
priyaGroceriesAvg = priyaGroceries / count
# puts priyaGroceries.round(2)
count = soniaGroceries.count
soniaGroceries = soniaGroceries.inject(:+)
soniaGroceriesAvg = soniaGroceries / count
# puts soniaGroceries.round(2)

priyaGifts = []
soniaGifts = []
CSV.foreach('accounts.csv',headers:true) do |gifts|
	if gifts['Account'] === 'Priya'
		if gifts['Category'] === 'Gifts'
			priyaGifts << gifts['Inflow'].delete('$').delete(',').to_f - gifts['Outflow'].delete('$').delete(',').to_f
		end
	else
		if gifts['Category'] === 'Gifts'
			soniaGifts << gifts['Inflow'].delete('$').delete(',').to_f - gifts['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaGifts.count
priyaGifts = priyaGifts.inject(:+)
priyaGiftsAvg = priyaGifts / count
# puts priyaGifts
count = soniaGifts.count
soniaGifts = soniaGifts.inject(:+)
soniaGiftsAvg = soniaGifts / count
# puts soniaGifts

priyaGym = []
soniaGym = []
CSV.foreach('accounts.csv',headers:true) do |gym|
	if gym['Account'] === 'Priya'
		if gym['Category'] === 'Gym'
			priyaGym << gym['Inflow'].delete('$').delete(',').to_f - gym['Outflow'].delete('$').delete(',').to_f
		end
	else
		if gym['Category'] === 'Gym'
			soniaGym << gym['Inflow'].delete('$').delete(',').to_f - gym['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaGym.count
priyaGym = priyaGym.inject(:+)
# priyaGymAvg = priyaGym / count
# puts priyaGym
count = soniaGym.count
soniaGym = soniaGym.inject(:+)
soniaGymAvg = soniaGym / count
# puts soniaGym

priyautilities = []
soniautilities = []
CSV.foreach('accounts.csv',headers:true) do |utilities|
	if utilities['Account'] === 'Priya'
		if utilities['Category'] === 'Utilities'
			priyautilities << utilities['Inflow'].delete('$').delete(',').to_f - utilities['Outflow'].delete('$').delete(',').to_f
		end
	else
		if utilities['Category'] === 'Utilities'
			soniautilities << utilities['Inflow'].delete('$').delete(',').to_f - utilities['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyautilities.count
priyautilities = priyautilities.inject(:+)
priyautilitiesAvg = priyautilities / count
# puts priyautilities
count = soniautilities.count
soniautilities = soniautilities.inject(:+)
soniautilitiesAvg = soniautilities / count
# puts soniautilities.round(2)

priyaMedicalDental = []
soniaMedicalDental = []
CSV.foreach('accounts.csv',headers:true) do |medicalDental|
	if medicalDental['Account'] === 'Priya'
		if medicalDental['Category'] === 'Medical/Dental'
			priyaMedicalDental << medicalDental['Inflow'].delete('$').delete(',').to_f - medicalDental['Outflow'].delete('$').delete(',').to_f
		end
	else
		if medicalDental['Category'] === 'Medical/Dental'
			soniaMedicalDental << medicalDental['Inflow'].delete('$').delete(',').to_f - medicalDental['Outflow'].delete('$').delete(',').to_f
		end
	end
end

count = priyaMedicalDental.count				
priyaMedicalDental = priyaMedicalDental.inject(:+)
# priyaMedicalDentalAvg = priyaMedicalDental / count
# puts priyaMedicalDental
count = soniaMedicalDental.count
soniaMedicalDental = soniaMedicalDental.inject(:+)
soniaMedicalDentalAvg = soniaMedicalDental / count
# puts soniaMedicalDental.round(2)

priyaBalance = []
soniaBalance = []
CSV.foreach('accounts.csv',headers:true) do |balance|
	if balance['Account'] === 'Priya'
		priyaBalance << balance['Inflow'].delete('$').delete(',').to_f - balance['Outflow'].delete('$').delete(',').to_f
	else
		soniaBalance << balance['Inflow'].delete('$').delete(',').to_f - balance['Outflow'].delete('$').delete(',').to_f
	end
end

priyaBalance = priyaBalance.inject(:+)
# puts priyaBalance.round(2)
soniaBalance = soniaBalance.inject(:+)
# puts soniaBalance.round(2)

## DISPLAY CODE

#inputName = ARGV

#if inputName[0] === 'Priya'
puts ("*" * 100)
puts "Account: Priya === Balance: " + priyaBalance.round(2).to_s
puts ("*" * 100)
puts "Category" + (" "*31) + "| Total Spent | Average Transaction" + (" " * 30)
puts ("-" * 39) + "|" + ("-" * 13) + "|" + ("-" * 46)
puts "Allowance" + (" "*30) + "|" + "$" + priyaAllowance.round(2).to_s +  "      |" + "$" +  priyaAllowanceAvg.round(2).to_s
puts "Car Repairs" + (" "*28) + "|"+ "$" + priyaCarRepairs.round(2).to_s + "       |"+ "$" + priyaCarRepairsAvg.round(2).to_s
puts "Rent" + (" "*35) + "|"+ "$" + priyaRent.round(2).to_s + "     |"+ "$" + priyaRentAvg.round(2).to_s
puts "Entertainment" + (" "*26) + "|"+ "$" + priyaEntertainment.round(2).to_s + "     |" + "$"+ priyaEntertainmentAvg.round(2).to_s
#puts "Household Goods" + (" "*24) + "|" + "$"+ priyaHouseholdGoods.round(2).to_s + + "        |" + "$"+ priyaHouseholdGoodsAvg.round(2).to_s
puts "Fuel" + (" "*35) + "|"+ "$" + priyaFuel.round(2).to_s + + "      |"+ "$" + priyaFuelAvg.round(2).to_s
puts "Clothes" + (" "*32) + "|"+ "$" + priyaClothes.round(2).to_s + + "       |"+ "$" + priyaClothesAvg.round(2).to_s
puts "Education" + (" "*30) + "|"+ "$" + priyaEducation.round(2).to_s + "     |"+ "$" + priyaEducationAvg.round(2).to_s
puts "Groceries" + (" "*30) + "|"+ "$" + priyaGroceries.round(2).to_s + "     |"+ "$" + priyaGroceriesAvg.round(2).to_s
puts "Gifts" + (" "*34) + "|" + "$"+ priyaGifts.round(2).to_s + "     |" + "$"+ priyaGiftsAvg.round(2).to_s
#puts "Gym" + (" "*36) + "|"+ "$" + priyaGym.round(2).to_s + "        |" + "$"+ priyaGymAvg.round(2).to_s
#puts "Medical/Dental" + (" "*25) + "|" + "$"+ priyaMedicalDental.round(2).to_s + "        |"+ "$" + priyaMedicalDentalAvg.round(2).to_s
puts "Utilities" + (" "*30) + "|" + "$"+ priyautilities.round(2).to_s + "      |"+ "$" + priyautilitiesAvg.round(2).to_s
puts "\n"
puts "\n"
#end

#if inputName[0] === 'Sonia'
puts ("*" * 100)
puts "Account: Sonia === Balance: " + soniaBalance.round(2).to_s
puts ("*" * 100)
puts "Category" + (" "*31) + "| Total Spent | Average Transaction" + (" " * 30)
puts ("-" * 39) + "|" + ("-" * 13) + "|" + ("-" * 46)
puts "Allowance" + (" "*30) + "|"+ "$" + soniaAllowance.round(2).to_s + "      |"+ "$" + soniaAllowanceAvg.round(2).to_s
#puts "Car Repairs" + (" "*28) + "|"+ "$" + soniaCarRepairs.round(2).to_s + "        |"+ "$" + soniaCarRepairsvg.round(2).to_s
#puts "Rent" + (" "*35) + "|"+ "$" + soniaRent.round(2).to_s + "        |"+ "$" + soniaRentAvg.round(2).to_s
puts "Entertainment" + (" "*26) + "|"+ "$" + soniaEntertainment.round(2).to_s + "      |"+ "$" + soniaEntertainmentAvg.round(2).to_s
puts "Household Goods" + (" "*24) + "|"+ "$" + soniaHouseholdGoods.round(2).to_s + "     |"+ "$" + soniaHouseholdGoodsAvg.round(2).to_s
#puts "Fuel" + (" "*35) + "|" + "$"+ soniaFuel.round(2).to_s + "        |" + "$"+ soniaFuelAvg.round(2).to_s
puts "Clothes" + (" "*32) + "|"+ "$" + soniaClothes.round(2).to_s + "      |" + "$"+ soniaClothesAvg.round(2).to_s
puts "Education" + (" "*30) + "|"+ "$" + soniaEducation.round(2).to_s + "      |"+ "$" + soniaEducationAvg.round(2).to_s
puts "Groceries" + (" "*30) + "|" + "$"+ soniaGroceries.round(2).to_s + "     |"+ "$" + soniaGroceriesAvg.round(2).to_s
puts "Gifts" + (" "*34) + "|"+ "$" + soniaGifts.round(2).to_s + "      |" + "$"+ soniaGiftsAvg.round(2).to_s
puts "Gym" + (" "*36) + "|"+ "$" + soniaGym.round(2).to_s + "      |"+ "$" + soniaGymAvg.round(2).to_s
puts "Medical/Dental" + (" "*25) + "|"+ "$" + soniaMedicalDental.round(2).to_s + "      |" + "$"+ soniaMedicalDentalAvg.round(2).to_s
puts "Utilities" + (" "*30) + "|"+ "$" + soniautilities.round(2).to_s + "     |"+ "$" + soniautilitiesAvg.round(2).to_s
#end