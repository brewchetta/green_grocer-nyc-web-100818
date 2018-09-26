require 'pry'

my_cart = [
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"KALE"    => {:price => 3.0, :clearance => false}}
]

def consolidate_cart(cart)
  new_cart = {}
  cart.each do |item|
    item.each do |name, values|
      new_cart[name] == nil ? new_cart[name] = {count: 1} : new_cart[name][:count] += 1
      values.each do |k,v|
        new_cart[name][k] = v
#        binding.pry
      end
    end
  end
  new_cart
end


def apply_coupons(cart, coupons)
  item = coupons[:item]
  cart[item] == nil ? puts "You have a coupon but no item!" : cart[item]
  end

    cart["#{item} W/COUPON"][key] = value if key != :item
  end
  puts cart
  cart
end



def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
