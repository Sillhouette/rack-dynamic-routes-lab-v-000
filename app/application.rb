class Application

  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
     item = req.params["item"]

     if @@items.include?(item)
       item_price = item.price
       resp.write "The price is: #{item_price}"
     else
       resp.write "We don't have that item"
     end
   else
     resp.write "Error message"
    end
  end
end
