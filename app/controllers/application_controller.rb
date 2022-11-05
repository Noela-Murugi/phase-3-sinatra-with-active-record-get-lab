class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
  # add routes
  # get '/bakeries' do
  #   "Hello World"
  # end
  get "/bakeries" do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get "/bakeries/:id" do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get "/baked_goods/most_expensive" do
    highest_price = BakedGood.maximum(:price)
    most_expensive_baked_good  = BakedGood.find_by(price: highest_price).to_json
  end
end
