require '.\Catalog.rb'

json_file_name = 'c:.\Categories.json'

if ARGV.size == 1
  json_file_name = ARGV[0]
end


if !File.file?(json_file_name)
  puts "File #{json_file_name} NOT FOUND -- EXITING"

  return
end



cat = Category.new("category", json_file_name)

n = cat.get_sorted_product_names

puts "=====================  products list sorted by Product names  ====================="
puts
puts n

puts
puts


n = cat.get_sorted_products

puts "=====================  products details sorted by Product names  ====================="
puts
puts n

