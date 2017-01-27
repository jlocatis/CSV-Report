require 'csv'
require 'pry'

accounts = {}

CSV.foreach('accounts.csv', {headers:true, return_headers:false}) do |row|
  person = row['Account'].chomp
  ##balance first, categories second
  #setup accounts
  if !accounts[person]
      accounts[person] = {
      total: 0.00,
      categories: {
      }
    }
  end

  #define which account you are on
  current_person = accounts[person]

  #do transaction math
  outflow = row['Outflow'].delete('$').delete(',').to_f
  inflow = row['Inflow'].delete('$').delete(',').to_f
  amount = inflow - outflow

  #update current balance total
  current_person[:total] += amount

  #set current category
  category = row['Category'].chomp

  #create categories
  if !current_person[:categories][category]
    current_person[:categories][category] = {
      total_spent: 0.00,
      average_transaction: 0.00,
      no_of_transactions: 0
    }
  end

  #set current category
  current_category = current_person[:categories][category]

  #do math on category
  outflow = row['Outflow'].delete('$').delete(',').to_f
  inflow = row['Inflow'].delete('$').delete(',').to_f
  amount = inflow - outflow

  #update total spent and number of transactions within category
  current_category[:total_spent] += amount
  current_category[:no_of_transactions] += 1

  #do math for average transaction within category
  count = current_category[:no_of_transactions]
  total = current_category[:total_spent]
  average = total / count
  current_category[:average_transaction] += average
end

def printTerminal(hash, name)
  hash.each do |key, value|
    current_name = key
    if current_name == name
      printBalance = "$" + value[:total].round(2).to_s
      puts ("*" * 80)
      puts "Account: #{key} *** Balance: " + printBalance
      puts ("*" * 80)
      puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
      puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)

      value[:categories].each do |key, value|
        printTotal = "$" + value[:total_spent].round(2).to_s
        printAverage = "$" + value[:average_transaction].round(2).to_s
        space1 = 28 - key.length
        space2 = 13 - printTotal.length
        puts key + (" "*space1) + "|" + printTotal+ (" "*space2) + "|" + printAverage
      end
    end
  end
end

def printTerminalAll(hash)
  hash.each do |key, value|
    printBalance = "$" + value[:total].round(2).to_s
    puts ("*" * 80)
    puts "Account: #{key} *** Balance: " + printBalance
    puts ("*" * 80)
    puts "Category" + (" "*20) + "| Total Spent | Average Transaction" + (" " * 17)
    puts ("-" * 28) + "|" + ("-" * 13) + "|" + ("-" * 37)

    value[:categories].each do |key, value|
      printTotal = "$" + value[:total_spent].round(2).to_s
      printAverage = "$" + value[:average_transaction].round(2).to_s
      space1 = 28 - key.length
      space2 = 13 - printTotal.length
      puts key + (" "*space1) + "|" + printTotal+ (" "*space2) + "|" + printAverage
    end
  end
end

def printHTMLAll(hash)
  hash.each do |key, value|
    printBalance = "$" + value[:total].round(2).to_s
    puts "<h1>#{key}</h1>"
    puts "<p>" + printBalance + "</p>"
    puts "<hr>"
    puts "<table>"
    puts "\t<tr>"
    puts "\t\t<th>Category</th>"
    puts "\t\t<th>Total Spent</th>"
    puts "\t\t<th>Avg. Transaction</th>"
    puts "\t</tr>\n"

    value[:categories].each do |key, value|
      printTotal = "$" + value[:total_spent].round(2).to_s
      printAverage = "$" + value[:average_transaction].round(2).to_s
      puts "\t<tr>"
      puts "\t\t<td>" + key + "</td>"
      puts "\t\t<td>" + printTotal + "</td>"
      puts "\t\t<td>" + printAverage + "</td>"
      puts "\t<tr>"
    end
    puts "</table>"
  end
end

def printHTML(hash, name)
  hash.each do |key, value|
    current_name = key
    if current_name == name
      printBalance = "$" + value[:total].round(2).to_s
      puts "<h1>#{key}</h1>"
      puts "<p>" + printBalance + "</p>"
      puts "<hr>"
      puts "<table>"
      puts "\t<tr>"
      puts "\t\t<th>Category</th>"
      puts "\t\t<th>Total Spent</th>"
      puts "\t\t<th>Avg. Transaction</th>"
      puts "\t</tr>\n"

      value[:categories].each do |key, value|
        printTotal = "$" + value[:total_spent].round(2).to_s
        printAverage = "$" + value[:average_transaction].round(2).to_s
        puts "\t<tr>"
        puts "\t\t<td>" + key + "</td>"
        puts "\t\t<td>" + printTotal + "</td>"
        puts "\t\t<td>" + printAverage + "</td>"
        puts "\t<tr>"
      end
      puts "</table>"
    end
  end
end

def printCSVAll(hash)
  hash.each do |key, value|
    puts "Category,Total Spent,Average Transaction"
    value[:categories].each do |key, value|
      printTotal = "$" + value[:total_spent].round(2).to_s
      printAverage = "$" + value[:average_transaction].round(2).to_s
      puts key + "," + printTotal + "," + printAverage
    end
  end
end

def printCSV(hash, name)
  hash.each do |key, value|
    current_name = key
    if current_name === name
      puts "Category,Total Spent,Average Transaction"
      value[:categories].each do |key, value|
        printTotal = "$" + value[:total_spent].round(2).to_s
        printAverage = "$" + value[:average_transaction].round(2).to_s
        puts key + "," + printTotal + "," + printAverage
      end
    end
  end
end

## DISPLAY CODE
input = ARGV

if input.include? 'HTML'
  index0 = input.index('HTML')
  index1 = input.slice!(index0)
  inputName = input[0]
  if inputName == nil
    printHTMLAll(accounts)
  else
    printHTML(accounts, inputName)
  end
elsif input.include? 'CSV'
  index0 = input.index('CSV')
  index1 = input.slice!(index0)
  inputName = input[0]
  if inputName == nil
    printCSVAll(accounts)
  else
    printCSV(accounts, inputName)
  end
else
  inputName = input[0]
  if inputName == nil
    printTerminalAll(accounts)
  else
    printTerminal(accounts, inputName)
  end
end