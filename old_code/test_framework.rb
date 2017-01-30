def testEquality(expected, actual)
	if expected == actual
		puts "Pass"
	else
		puts "Fail. Expected #{expected}, but got #{actual}."
	end
end

def testGreaterThan(expected, actual)
	if expected > actual
		puts 