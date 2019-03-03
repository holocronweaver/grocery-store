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
      #TODO: Convert each row to a Customer object, add to customers.
    end
    return customers
  end

  def self.find(id)
    # returns an instance of `Customer` where the value of the id
    # field in the CSV matches the passed parameter
    #TODO: Use all.find - the power of enumerables!
  end

end
