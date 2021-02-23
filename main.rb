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

puts "=====================  products list sorted by product names  ====================="
puts
puts n

puts
puts


n = cat.get_sorted_products

puts "=====================  products details sorted by product names  ====================="
puts
puts n


=begin
p n[0]
p n[0].name

p cat.instance_variables

p cat.list_attributes

prod = Product.new("cat", 2.35, 7)
p prod.list_attributes
p prod.list_attributes[1]
p prod.list_attributes[2]
p prod.list_attributes[2].class
p prod.list_attributes[2].keys[0]
p prod.list_attributes[2].keys[0][1..-2]
p prod.list_attributes[2][:@on_stock]
p prod.list_attributes[2].values
p prod.list_attributes[2].values[0]
puts prod.print

p n

p ARGV.length

#pp data_hash =>
p data_hash["category"]["animal"]["canidae"]["dog"]["buldog"]["buldog1"]
p data_hash["category"]["animal"]["canidae"]["dog"].keys
pp data_hash["category"]["animal"]["canidae"]["dog"].values
pp data_hash["category"]["animal"]["canidae"]["dog"]["buldog"]["buldog1"]["sex"]
pp data_hash.keys
puts "==========================="
p data_hash["category"]["animal"]["canidae"]["dog"].key?("labrador")
p data_hash["category"]["animal"]["canidae"]["dog"].values
p data_hash["category"]["animal"]["canidae"]["dog"]["buldog"]["buldog1"].key?("price")
p data_hash["category"]["animal"]["canidae"]["dog"]["buldog"]["buldog1"].has_value?("male")
p data_hash["category"]["animal"]["canidae"]["dog"]["buldog"]["buldog1"].key("male")
p data_hash["category"]["animal"]["canidae"]["dog"]["buldog"].keys[0]
p data_hash["category"]["animal"]["canidae"]["dog"]["buldog"]
p data_hash["category"]["animal"]["canidae"]["dog"]["buldog"]["buldog1"].values
bl = data_hash["category"]["animal"]["canidae"]["dog"]
p bl
cat = data_hash["category"]
puts "==============================  cat  ==================================="
p cat
root.build_from_hash(cat, root)

puts "==============================  build_from_hash  ==================================="
p root

n = root.get_sorted_product_names(root)
p n
puts "+++++++++++++++++++++++++++++++++++++++"
p root
p root.siblings.size
p root.siblings[0]
p root.siblings[1].siblings[0]
p root.siblings[1].siblings[1]
p root.siblings[1].siblings[2]
p root.siblings[1]
p root.siblings[1].siblings[0]
p root.siblings[2]
p root.siblings[3]
p root.products
p root.products[0]
p root.siblings[0].products[0].name
p root.siblings[0].products[0].sex
p root.siblings[0].products[1].name
p root.siblings[0].products[1].sex
=end
