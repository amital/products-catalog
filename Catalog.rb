require 'json'

class Product
  attr_accessor :name
  attr_accessor :price
  attr_accessor :on_stock

  def initialize (name, price, on_stock)
    @name = name
    @price = price
    @on_stock = on_stock
  end

  def Add_Attribute(attr, value)
    self.class.class_eval { attr_accessor attr }
    send("#{attr}=", value)
  end

  def self.create_product(parent, prod)
    pr = Product.new(prod[0], prod[1]['price'], prod[1]['on-stock'])
    pr.Add_Attribute("category", parent.name)

    prod[1].each { |e|
      if e[0] != "price" && e[0] != "on-stock" then
        pr.Add_Attribute(e[0], e[1])
      end
    }
    return pr
  end

  def list_attributes
    self.instance_variables.map do |attribute|
      { attribute => self.instance_variable_get(attribute) }
    end
  end

  def print
    result = ""

    root = Category.new("category", nil, Category.hash)
    c = root.category_list(self)
    self.category = c
    attr = list_attributes
    attr.each do |a|
      prop = a.keys[0][1..-1]
      val = a.values[0]
      result += "#{prop} = #{val}\r\n"
    end
    result
  end

end

class Category
  attr_accessor :name
  attr_accessor :siblings
  attr_accessor :products
  @@hash = {}

  def initialize(name, jsonFile = nil, hash = nil)
    @name = name
    @siblings = []
    @products = []

    if !jsonFile.nil?
      @@hash = load(name, jsonFile, hash)
      build_from_hash(@@hash, self)
    elsif !hash.nil?
      build_from_hash(hash, self)
    end
  end

  def self.hash
    h = @@hash
    return h
  end

  def build_from_hash(input, parent)
    input.each { |item|
      if item[1].key?("price") then
        pr = Product.create_product(parent, item)
        parent.products << pr
      else
        cat = Category.new(item[0])
        parent.siblings << cat
        build_from_hash(item[1], cat)
      end
    }
  end

  def list_attributes
    self.instance_variables.map do |attribute|
      { attribute => self.instance_variable_get(attribute) }
    end
  end

  def get_sorted_products
    products = get_products(self)
    products = products.sort_by { |prd| prd.name }
    prd = ""
    products.each do |pr|
      prd += pr.print + "============================\r\n"
    end
    return prd
  end

  def category_list(item, root = nil)
    if root.nil?
      root = Category.new("category", nil, @@hash)
      return root.category_list(item, root)
    end

    if root.products.select { |prd| prd.name == item.name }.length == 1
      return item.name
    end

    if root.siblings.size == 0
      return ""
    end

    root.siblings.each do |e|
      s = category_list(item, e)
      if s.length > 0
        return e.name + '/' + s
      end
    end
    return ""
  end

  def get_sorted_product_names
    products = get_products(self)
    products = products.sort_by { |prd| prd.name }
    result = ""
    products.each { |prd|
      if result.length == 0
        result = prd.name
      else
        result += ', ' + prd.name
      end
    }
    return result
  end

  def get_products(catalog = self)
    if catalog == nil
      return []
    end

    if catalog.products.length > 0
      return catalog.products
    end

    result = []
    catalog.siblings.each { |item|
      n = get_products(item)
      if n.length > 0
        result += n
      end
    }
    return result
  end

  private

  def load(name, jsonFile, hash)
    if hash.nil?
      file = File.read(jsonFile)
      hash = JSON.parse(file)
    end

    hash = hash[name]

    return hash
  end

end

