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
    #TODO: Raise ArgumentError if product name already in products list.

    #TODO: Add the data to products.
  end

end
