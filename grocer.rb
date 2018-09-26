require 'pry'

my_cart = {
      "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
      "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}

my_coupon = [{:item => "AVOCADO", :num => 2, :cost => 5.0}]

def consolidate_cart(cart)
  new_cart = {}
  cart.each do |item|
    item.each do |name, values|
      new_cart[name] == nil ? new_cart[name] = {count: 1} : new_cart[name][:count] += 1
      values.each do |k,v|
        new_cart[name][k] = v
      end
    end
  end
  new_cart
end


def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    cart[item][:count] -= coupon[:num]
    new_item = "#{item} W/COUPON"
    binding.pry
    cart[new_item] = {
      price:coupon[:cost],
      clearance: cart[item][:clearance],
      count: 1
    }
  end
  cart
end

def apply_clearance(cart)
  cart.each do |food,value|
    cart[food][:price] *= 0.8 if cart[food][:clearance]
  end
end

def checkout(cart, coupons)
  # code here
end
