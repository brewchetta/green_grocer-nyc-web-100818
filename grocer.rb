def consolidate_cart(cart)
  new_cart = {}
  cart.each do |item|
    item.each do |name, values|
      new_cart[name] == nil ? new_cart[name] : new_cart[name][:count] += 1 
      value.each do
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
