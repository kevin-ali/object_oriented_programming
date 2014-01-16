class SalesTax
	
	def initialize(price)
		@tax_rate = 0.10
		@price = price
	end

	def calculate_sales_tax
		@price * @tax_rate
	end

	def calculate_total
		@price + calculate_sales_tax
	end

end


class NoTax < SalesTax

	def initialize(price)
		@tax_rate = 0
		@price = price
	end

end

class ImportedNoTax < SalesTax

	def initialize(price)
		@tax_rate = 0.05
		@price = price
	end

end


class ImportedSalesTax < SalesTax 
	def initialize(price)
		@tax_rate = 0.15
		@price = price
	end
end


=begin
basket_a_tax = 0
basket_a_total = 0

book = NoTax.new(12.49)
basket_a_tax += book.calculate_sales_tax
basket_a_total += book.calculate_total
puts "1 book: #{book.calculate_total}"

musiccd = SalesTax.new(14.99)
basket_a_tax += musiccd.calculate_sales_tax
basket_a_total += musiccd.calculate_total
puts "1 music cd: #{musiccd.calculate_total}"

chocolate = NoTax.new(0.85)
basket_a_tax += chocolate.calculate_sales_tax
basket_a_total += chocolate.calculate_total
puts "1 chocolate bar: #{chocolate.calculate_total}"

puts "Sales Taxes: #{basket_a_tax}"
puts "Total: #{basket_a_total}"
=end

i = 0

puts "How many items are in your basket?"
num = gets.chomp
items = []
prices = []
total_sales_tax = 0
total_price = 0

until i == num.to_i
	i += 1
	puts "What is the name of your item?"
	item = gets.chomp
	items << item
	
	puts "What is the price?"
	price = gets.chomp
	
	puts "Does this item require sales tax?"
	is_salestax = gets.chomp

	puts "Is this item imported?"
	is_imported = gets.chomp	

		if is_salestax == "yes" && is_imported == "yes"
			new_item = ImportedSalesTax.new(price.to_i)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total
			total_price += new_item.calculate_total	
		
		elsif is_salestax == "yes" && is_imported == "no"
			new_item = SalesTax.new(price.to_i)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total	
			total_price += new_item.calculate_total

		elsif is_salestax == "no" && is_imported == "yes"
			new_item = ImportedNoTax.new(price.to_i)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total	
			total_price += new_item.calculate_total

		elsif is_salestax == "no" && is_imported == "no" 
			new_item = NoTax.new(price.to_i)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total	
			total_price += new_item.calculate_total

		end

end

puts ""
i=0
until i == num.to_i
	i += 1
	puts "#{items[i-1]}: #{prices[i-1]}"
end

puts ""
puts "------------------"
puts "Total Sales Tax: #{total_sales_tax}"
puts "Total Price: #{total_price}"
