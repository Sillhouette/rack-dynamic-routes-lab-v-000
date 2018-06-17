class Application

  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/cart/)
      if @@cart == []
        resp.write("Your cart is empty.")
      else
        cart.each do |item|
          resp.write("#{item}\n")
        end
    elsif req.path.match(/add/)
     item = req.params["item"]

     if @@items.include?(item)
       item_price = item.price
       resp.write "The price is: #{item.price}"
     else
       resp.write "We don't have that item"
     end
    end
  end
end
