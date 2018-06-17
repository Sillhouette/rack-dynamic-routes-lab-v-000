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
         resp.write "Route not found"
         resp.status = 404
       end

    else
      resp.write "Route not found"
      resp.status = 404
    end
  end
end
