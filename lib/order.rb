require 'csv'
require_relative 'customer'

class Order
  attr_reader :id, :products, :customer, :fulfillment_status

  def initialize(id, products, customer, fulfillment_status = :pending)
    @id = id
    @products = products
    @customer = customer

    # Set fulfillment status.
    valid_fulfillment_statuses = [:pending, :paid, :processing, :shipped, :complete]
    if valid_fulfillment_statuses.include? fulfillment_status
      @fulfillment_status = fulfillment_status
    else
      raise ArgumentError, "Fufillment status must be one of #{valid_fulfillment_statuses}; received #{fulfillment_status}"
    end
  end

  def total
    # calculate the total cost of the order by:
    # - Summing up the products
    # - Adding a 7.5% tax
    # - Rounding the result to two decimal places
    sum = @products.values.sum
    # or you could do: sum = @products.sum{ |key, value| value }
    return (1.075 * sum).round(2)
  end

  def add_product(product_name, price)
    if @products.key? product_name
      raise ArgumentError, "That product name is already present"
    end

    @products[product_name] = price
  end

  def self.all
    # TODO: returns a collection of `Order` instances, representing all of
    # the Orders described in the CSV file
    orders = []
    headers = ['id', 'products', 'customer id', 'status']

    CSV.foreach("data/orders.csv", :headers => headers).each do |row|
      #TODO: Convert each row to an Order object and add to orders.
    end
    return orders
  end

  def self.find(id)
    # returns an instance of `Order` where the value of the id field
    # in the CSV matches the passed parameter

    #TODO: Use `all.find` - the power of enumerables!
  end

end
