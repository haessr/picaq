class Bank
  def least_number_of_dollars(dollars, amount)
    dollars = dollars.sort.reverse
    result = []
    dollars.each do |dollar|
      subamount = amount
      count = 0
      until subamount == 0
        subamount -= dollar
        break if subamount < 0
        amount = subamount
        count += 1
      end
      # puts "#{dollar}: #{count}"
      result << [dollar, count]
      return result.inject(0) { |sum, i| sum + i[1] } if subamount == 0
    end
    raise ArgumentError unless amount == 0
  end
end

b = Bank.new
puts b.least_number_of_dollars([1,2,5], 11)
# puts b.least_number_of_dollars([2], 3)
puts b.least_number_of_dollars([1,2,4], 8)
