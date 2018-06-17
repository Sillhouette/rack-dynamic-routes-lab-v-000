class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      desired_item = req.params["items"]

       @@items.each { |item|
         if item.name == desired_item
           item_price = item.price
           resp.write "The price is: #{item_price}"
         else
           resp.write "Item not found"
           resp.status = 404
         end
         }
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
