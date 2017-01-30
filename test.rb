require_relative "./functions.rb"
require 'csv'

def test_equality(expected, actual)
	if expected == actual
		puts "Pass"
	else
		puts "Fail. Expected #{expected}, but got #{actual}"
	end
end

def testTotalAverage
	#SET_UP
	#using test csv file

	#initial_values for new DataClass
	test = DataClass.new
	test.initial_values

	#addData(row)
	CSV.foreach("test.csv", {headers: true, return_headers: false}) do |row|
		test.addData(row)
	end

	#EXERCISE
	test.calculateFinalValues

	expectedTotal = 4
	expectedAverage = 2

	#check
	actualTotal = test.getTotal
	puts test_equality(expectedTotal, actualTotal)

	actualAverage = test.getAverage
	puts test_equality(expectedAverage, actualAverage)

end

def testCategoryNames
	#SET_UP
	#using test csv file

	#initial_values for new DataClass
	test = AccountClass.new
	test.initial_values

	#EXERCISE
	CSV.foreach("test2.csv", {headers: true, return_headers: false}) do |row|
		test.addCategory(row)
	end

	#check
	expectedKeyArray = ["a","b","c"]
	puts test_equality(expectedKeyArray, test.getCategoryData.keys)
end

testTotalAverage()
testCategoryNames()
