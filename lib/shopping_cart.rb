# require './lib/product'

class ShoppingCart
  attr_accessor :name,
                :capacity,
                :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def product_breakdown
    Hash[:meat, @products.select { |product| product.category == :meat }]
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end
  end

  def percentage_occupied
    unrounded_percent = total_number_of_products/@capacity.to_f * 100
    rounded_percent = unrounded_percent.round(2)
  end

  def is_full?
    total_number_of_products > @capacity
  end

  def total_number_of_products
    product_counter = 0
    products.each do |product|
      product_counter += product.quantity
    end
    product_counter
  end

  def details
    Hash[:name, @name, :capacity, @capacity]
  end

  def add_product(product)
    @products << product
  end
end
