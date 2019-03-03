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
end
