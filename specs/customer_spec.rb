require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/customer'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Customer Wave 1" do
  ID = 123
  EMAIL = "a@a.co"
  ADDRESS = {
    street: "123 Main",
    city: "Seattle",
    state: "WA",
    zip: "98101"
  }.freeze

  describe "#initialize" do
    it "Takes an ID, email and address info" do
      cust = Customer.new(ID, EMAIL, ADDRESS)

      cust.must_respond_to :id
      cust.id.must_equal ID

      cust.must_respond_to :email
      cust.email.must_equal EMAIL

      cust.must_respond_to :address
      cust.address.must_equal ADDRESS
    end
  end
end

# TODO: remove the 'x' in front of this block when you start wave 2
xdescribe "Customer Wave 2" do
  describe "Customer.all" do
    it "Returns an array of all customers" do
      customers = Customer.all

      customers.length.must_equal 35
      customers.each do |c|
        c.must_be_kind_of Customer
      end
    end

    it "Returns accurate information about the first customer" do
      first = Customer.all.first
      first.id.must_equal 1
    end

    it "Returns accurate information about the last customer" do
      last = Customer.all.last
      last.id.must_equal 35
    end
  end

  describe "Customer.find" do
    it "Can find the first customer from the CSV" do
      first = Customer.find(1)

      first.must_be_kind_of Customer
      first.id.must_equal 1
    end

    it "Can find the last customer from the CSV" do
      last = Customer.find(35)

      last.must_be_kind_of Customer
      last.id.must_equal 35
    end

    it "Returns nil for a customer that doesn't exist" do
      expect(Customer.find(53145)).must_be_nil
    end
  end
end
