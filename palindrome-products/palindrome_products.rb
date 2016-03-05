class Palindromes
	attr_accessor :products_final

	def initialize(args)  
			@max_factor = args[:max_factor]

			if args[:min_factor].nil?
				@edge_case = true
				@min_factor =  1
			else
				@min_factor = args[:min_factor]
			end
	end

	def generate 
		@products = {}
		factors = (@min_factor..@max_factor)
		factors.each do |factor|
			@clone = @min_factor
			while @clone<= @max_factor
					product = @clone * factor
					@products[ [@clone, factor] ] = product if product.to_s.chars == product.to_s.chars.reverse 
					@clone +=1 
			end
			@clone = @min_factor 
		end
		@products
	end

	def largest
		max_value = @products.values.max 
		@correct_element = @products.select {|k, val| val == max_value }.to_a[0] #=>{[99, 91]=>9009}
		@products_final = {}
		products_final[@correct_element[0]] = @correct_element[1]
		self
	end

	def smallest
		min_value = @products.values.min
		@correct_element = @products.select {|k, val| val == min_value }.to_a[0] #=>{[99, 91]=>9009}
		@products_final = {}
		products_final[@correct_element[0]] = @correct_element[1]
		self
	end

	def value
		products_final.values.pop
	end

	def factors
		[products_final.keys.flatten.sort]
	end
end
