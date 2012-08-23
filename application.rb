load 'classes/customer.rb'

customers = [
  {:name => 'Luiz', :phone => '99858693',:age => 22},
  {:name => 'Gabriela', :phone => '12345678', :age => 16},
  {:name => 'Ana Luiza', :phone => '87654321', :age => 11}
]

customers.each do |customer|
  Customer.create(:name => customer[:name], :phone => customer[:phone], :age => customer[:age])
end

customer_first = Customer.first
customers = Customer.all(:order => 'name ASC')

puts "#{customer_first.name} - #{customer_first.phone} - #{customer_first.age} \n\n"
puts "Customer : #{customers.size} \n\n"

customers.each { |customer| puts "#{customer.name} - #{customer.phone} - #{customer.age} \n\n" }

