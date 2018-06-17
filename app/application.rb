class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      binding.pry
    if req.path.match(/items/)
      desired_item = req.params["items"]

        binding.pry
       if @@items.collect { |item|
         if item.name == desired_item
           item_price = item.price
           resp.write "The price is: #{item_price}"
         end
        }
      else
        resp.write "Item not found"
        resp.status = 404
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
