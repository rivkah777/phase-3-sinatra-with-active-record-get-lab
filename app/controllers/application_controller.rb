class ApplicationController < Sinatra::Base
  set default_content_type: "application/json"
  
  #  returns an array of JSON objects for all bakeries in the database.
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
    # returns a single bakery as JSON with its baked goods nested in an array. Use the id from the URL to look up the correct bakery. 
    #(HINT: you'll need to pass in some custom options to the #to_json method.)
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # returns an array of baked goods as JSON, sorted by price in descending order. (HINT: how can you use Active Record to sort the baked goods in a particular order?)
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # returns the single most expensive baked good as JSON. (HINT: how can you use Active Record to sort the baked goods in a particular order?)
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

end