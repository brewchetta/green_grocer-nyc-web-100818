my_cart = {
      "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
      "KALE"    => {:price => 3.0, :clearance => false, :count => 1},
      "SOY MILK" => {:price => 9.0, :clearance => true, :count => 10}
}

my_coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.0},
  {:item => "SOY MILK", :num =>3, :cost => 5.0}
  
]

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
    cart[food][:price] = '%.2f' % (cart[food][:price] * 0.80) if cart[food][:clearance]
  end
  cart
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  puts cart
  cart
end

checkout(my_cart, my_coupons)
