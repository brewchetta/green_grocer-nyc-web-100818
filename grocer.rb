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
    item_w_coupon = "#{item} W/COUPON"
    if cart[item_w_coupon] != nil
      break if coupon[:num] > cart[item][:count]
      cart[item][:count] -= coupon[:num]
      cart[item][:count] = 0 if cart[item][:count] < 0
      cart[item_w_coupon][:count] += 1
    elsif cart[item] != nil && cart[item_w_coupon] == nil
      break if coupon[:num] > cart[item][:count]
      cart[item][:count] -= coupon[:num]
      cart[item_w_coupon] = {
        price:coupon[:cost],
        clearance: cart[item][:clearance],
        count: 1
      }
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |food,value|
    cart[food][:price] = '%.2f' % (cart[food][:price] * 0.80) if cart[food][:clearance]
    cart[food][:price] = cart[food][:price].to_f
  end
  cart
end

def checkout(cart, coupons)
  total = 0
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  puts cart
  cart.each do |item,value|
    total += cart[item][:price] * cart[item][:count]
  end
  total *= 0.9 if total > 100.00
  total
end
