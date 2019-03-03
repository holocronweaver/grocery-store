require 'csv'

class Customer
  # attr_reader: create getter only, no setter
  attr_reader :id
  # attr_accessor: create getter and setter
  # https://apidock.com/ruby/Module/attr_accessor
  attr_accessor :email, :address

  def initialize(id, email, address)
    @id = id
    @email = email
    @address = address
  end

  def self.all
    # returns a collection of `Customer` instances, representing all
    # of the Customer described in the CSV file
    customers = []
    headers = ['id', 'email', 'address1', 'city', 'state', 'zip code']
    CSV.foreach("data/customers.csv", :headers => headers).each do |row|
      address = [row['address1'], row['city'], row['state'], row['zip code']].join(', ')
      customers << Customer.new(row['id'].to_i, row['email'], address)
    end
    return customers
  end

  def self.find(id)
    # returns an instance of `Customer` where the value of the id
    # field in the CSV matches the passed parameter
    self.all.find{ |customer| customer.id == id }
  end

end
