require 'csv'

priya = []
sonia = []

def testFunction(test)
account1 = []
account2 = []

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
end