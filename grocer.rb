require 'pry'

my_cart = {
      "AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},
      "KALE"    => {:price => 3.0, :clearance => false, :count => 1},
      "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},
}

my_coupon = [{:item => "AVOCADO", :num => 2, :cost => 5.0}]

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
  coupons.each do |coupon|
    item = coupon[:item]
    binding.pry
    cart[item][:count] -= coupon[:num]
    cart["#{item} W/COUPON"][:price] = coupon[:cost]
    cart["#{item} W/COUPON"][:clearance] = cart[item][:clearance]
    cart["#{item} W/COUPON"][:count] == nil ? cart["#{item} W/COUPON"][:count] = 1 : cart["#{item} W/COUPON"][:count] += 1
  end
  puts cart
  cart
end

apply_coupons(my_cart,my_coupon)


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
