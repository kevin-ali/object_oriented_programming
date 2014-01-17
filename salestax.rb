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
		@tax_rate = 0.00
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

=begin
i = 0

puts "How many items are in your basket?"
num = gets.chomp
items = []
prices = []
total_sales_tax = 0
total_price = 0

until i == num.to_f
	i += 1
	puts "What is the name of your item?"
	item = gets.chomp
	item.upcase!
	items << item
	
	puts "What is the price?"
	price = gets.chomp
	
	puts "Does this item require sales tax?"
	is_salestax = gets.chomp
	is_salestax.downcase!

	puts "Is this item imported?"
	is_imported = gets.chomp
	is_imported.downcase!	

		if is_salestax == "yes" && is_imported == "yes"
			new_item = ImportedSalesTax.new(price.to_f)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total
			total_price += new_item.calculate_total	
		
		elsif is_salestax == "yes" && is_imported == "no"
			new_item = SalesTax.new(price.to_f)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total	
			total_price += new_item.calculate_total

		elsif is_salestax == "no" && is_imported == "yes"
			new_item = ImportedNoTax.new(price.to_f)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total	
			total_price += new_item.calculate_total

		elsif is_salestax == "no" && is_imported == "no" 
			new_item = NoTax.new(price.to_f)
			total_sales_tax += new_item.calculate_sales_tax
			prices << new_item.calculate_total	
			total_price += new_item.calculate_total

		end

end

puts ""
i=0
until i == num.to_i
	i += 1
	puts "#{items[i-1]}: $#{prices[i-1].round(2)}" 
end

puts ""
puts "------------------"
puts "Total Sales Tax: $#{total_sales_tax.round(2)}"
puts "Total Price: $#{total_price.round(2)}"

=end

$tax_total = 0
$price_total = 0


class Receipt
	attr_accessor :perfume_choose

	def initialize(item)
		@item = item
	end

	def item_select
		if @item.include? "chocolate"

			if @item.include? "imported"
				puts "Would you like the imported chocolate listed at 10.00 or 11.25?"
				@chocolate_choice = gets.chomp

				@item_tax = ImportedNoTax.new(@chocolate_choice.to_f)
				puts "#{@item.upcase}: #{@item_tax.calculate_total.round(2)}"
				$tax_total += @item_tax.calculate_sales_tax.round(2)
				$price_total += @item_tax.calculate_total.round(2)
			else
				@item_tax = NoTax.new(0.85)
				puts "#{@item.upcase}: #{@item_tax.calculate_total.round(2)}"
				$tax_total += @item_tax.calculate_sales_tax.round(2)
				$price_total += @item_tax.calculate_total.round(2)
			end

		elsif @item.include? "book"
			@item_tax = SalesTax.new(12.49)
			puts "#{@item.upcase}: #{@item_tax.calculate_total.round(2)}"
			$tax_total += @item_tax.calculate_sales_tax.round(2)
			$price_total += @item_tax.calculate_total.round(2)

		elsif (@item.include? "music") || (@item.include? "cd")
			@item_tax = SalesTax.new(14.99)
			puts "#{@item.upcase}: #{@item_tax.calculate_total.round(2)}"
			$tax_total += @item_tax.calculate_sales_tax.round(2)
			$price_total += @item_tax.calculate_total.round(2)

		elsif @item.include? "perfume"
			if @item.include? "imported"

				puts "Would you like the imported perfume listed at 27.99 or 47.50?"
				@perfume_choose = gets.chomp

				@item_tax = ImportedSalesTax.new(perfume_choose.to_f)
				puts "#{@item.upcase}: #{@item_tax.calculate_total.round(2)}"
				$tax_total += @item_tax.calculate_sales_tax.round(2)
				$price_total += @item_tax.calculate_total.round(2)
				
			else
				@item_tax = SalesTax.new(18.99)
				puts "#{@item.upcase}: #{@item_tax.calculate_total.round(2)}"
				$tax_total += @item_tax.calculate_sales_tax.round(2)
				$price_total += @item_tax.calculate_total.round(2)
			end

		elsif (@item.include? "headache") || (@item.include? "pills")
				@item_tax = NoTax.new(9.75)
				puts "#{@item.upcase}: #{@item_tax.calculate_total.round(2)}"
				$tax_total += @item_tax.calculate_sales_tax.round(2)
				$price_total += @item_tax.calculate_total.round(2)
		elsif @item == "done"
			puts ""
		else
			puts "Sorry, I don't recognize that item!  Why don't you try another?"		

		end
	end

end



done = false
until done == true
	puts ""
	puts "Please enter grocery item (or type 'done' to exit):"
	item = gets.chomp
	
	if item == "done" 
		done = true
	end


	testy = Receipt.new(item)
	testy.item_select
end

puts "------------"
puts "TOTAL TAX: #{$tax_total.round(2)}"
puts "TOTAL AMOUNT: #{$price_total.round(2)}"

