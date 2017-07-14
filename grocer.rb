def consolidate_cart(cart)
    new_cart = {}
        cart.each do |grocery_item|
            grocery_item.each do |key, value|
            if new_cart.include?(key)
                new_cart[key][:count] += 1
                else new_cart[key] = {
                    :price => value[:price],
                    :clearance => value[:clearance],
                    :count => 1
                }
end
end
            end
        new_cart
        end

def apply_coupons(cart, coupons)
    discounted_cart = {}
  cart.each do |grocery_item, data|
      coupons.each do |coupon|
          if grocery_item == coupon[:item] && data[:count] >= coupon[:num]
              data[:count] = data[:count] - coupon[:num]
              if discounted_cart["#{grocery_item} W/COUPON"]
                            discounted_cart["#{grocery_item} W/COUPON"][:count] += 1
                          else
                            discounted_cart["#{grocery_item} W/COUPON"] = {:price => coupon[:cost], :clearance => data[:clearance], :count => 1}
                            end
              end
end
      discounted_cart[grocery_item] = data
      end
 discounted_cart
 end


def apply_clearance(cart)
  cart.each do |item, data|
      if data[:clearance] == true
          data[:price] = (data[:price]*0.8).round(2)
end
end
  cart
  end



def checkout(cart, coupons)
     cart_consolidate = consolidate_cart(cart: cart)
     cart_coupons = apply_coupons(cart:cart_consolidate, coupons:coupons)
     cart_check = apply_clearance(cart:cart_coupons)
      total = 0
      cart_check.each do |item, attribute|
            total += attribute[:count] * attribute[:price]
         end
     return total = total > 100 ? (total*0.9).round(1) : total
end







