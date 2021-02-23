[[_TOC_]]


# products-catalog

The class file is Catalog.rb


## Classes
 ### class Category
This class is responsible for uploading and parsing the json file, and creating a catalog tree from it
The json file is read and parsed by creating the root of the catalog tree `root = Category.new("category", json_file_name)`
after loading and creating catalog two main fuctions can be performrd:
- `root.get_sorted_product_names` Returns all products names sorted.
- `root.get_sorted_products` Returns alist of all products + attributes sorted by `Prodct.name`
- An auxilary method `root.get_products` Returns an array containing all Products

 ### class Products
This class represents all product leafs in the catalog tree. Each product has 3 common attributes:
- `name`
- `price`
- `on_stock`
and several dynamic properties appropriate to this product type

## Json File
A default catalog is loaded from the file `Categories.json`

## Command line interface
The command `ruby Main.rb Categories.json` will run a sample program that will load the optioanl `Categories.json` and will print a list of sorted Product names and a list of all products + all their attributes.


## p.s.
#### I didn't have permisson to install the Heroku CLI on my laptop so the code is only in github repo https://github.com/amital/products-catalog

To sum the expiriance this was verry nice assignment and I enjoyed learrning `Ruby` from scratch...